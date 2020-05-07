package com.kh.manage.mail.controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.ByteBuffer;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.amazonaws.services.simpleemail.AmazonSimpleEmailService;
import com.amazonaws.services.simpleemail.AmazonSimpleEmailServiceClientBuilder;
import com.amazonaws.services.simpleemail.model.RawMessage;
import com.amazonaws.services.simpleemail.model.SendRawEmailRequest;
import com.google.gson.Gson;
import com.kh.manage.common.CommonsUtils;
import com.kh.manage.common.PageInfo;
import com.kh.manage.common.Pagination;
import com.kh.manage.mail.model.service.MailService;
import com.kh.manage.mail.model.vo.AttachmentMail;
import com.kh.manage.mail.model.vo.Mail;
import com.kh.manage.member.model.vo.Member;
@Controller 
public class MailController {
	
	@Autowired
	private MailService ms;
	
	@Autowired
	private AwsS3 s3;
	
	protected String receiving_attachments ="src/main/webapp/resources/mailFiles";
//
//	 @RequestMapping("/mailMain.ma")
//	 public void insertReceiveMail(HttpServletRequest request) {
//		 Member loginUser = (Member) request.getSession().getAttribute("loginUser");
//		 
//		 System.out.println("sadasdsadsa");
//	      String bucketName = "manageee";
//	      List<S3ObjectSummary> objects = s3.getObjects(bucketName);
//	         for(S3ObjectSummary object : objects) {
//	               String key = object.getKey();
//	               System.out.println("key  : " +  key);
//	               s3.downloadObject(bucketName, key ,loginUser );
//	               
//	              // s3.deleteObject(object.getBucketName(), object.getKey());
//	      }
//	   }

