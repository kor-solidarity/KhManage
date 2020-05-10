package com.kh.manage.timeLine.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.CommonsUtils;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.timeLine.model.service.TimeLineService;
import com.kh.manage.timeLine.model.vo.Comment;
import com.kh.manage.timeLine.model.vo.Tag;
import com.kh.manage.timeLine.model.vo.TimeLine;

@Controller
public class TimeLineController {
	@Autowired
	private TimeLineService ts;
	
	
	@RequestMapping("/insertTimeLine.ti")
	public String insertTimeLine(TimeLine tm, @RequestParam MultipartFile[] file, HttpSession session, HttpServletRequest request) {
		Member m = (Member) session.getAttribute("loginUser");	
		
		
		if(file[0].getSize() >0) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String filePath = root + "\\uploadfiles";
			String originFileName = file[0].getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String changeName = CommonsUtils.getRandomString();

			try {
				file[0].transferTo(new File(filePath + "\\" + changeName + ext));
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			Attachment at = new Attachment();
			at.setChangeName(changeName+ext);
			at.setOriginName(originFileName);
			at.setFilePath(filePath);
			at.setExt(ext);
			
			tm.setMemberNo(m.getMemberNo());
			tm.setaStatus("Y");
			
			int result = ts.insertTimeLine(tm);
			int atResult = ts.insertTimeAttachment(at);
			
		}else {
			tm.setMemberNo(m.getMemberNo());
			tm.setaStatus("N");
			int result = ts.insertTimeLine(tm);
		}
		
		String[] tag = tm.getTagName().split(",");
		
		System.out.println("문자 배열 크기 : " + tm.getTagName());
		
	    for(int i =0; i < tag.length; i++) {
			System.out.println("태그 이름 : " + tag[i]);
			
			TimeLine ti = ts.selectOneTag(tag[i]);
			
			if(ti != null) {
				int result = ts.insertTagName(ti.getTagNo());
			}else {
				int result = ts.insertTag(tag[i]);
				int result2 = ts.insertTimeLineTag();
			}
		}
		
		
		return "redirect:showTimeLine.ct";
	}
	
	@RequestMapping("/insertHart.ti")
	public void insertHart(TimeLine tl, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		System.out.println("타임라인 번호 : " +tl);
		Member m = (Member) session.getAttribute("loginUser");
		tl.setMemberNo(m.getMemberNo());
		
		
		int result = ts.insertTimeLineHart(tl);
		
		request.setAttribute("true", true);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String gson = new Gson().toJson(true);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/deleteHart.ti")
	public void deleteHart(TimeLine tl, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Member m = (Member) session.getAttribute("loginUser");
		tl.setMemberNo(m.getMemberNo());
		
		int result = ts.deleteHart(tl);
		request.setAttribute("true", true);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String gson = new Gson().toJson(true);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/insertComment.ti")
	public void insertComment(Comment comm, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Member m = (Member) session.getAttribute("loginUser");
		
		comm.setMemberNo(m.getMemberNo());
		comm.setTcLevel(1);
		comm.setHighComment(null);
		int result = ts.insertHighComment(comm);
		
		String timeLineNo = ts.selectOneTimeLineNo();
		String enrollDate = ts.selectSysdate();
		
		Comment cm = new Comment();
		cm.settCommentNo(timeLineNo);
		cm.setEnrollDate(enrollDate);
		
		request.setAttribute("cm", cm);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String gson = new Gson().toJson(cm);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping("/insertDownComment.ti")
	public void insertDownComment(Comment comm, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Member m = (Member) session.getAttribute("loginUser");
		comm.setMemberNo(m.getMemberNo());
		comm.setTcLevel(2);
		
		int result = ts.insertHighComment(comm);
		
		String timeLineNo = ts.selectOneTimeLineNo();
		String enrollDate = ts.selectSysdate();
		
		Comment cm = new Comment();
		cm.settCommentNo(timeLineNo);
		cm.setEnrollDate(enrollDate);

		request.setAttribute("cm", cm);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String gson = new Gson().toJson(cm);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping("/deleteHighComment.ti")
	public void deleteHighComment(Comment comm, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		System.out.println(comm);
		int result = ts.deleteHighComment(comm);
		
		request.setAttribute("true", true);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String gson = new Gson().toJson(true);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
