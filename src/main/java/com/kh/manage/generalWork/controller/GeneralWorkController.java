package com.kh.manage.generalWork.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.manage.admin.adminManage.vo.Access;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.CommonsUtils;
import com.kh.manage.common.PageInfo;
import com.kh.manage.common.Pagination;
import com.kh.manage.generalWork.model.service.GeneralWorkService;
import com.kh.manage.generalWork.model.vo.GeneralWork;
import com.kh.manage.member.model.vo.Member;

@Controller
public class GeneralWorkController {
	@Autowired
	private GeneralWorkService gs;
	
	
	@RequestMapping("/showGeneralWorkMain.gw")
	public String showGeneralWorkMain(Model model, HttpSession session, HttpServletRequest request) {
		
		int currentPage = 1;
		Member m = (Member) session.getAttribute("loginUser");
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		

		int listCount = gs.getListCount(m);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		List<GeneralWork> list = gs.generalWorkSelectAll(pi, m);
		
		model.addAttribute("list", list);
		model.addAttribute("pi",pi);
		
		return "user/generalWork/generalWorkList";
	}
	
	@RequestMapping("/showInsertGeneralWorkPage.gw")
	public String showInsertGeneralWorkPage() {
		
		return "user/generalWork/generalWorkInsert";
	}
	
