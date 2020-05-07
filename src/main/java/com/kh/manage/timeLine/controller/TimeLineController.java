package com.kh.manage.timeLine.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.CommonsUtils;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.timeLine.model.service.TimeLineService;
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
		
		
		return "redirect:showTimeLine.ct";
	}
}