	   public void doEMailDownload(Message message) throws Exception {

	        try {

	            Message messages = message;//folder.getMessages();
	            
	                Mail mr =  new Mail();
	                ArrayList<AttachmentMail> maList = new ArrayList<AttachmentMail>();
	                
	                System.out.println(messages.getFrom()[0].toString());
	                String from = s3.decodeName(messages.getFrom()[0].toString());
	                mr.setFrom(from.substring(from.indexOf("<")+1, from.lastIndexOf(">")));
	                
	                
	                Address[] to = messages.getRecipients(Message.RecipientType.TO);
	               String toaddr = "";
	                for(int j = 0; j < to.length; j++){
	                    toaddr += to[j].toString();
	                }
	                mr.setReceiver(toaddr);
	                
	                
	                Address[] ccArr;
	                try {
	                    ccArr = messages.getRecipients(Message.RecipientType.CC);
	                } catch (Exception e){
	                    ccArr = null;
	                }
	                if(ccArr != null){
	                   String cc = "";
	                    for(int j = 0; j < ccArr.length; j++){
	                       cc += ccArr[j].toString();
	                    }
	                    mr.setReceiver(mr.getReceiver()+cc);
	                }
	                
	                mr.setSubject((messages.getSubject()));
	                
	                if(messages.getReceivedDate() != null){
	                    mr.setEnrollDate(new Date(messages.getReceivedDate().getTime()));
	                } else {
	                    mr.setEnrollDate((new Date( (new java.util.Date()).getTime())));
	                }
	                
	                
	                
	                System.out.println("----------------------Body------------------------------");
	                //email.body = "";
	                Object content = messages.getContent();
	                if(content instanceof java.lang.String){
	                   System.out.println("String Content입니다.");
	                    mr.setContent((((String)content)));
	                    
	                } else if(content instanceof Multipart){
	                   System.out.println("Multipart Content입니다.");
	                   
	                   Multipart mp = (Multipart)content;
	                    
	                    System.out.println("이 메일의 bodyPart는 총  " + mp.getCount() +"개의 파트로 구성되어 있습니다.");
	                    
	                    for (int j=0; j < mp.getCount(); j++) {
	                       System.out.println("현재 " +j+"번째 파트를 처리중입니다.");
	                        Part part = mp.getBodyPart(j);
	                        
	                        String disposition = part.getDisposition();
	                        
	                        System.out.println("--------------------------"+j+"파트의 정보입니다.----------------------");
	                        MimeBodyPart mbp = (MimeBodyPart)part;
	                        System.out.println("mbp : " + mbp);
	                        System.out.println("part : " + part);
	                        System.out.println("content : " + mbp.getContent());
	                        System.out.println("contentType : " + mbp.getContentType());
	                        System.out.println("fileName : " + s3.decodeName(mbp.getFileName()));
	                        System.out.println("-----------------------------------------------------------------");
	                        
	                        System.out.println("disposition이 null인지 확인합니다.");
	                        if (disposition == null) {
	                           System.out.println(j+"번째 파트는 disposition이 null입니다.");
	                            // Check if plain
	                            
	                            
	                            if (mbp.isMimeType("text/plain")) {
	                               String bodyArr = "";
	                                bodyArr += (String)mbp.getContent();
	                                
	                                mr.setContent((bodyArr));
	                                System.out.println(j+"번째 bodyArr를 출력합니다. ");
	                                System.out.println(bodyArr);
	                                
	                            } else if(mbp.isMimeType("multipart/alternative")){
	                               //mbp = (MimeBodyPart) mbp.getContent();
	                               System.out.println("추가 파트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	                               Multipart mp2 = (Multipart)mbp.getContent();
	                               System.out.println("이 메일의 multipart/alternative 파트는 총  " + mp2.getCount() +"개의 파트로 구성되어 있습니다.");
	                               
	                               for (int k=0; k < mp2.getCount(); k++) {
	                                   System.out.println("현재 " +j+"-"+k+"번째 파트를 처리중입니다.");
	                                    Part part2 = mp2.getBodyPart(k);
	                                    
	                                    String disposition2 = part2.getDisposition();
	                                    
	                                    System.out.println("--------------------------" +j+"-"+k+"파트의 정보입니다.----------------------");
	                                    MimeBodyPart mbp2 = (MimeBodyPart)part2;
	                                    System.out.println(j+"-"+k+"content : " + mbp2.getContent());
	                                    System.out.println(j+"-"+k+"contentType : " + mbp2.getContentType());
	                                    System.out.println(j+"-"+k+"description : " + mbp2.getDescription());
	                                    System.out.println(j+"-"+k+"disposition : " + mbp2.getDisposition());
	                                    System.out.println(j+"-"+k+"fileName : " + s3.decodeName(mbp2.getFileName()));
	                                    System.out.println("-----------------------------------------------------------------");
	                                    
	                                    System.out.println("disposition이 null인지 확인합니다.");
	                                    if (disposition2 == null) {
	                                       System.out.println(j+"-"+k+"번째 파트는 disposition이 null입니다.");
	                                        // Check if plain
	                                        
	                                        
	                                        if (mbp2.isMimeType("text/plain")) {
	                                           String bodyArr = "";
	                                            bodyArr += (String)mbp2.getContent();
	                                            
	                                            mr.setContent((bodyArr));
	                                            System.out.println(j+"-"+k+"번째 bodyArr를 출력합니다. ");
	                                            System.out.println("emailBody : " + bodyArr);
	                                            
	                                        }else {
	                                           String bodyArr = "";
	                                            bodyArr += (String)mbp2.getContent();
	                                            
	                                            mr.setContent((bodyArr));
	                                            System.out.println(j+"-"+k+"번째 bodyArr를 출력합니다. ");
	                                            System.out.println("emailBody2 : " + bodyArr);
	                                        }
	                                    }
	                                    
	                                }
	                               System.out.println("추가파트 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	                            }else {
	                                System.out.println(j+"번째 파트는 Attachment가 아니므로 파일을 생성하지 않습니다.");
	                            }
	                            
	                          ///// ATTACHMENT파트로 파일을 분리해주는 구간
	                        } else if ((disposition != null)&&(disposition.equals(Part.ATTACHMENT) || disposition.equals(Part.INLINE) )){
	                           String whatIsDisposition = "";
	                           if(disposition.equals(Part.ATTACHMENT)) {
	                              whatIsDisposition = "ATTACHMENT입니다.";
	                           }else if(disposition.equals(Part.INLINE)){
	                              whatIsDisposition = "INLINE입니다.";
	                           }
	                           System.out.println(j+"번째 파트는 " +whatIsDisposition);
	                           
	                           String ext = "";
	                            if (mbp.isMimeType("text/plain")) {
	                               ext=".text";
	                            }else if (mbp.isMimeType("image/png")) {
	                               ext=".png";
	                            }
	                            AttachmentMail ma = new AttachmentMail();
	                            ma.setOriginName(s3.decodeName(mbp.getFileName()));
	                            File savedir = new File(receiving_attachments);
	                            savedir.mkdirs();
	                            File savefile = File.createTempFile("emailattach", ext, savedir );
	                            ma.setFilePath(savefile.getAbsolutePath());
	                            ma.setEaSize(part.getSize()+"");
	                            ma.setEaSize(s3.saveFile( savefile, part)+"");
	                            ma.setOriginName(s3.decodeName(mbp.getFileName()));
	                            ma.setChangeName(savefile.getName());
	                            maList.add(ma);
	                        }
	                    }
	                }
	                
	                System.out.println("er : " + mr);
	                System.out.println("maList : " + maList);
	                
	                
	                
	                
	        } catch (Exception e){
	           // folder.close(true); // true tells the mail server to expunge deleted messages.
	            throw e;
	        }

	    }
	
	//메일 메인페이지 받은 메일함
	@RequestMapping("/mailMain.ma")
	public String mailMain(HttpServletRequest request, Model m) {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
			 
		String bucketName = "manageee";
		List<S3ObjectSummary> objects = s3.getObjects(bucketName);
		         for(S3ObjectSummary object : objects) {
		               String key = object.getKey();
		               System.out.println("key  : " +  key);
		               s3.downloadObject(bucketName, key ,loginUser );
		               s3.deleteObject(bucketName, key);
		         }     
		
		Mail mail = new Mail();
		mail.setMemberNo(loginUser.getMemberNo());
		mail.setReceiver(loginUser.getEmail());
		
		System.out.println(mail.getReceiver());
		
		
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = ms.getListCount2(mail);
		
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<Mail> list = ms.selectReciveMail(mail,pi);

		m.addAttribute("list", list);
		m.addAttribute("pi", pi);
		
		return "user/mail/mailMain";
	}
	//받은 메일함 상세보기
	@RequestMapping("/mailReceived.ma")
	public String mailReceived(HttpServletRequest request, Model m) {
		
		String mNo = request.getParameter("no");
		
		System.out.println(mNo);
		
		Mail mail = new Mail();
		mail.setMailNo(mNo);
		
		
		int result = ms.updateRead(mail);
		
		Mail mail2 = ms.reciveMailOne(mNo);
		
		m.addAttribute("mail", mail2);

		return "user/mail/mailReceived";
	}

	@RequestMapping("/mailSend.ma")
	public String mailSend() {

		return "user/mail/mailSend";
	}

	@RequestMapping("/mailStorage.ma")
	public String mailStorage() {

		return "user/mail/mailStorage";
	}

	//중요 메일함 조회
	@RequestMapping("/mailImportant.ma")
	public String mailImportant(Model m, HttpServletRequest request) {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");

		Mail mail = new Mail();
		mail.setMemberNo(loginUser.getMemberNo());
		
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = ms.getListCount3(mail);
		
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		List<Mail> list = ms.selectImportList(mail,pi);
		
		m.addAttribute("list", list);
		m.addAttribute("pi", pi);

		return "user/mail//mailImportant";
	}

	//휴지통 리스트 조회
	@RequestMapping("/mailTrash.ma")
	public String mailTrash(HttpServletRequest request, Model m) {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");

		Mail mail = new Mail();
		mail.setMemberNo(loginUser.getMemberNo());
		
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = ms.getListCount4(mail);
		
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		List<Mail> list = ms.selectTrashList(mail,pi);
		
		m.addAttribute("list", list);
		m.addAttribute("pi", pi);

		return "user/mail//mailTrash";
	}

	@RequestMapping("/mailSent.ma")
	public String mailSent(HttpServletRequest request, Model m) {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		Mail mail = new Mail();
		mail.setMemberNo(loginUser.getMemberNo());
		mail.setFrom(loginUser.getEmail());
		
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = ms.getListCount(mail);
		
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<Mail> list = ms.sentMailList(mail,pi);
		
		m.addAttribute("list", list);
		m.addAttribute("pi", pi);
		
		System.out.println(list);

		return "user/mail//mailSent";
		
	}
	@RequestMapping("/mailSpam.ma")
	public String mailSpam() {

		return "user/mail//mailSpam";
	}
	
	
	
	@RequestMapping("/mailNread.ma")
	public String mailNread(Model m, HttpServletRequest request) {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		Mail mail = new Mail();
		mail.setMemberNo(loginUser.getMemberNo());
		mail.setFrom(loginUser.getEmail());
		
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = ms.getListCount5(mail);
		
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<Mail> list = ms.nReadMailList(mail,pi);
		
		m.addAttribute("list", list);
		m.addAttribute("pi", pi);
		
		System.out.println(list);
		

		return "user/mail/mailNread";
	}
	@RequestMapping("/mailComplete.ma")
	public String mailComplete() {
		
		

		return "user/mail/mailComplete";
	}

	

	//메일 보내기
	@RequestMapping("/sendMail")
	public String sendMail(Mail m ,String[] receiver, Model mo , @RequestParam(required = false) MultipartFile[] file, HttpServletRequest request) throws Exception{
		
		System.out.println("asdsad" + m);
		
		System.out.println(m.getReceiver());
		
		
		
		request.setCharacterEncoding("UTF-8");

	      //us-ascii로 전송이 되네
	      System.out.println("m : " + m);
	      System.out.println(file);
	      
	      Member loginUser = (Member) request.getSession().getAttribute("loginUser");
	      
	      String email = loginUser.getEmail();
	      String mNo = loginUser.getMemberNo();
	      m.setMemberNo(mNo);
	      m.setFrom(email);	
	      //위에 걸로 바꿔야 해 
	      //String email = "test11@groupwhale.com";
	      String to = m.getReceiver();
	      
	      System.out.println(to);
	      String subject = m.getSubject();
	      //String content = String.join(System.getProperty("line.separator"), m.getMailContent());
	      String content = m.getContent();
	      
	      String root = request.getSession().getServletContext().getRealPath("resources");
	      
	      System.out.println("root : " + root);
	      
	      String filePath = root + "\\mailFiles"; 
	      
	      List<AttachmentMail> fileList = new ArrayList<AttachmentMail>();
	      System.out.println("file.length : " + file.length);
	      
	      if(receiver[0].contains("@managee.net")) {
	    	  
	    	  for(int k = 0; k < receiver.length; k++) {
	  			
	  			m.setReceiver(receiver[k]);
	  			
	    	  
	    	  for(int i = 0; i < file.length; i++) {
	 	    	 AttachmentMail attachment = new AttachmentMail();
	 	         String originFileName = file[i].getOriginalFilename();//원본 파일 이름
	 	         
	 	         if(!originFileName.equals("")) {//첨부파일이 있으면
	 	         String ext = originFileName.substring(originFileName.lastIndexOf("."));//.png , .jpg 
	 	         String changeName = CommonsUtils.getRandomString();
	 	         
	 	         attachment.setOriginName(file[i].getOriginalFilename());
	 	         attachment.setChangeName(changeName + ext);
	 	         attachment.setEaSize(Long.toString(file[i].getSize()));
	 	         attachment.setFilePath(filePath +"\\" + changeName + ext);
	 	         
	 	         System.out.println("kkkky: " + attachment);
	 	         System.out.println("11111111111111111111111");
	 	         System.out.println(attachment.getFilePath());
	 	         
	 	         try {
	 	            file[i].transferTo(new File(attachment.getFilePath()));
	 	            
	 	            fileList.add(attachment);
	 	            
	 	         } catch (Exception e) {
	 	            new File(filePath + "\\" + changeName + ext).delete();
	 	            System.out.println("에러");
	 	            
	 	         }
	 	       }
	 	         
	    	  }
	    	  int result2 = ms.insertRecive(m,fileList);
	    	  
	    	  request.setAttribute("to", to);
		      
		      System.out.println("fileList : " + fileList);
		      
		      mo.addAttribute("mail", m);
	    	  }
		      
		      return "user/mail/mailComplete";
	    	  
	      }else {
	    	  
	    	  
	    	Session session = Session.getDefaultInstance(new Properties());
	        
	        // Create a new MimeMessage object.
	        MimeMessage message = new MimeMessage(session);
	        
	        // Add subject, from and to lines.
	        message.setSubject(subject, "UTF-8");
	        message.setFrom(new InternetAddress(email));
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

	        // Create a multipart/alternative child container.
	        MimeMultipart msg_body = new MimeMultipart("alternative");
	        
	        
	        
	        // Create a wrapper for the HTML and text parts.        
	        MimeBodyPart wrap = new MimeBodyPart();
	        
//	      try {
//	         
//	         MimeMultipart mm = (MimeMultipart) message.getContent();
//	         MimeBodyPart mb = (MimeBodyPart) mm.getBodyPart(1);
//	         System.out.println("이건 뭔데? : " + mm.getBodyPart(0));
//	         
//	         
//	      } catch (IOException e1) {
//	         // TODO Auto-generated catch block
//	         e1.printStackTrace();
//	      }
	      
	        // Define the text part.
	        MimeBodyPart textPart = new MimeBodyPart();
	        //textPart.setContent(BODY_TEXT, "text/plain; charset=UTF-8");
	        textPart.setContent("",  "text/plain; charset=UTF-8"); 

	        // Define the HTML part.
	        MimeBodyPart htmlPart = new MimeBodyPart();
	        htmlPart.setContent(content,"text/html; charset=UTF-8");
	                
	        // Add the text and HTML parts to the child container.
	        //msg_body.addBodyPart(textPart);
	        msg_body.addBodyPart(textPart);
	        msg_body.addBodyPart(htmlPart);
	        
	        // Add the child container to the wrapper object.
	        wrap.setContent(msg_body);
	        
	        // Create a multipart/mixed parent container.
	        MimeMultipart msg = new MimeMultipart("mixed");
	        
	        // Add the parent container to the message.
	        message.setContent(msg);
	        
	        // Add the multipart/alternative part to the message.
	        msg.addBodyPart(wrap);
	        
	        
	        for(int k = 0; k < receiver.length; k++) {
	  			
	  			m.setReceiver(receiver[k]);
	  			
	      
	      for(int i = 0; i < file.length; i++) {
	    	 AttachmentMail attachment = new AttachmentMail();
	         String originFileName = file[i].getOriginalFilename();//원본 파일 이름
	         
	         if(!originFileName.equals("")) {//첨부파일이 있으면
	         String ext = originFileName.substring(originFileName.lastIndexOf("."));//.png , .jpg 
	         String changeName = CommonsUtils.getRandomString();
	         
	         attachment.setOriginName(file[i].getOriginalFilename());
	         attachment.setChangeName(changeName + ext);
	         attachment.setEaSize(Long.toString(file[i].getSize()));
	         attachment.setFilePath(filePath +"\\" + changeName + ext);
	         
	         System.out.println(attachment);
	         
	         try {
	            file[i].transferTo(new File(attachment.getFilePath()));
	            
	            fileList.add(attachment);
	            
	            // Define the attachment
	            MimeBodyPart att = new MimeBodyPart();
	            //DataSource fds = new FileDataSource("C:\\Users\\chqdl\\downloads\\save.png");
	            DataSource fds = new FileDataSource(filePath +"\\" + changeName + ext);
	            
	            System.out.println("이거 아니야? : " + filePath + "\\" + changeName + ext);
	            att.setDataHandler(new DataHandler(fds));
	            System.out.println("fds.getName()이거 뭔데? : " + fds.getName());
	            att.setFileName(MimeUtility.encodeText(file[i].getOriginalFilename(),"UTF-8","B"));
	            
	            // Add the attachment to the message.
	            msg.addBodyPart(att);
	            
	            
	         } catch (Exception e) {
	            new File(filePath + "\\" + changeName + ext).delete();
	            System.out.println("에러2");
	         }

	      }
	         
	      }

	        // Try to send the email.
	        try {
	            System.out.println("Attempting to send an email through Amazon SES "
	                              +"using the AWS SDK for Java...");
	            

	            //여기 추가했음
	            BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIAJ4XHPYTYIUMZ5JWQ", "Fg/ddGvdK/e/LS0SAy3iIZ0BKFLDbPSiJCB35/si");
	            // Instantiate an Amazon SES client, which will make the service 
	            // call with the supplied AWS credentials.
	            AmazonSimpleEmailService client = 
	                    AmazonSimpleEmailServiceClientBuilder.standard()
	                    .withCredentials(new  AWSStaticCredentialsProvider(awsCreds))
	                    // Replace US_WEST_2 with the AWS Region you're using for
	                    // Amazon SES.
	                    .withRegion(Regions.US_EAST_1).build();
	            
	            // Print the raw email content on the console
	            PrintStream out = System.out;
	            message.writeTo(out);

	            // Send the email.
	            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	            message.writeTo(outputStream);
	            RawMessage rawMessage = 
	                  new RawMessage(ByteBuffer.wrap(outputStream.toByteArray()));

	            SendRawEmailRequest rawEmailRequest = 
	                  new SendRawEmailRequest(rawMessage);
	                      /*.withConfigurationSetName(CONFIGURATION_SET);*/
	            
	            client.sendRawEmail(rawEmailRequest);
	            System.out.println("Email sent!");
	        // Display an error if something goes wrong.
	            
	        } catch (Exception ex) {
	          System.out.println("Email Failed");
	            System.err.println("Error message: " + ex.getMessage());
	            ex.printStackTrace();
	        }
	      
	      int result = ms.insertMail(m, fileList);
	      
	      System.out.println("result : " +  result);

	      request.setAttribute("to", to);
	      
	      System.out.println(fileList);
	      mo.addAttribute("mail", m);
	      
	      }
	      return "user/mail/mailComplete";
		
	  }//else 끝
	      
	      
	}
	
	
	//보낸 메일함 상세보기
	@RequestMapping("mailDetail.ma")
	public String mailDetail(HttpServletRequest request, Model m) {
		
		String no = request.getParameter("no");
		
		System.out.println("no : " + no);
		
		Mail mail = ms.selectMailOne(no);
		
		m.addAttribute("mail", mail);
		
		return "user/mail/mailDetail";
	}
	
	//보낸 메일함 상세보기
		@RequestMapping("mailDetail2.ma")
		public String mailDetail2(HttpServletRequest request, Model m) {
			
			String no = request.getParameter("no");
			
			System.out.println("no : " + no);
			
			Mail mail = ms.selectMailOne(no);
			
			m.addAttribute("mail", mail);
			
			return "user/mail/mailDetail2";
		}
	
	@RequestMapping("download.ma")
	public void download(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println("sdasdsa");
		String no = request.getParameter("no");
		System.out.println(no);
		
		AttachmentMail file = ms.downAttachment(no);
		
		System.out.println(file);
		
		
		//폴더에서 파일을 읽을 스트림 생성
		BufferedInputStream buf = null;
		
		//클라이언트로 내보낼 출력 스트림 생성
		ServletOutputStream downOut = response.getOutputStream();
		
		//스트림으로 전송할 파일 객체 생성
		File downFile = new File(file.getFilePath());
		
		//응당 헤더 설정
		response.setContentType("text/plain; charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(file.getOriginName().getBytes("UTF-8"), "ISO-8859-1") + "\"");
		response.setContentLength((int) downFile.length());
		
		FileInputStream fin = new FileInputStream(downFile);
		buf = new BufferedInputStream(fin);
		
		int readBytes = 0;
		while((readBytes = buf.read()) != -1){
			downOut.write(readBytes);
		}
		
		downOut.close();
		buf.close();
		
	}
	
		//중요 메일함  
		@RequestMapping("important.ma")
		public void importantMail(HttpServletRequest request, HttpServletResponse response) {
			
			String imp = request.getParameter("imp");
			String mNo = request.getParameter("mNo");
			
			System.out.println(imp);
			System.out.println(mNo);
			
			Mail mail = new Mail();
			mail.setMailNo(mNo);
			mail.setImportant(imp);
			
			int result = ms.updateImportant(mail);
			
			System.out.println(result);
			
			mail = ms.selectMailOne(mNo);
			
			request.setAttribute("mail", mail);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			String gson = new Gson().toJson(mail);

			try {
				response.getWriter().write(gson);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		
		//휴지통
		@RequestMapping("trash.ma")
		public String trashMail(HttpServletRequest request, Model m) {
			
			String mNo = request.getParameter("mNo");
			
			System.out.println(mNo);
			
			int result = ms.updateTrash(mNo);
			
			System.out.println(result);
			
			return "redirect:mailMain.ma";
		}
		
		
		@RequestMapping("deleteMail.ma")
		public String deleteMail(HttpServletRequest request) {
			
			String mNo = request.getParameter("mNo");
			
			ms.deleteMail(mNo);
			
			return "redirect:mailTrash.ma";
		}


}
