	@RequestMapping("/insertGeneralWork.gw")
	public String insertGeneralWork(GeneralWork work, HttpServletRequest request, HttpSession session, @RequestParam MultipartFile[] file) {
		Member m = (Member) session.getAttribute("loginUser");
		for(int i =0 ; i < file.length; i ++) {
			System.out.println(file[i]);
		}
		List<Attachment> aList = new ArrayList<Attachment>();
		
		work.setMemberNo(m.getMemberNo());
		
		if(file.length >  0) {
			for(int i =0 ; i < file.length; i ++) {
					if(file[i].getSize() > 0) {
					String root = request.getSession().getServletContext().getRealPath("resources");
					String filePath = root + "\\uploadfiles";
					String originFileName = file[i].getOriginalFilename();
					String ext = originFileName.substring(originFileName.lastIndexOf("."));
					String changeName = CommonsUtils.getRandomString();

		try {
			file[i].transferTo(new File(filePath + "\\" + changeName + ext));
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Attachment at = new Attachment();
		at.setChangeName(changeName);
		at.setOriginName(originFileName);
		at.setFilePath(filePath);
		at.setExt(ext);
		
		aList.add(at);
			}
		}
     	GeneralWork insertWork = gs.insertGeneralWork(work);
	
		if(insertWork.getGwNo() != null) {
			for(int i = 0; i < aList.size(); i++) {
			aList.get(i).setDivision(insertWork.getGwNo());
			int result = gs.insertGeneralWorkAttachment(aList.get(i));
			}
		}
		
		}else {
			GeneralWork insertWork = gs.insertGeneralWork(work);
			
		}
		
		return "redirect:showGeneralWorkMain.gw";
	}
	
	@RequestMapping("/generalWorkDetailPage.gw")
	public String generalWorkDetailPage(Model model, GeneralWork work) {
		
		GeneralWork generalWork = gs.selectOneGeneralWork(work);
		
		List<Attachment> list = gs.attachmentList(work);
		if(list.size() >0) {
			model.addAttribute("list", list);
		}else {
			model.addAttribute("list", null);
		}
		
		model.addAttribute("work", generalWork);
		
		return "user/generalWork/generalWorkDetail";
	}
	
	@RequestMapping("/deleteGeneralWork.gw")
	public String deleteGeneralWork(GeneralWork work) {
		
		int result = gs.deleteGeneralWork(work);
		
		if(result > 0) {
			List<Attachment> list = gs.attachmentList(work);
			
			if(list.size() > 0) {
				for(int i=0 ; i < list.size(); i++) {
					new File(list.get(i).getFilePath() + "\\" + list.get(i).getChangeName() + list.get(i).getExt()).delete();
				}
				int result1 = gs.deleteAttachment(work);
			}
		}
		
		return "redirect:showGeneralWorkMain.gw";
	}
	
	@RequestMapping("/showGeneralWorkUpdateForm.gw")
	public String showGeneralWorkUpdateForm(GeneralWork work, Model model) {
		GeneralWork generalWork = gs.selectOneGeneralWork(work);
		
		List<Attachment> list = gs.attachmentList(work);
		if(list.size() >0) {
			model.addAttribute("list", list);
		}else {
			model.addAttribute("list", null);
		}
		
		model.addAttribute("work", generalWork);
		
		return "user/generalWork/generalWorkUpdateForm";
	}
	
	@RequestMapping("updateGeneralWork.gw")
	public String updateGeneralWork(GeneralWork work, Attachment originAt, HttpServletRequest request, 
										HttpSession session, Model model, @RequestParam MultipartFile[] file) {
		//넣어야 할 첨부파일 처리
		List<Attachment> aList = new ArrayList<Attachment>();
		//해당 일정에 대한 첨부파일 전부다 조회
		List<Attachment> atList = gs.selectAllAttachment(work);

		//기존 첨부파일을 확인 하여 제거된거를 체크하고 있으면 해당 파일을 DB STS에서 삭제
		System.out.println(originAt);
		if(originAt.getAtNo() != null) {
			String[] str = originAt.getAtNo().split(",");
			
			for(int i=0; i< str.length; i++) {
				for(int j=0; j < atList.size(); j++) {
						if(atList.get(j).getAtNo().equals(str[i])) {
							System.out.println(atList.get(j).getAtNo());
							atList.remove(j);
						}
				}
			}
			if(atList.size() >0) {
				for(int i=0; i < atList.size(); i++) {
					System.out.println("삭제중");
					int result = gs.deleteGeneralWorkDelete(atList.get(i));
					
					if(result > 0) {
						new File(atList.get(i).getFilePath() + "\\" + atList.get(i).getChangeName() + atList.get(i).getExt()).delete();
					}
				}
			}
			
		}else {
			//기존 파일이 전부 다 제거 된 경우
			//DB에서 전부 제거
			int result = gs.deleteAttachment(work);
			//STS파일을 제거
			for(int i=0; i < atList.size(); i++) {
				new File(atList.get(i).getFilePath() + "\\" + atList.get(i).getChangeName() + atList.get(i).getExt()).delete();
			}
		}
		
		
		//새로 추가 되는 파일이 있는 지 확인 후 처리
		if(file.length >  0) {
			for(int i =0 ; i < file.length; i ++) {
					if(file[i].getSize() > 0) {
					String root = request.getSession().getServletContext().getRealPath("resources");
					String filePath = root + "\\uploadfiles";
					String originFileName = file[i].getOriginalFilename();
					String ext = originFileName.substring(originFileName.lastIndexOf("."));
					String changeName = CommonsUtils.getRandomString();
				
					try {
						file[i].transferTo(new File(filePath + "\\" + changeName + ext));
						
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					Attachment at = new Attachment();
					at.setChangeName(changeName);
					at.setOriginName(originFileName);
					at.setFilePath(filePath);
					at.setExt(ext);
					
					aList.add(at);
						}
					  }
					System.out.println(work);
					//수정 내용 업데이트	
					int updateResult = gs.updateGeneralWork(work);	
					
					if(updateResult > 0) {
					//업데이트 여부에 따라 첨부파일 추가로 추가	
						for(int i = 0; i < aList.size(); i++) {
							aList.get(i).setDivision(work.getGwNo());
							int result = gs.insertGeneralWorkAttachment(aList.get(i));
						}
						
						
					}
				}else {
					//추가 파일 첨부가 없는 경우 업무 수정만 업데이트 
					int updateResult = gs.updateGeneralWork(work);
					System.out.println(work);
				}
		
					GeneralWork generalWork = gs.selectOneGeneralWork(work);
					
					List<Attachment> list = gs.attachmentList(work);
					
					if(list.size() >0) {
						model.addAttribute("list", list);
					}else {
						model.addAttribute("list", null);
					}
					
					model.addAttribute("work", generalWork);
					
					return "user/generalWork/generalWorkDetail";
	}
	
}
