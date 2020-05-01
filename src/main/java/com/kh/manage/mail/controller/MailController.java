package com.kh.manage.mail.controller;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.amazonaws.services.simpleemail.AmazonSimpleEmailService;
import com.amazonaws.services.simpleemail.AmazonSimpleEmailServiceClientBuilder;
import com.amazonaws.services.simpleemail.model.RawMessage;
import com.amazonaws.services.simpleemail.model.SendRawEmailRequest;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.CommonsUtils;
import com.kh.manage.common.PageInfo;
import com.kh.manage.common.Pagination;
import com.kh.manage.mail.model.service.MailService;
import com.kh.manage.mail.model.vo.AttachmentMail;
import com.kh.manage.mail.model.vo.Mail;
import com.kh.manage.member.model.vo.Member;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

@Controller 
public class MailController {
	
	@Autowired
	private MailService ms;

	@RequestMapping("/mailMain.ma")
	public String mailMain() {
		
		 
//	      String bucket_name = "manageee";
//	      String key_name= "4hjljcbtgl9jbkqr2g2l2pt3s81ktt8p7cuqv481";
//	      
//	      final AmazonS3 s3 = AmazonS3ClientBuilder.standard().withRegion("us-east-1").build();
//	      
//	      
//	      S3Object object = s3.getObject(new GetObjectRequest(bucket_name,key_name));
//	      InputStream objectData = object.getObjectContent();
//	      
//	      try {
//	      
//	      BufferedReader reader = new BufferedReader(new InputStreamReader(object.getObjectContent()));
//	      
//	      String line;
//	      
//	      
//	      while((line = reader.readLine()) != null) {
//	         System.out.println(line);
//	      }
//	      objectData.close();
//	      } catch (IOException e) {
//	         e.printStackTrace();
//	      }
//		
		
		

		return "user/mail/mailMain";
	}

	@RequestMapping("/mailReceived.ma")
	public String mailReceived() {

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

	@RequestMapping("/mailImportant.ma")
	public String mailImportant() {

		return "user/mail//mailImportant";
	}

	@RequestMapping("/mailTrash.ma")
	public String mailTrash() {

		return "user/mail//mailTrash";
	}

	@RequestMapping("/mailSent.ma")
	public String mailSent(HttpServletRequest request, Model m) {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		Mail mail = new Mail();
		mail.setMemberNo(loginUser.getMemberNo());
		
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = ms.getListCount(mail);
		
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<Mail> list = ms.sentMailList(mail,pi);
		
		m.addAttribute("list", list);
		
		System.out.println(list);

		return "user/mail//mailSent";
	}
	@RequestMapping("/mailSpam.ma")
	public String mailSpam() {

		return "user/mail//mailSpam";
	}
	@RequestMapping("/mailNread.ma")
	public String mailNread() {

		return "user/mail//mailNread";
	}
	@RequestMapping("/mailComplete.ma")
	public String mailComplete() {

		return "user/mail//mailComplete";
	}



	@RequestMapping("/sendMail")
	public String sendMail(Mail m ,  @RequestParam(required = false) MultipartFile[] file, HttpServletRequest request) throws Exception{

		System.out.println(m);
		
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
	      String subject = m.getSubject();
	      //String content = String.join(System.getProperty("line.separator"), m.getMailContent());
	      String content = m.getContent();
	      
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
	        
	        
	        
	      String root = request.getSession().getServletContext().getRealPath("resources");

	      System.out.println("root : " + root);

	      String filePath = root + "\\mailFiles"; 

	      List<AttachmentMail> fileList = new ArrayList<AttachmentMail>();
	      System.out.println("file.length : " + file.length);
	      
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
	            
	         }

	      }
	         try {
	            System.out.println("바디0번 인덱스 : " + msg_body.getBodyPart(0).getContent());
	            System.out.println("바디1번 인덱스 : " + msg_body.getBodyPart(1).getContent());
	            System.out.println("메세지0번 인덱스 : " + msg.getBodyPart(0).getContent());
	            //System.out.println("메세지1번 인덱스 : " +msg.getBodyPart(1).getContent());
	         } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	         //System.out.println("2번 인덱스 : " + msg_body.getBodyPart(2));
	         //System.out.println("3번 인덱스 맞냐??? 제발!!!!! 내용이면 좋겠다!!!!!! : " + msg_body.getBodyPart(3));
	      }

//	        // Try to send the email.
//	        try {
//	            System.out.println("Attempting to send an email through Amazon SES "
//	                              +"using the AWS SDK for Java...");
//	            
//
//	            //여기 추가했음
//	            BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIAJMXCQSJZUL7LHUZQ", "EqemHP/wp2TKxTs/Ajf1WsecgGJydUmX6hWm5mE0");
//	            // Instantiate an Amazon SES client, which will make the service 
//	            // call with the supplied AWS credentials.
//	            AmazonSimpleEmailService client = 
//	                    AmazonSimpleEmailServiceClientBuilder.standard()
//	                    .withCredentials(new  AWSStaticCredentialsProvider(awsCreds))
//	                    // Replace US_WEST_2 with the AWS Region you're using for
//	                    // Amazon SES.
//	                    .withRegion(Regions.US_EAST_1).build();
//	            
//	            // Print the raw email content on the console
//	            PrintStream out = System.out;
//	            message.writeTo(out);
//
//	            // Send the email.
//	            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//	            message.writeTo(outputStream);
//	            RawMessage rawMessage = 
//	                  new RawMessage(ByteBuffer.wrap(outputStream.toByteArray()));
//
//	            SendRawEmailRequest rawEmailRequest = 
//	                  new SendRawEmailRequest(rawMessage);
//	                      /*.withConfigurationSetName(CONFIGURATION_SET);*/
//	            
//	            client.sendRawEmail(rawEmailRequest);
//	            System.out.println("Email sent!");
//	        // Display an error if something goes wrong.
//	            
//	        } catch (Exception ex) {
//	          System.out.println("Email Failed");
//	            System.err.println("Error message: " + ex.getMessage());
//	            ex.printStackTrace();
//	        }
//	      
	      int result = ms.insertMail(m, fileList);
	      
	      System.out.println("result : " +  result);

	      request.setAttribute("to", to);
	      
	      System.out.println(fileList);
	      
		return "user/mail/mailMain";
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
		File downFile = new File(file.getFilePath() +"\\"+ file.getChangeName());
		
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
	
	
	// s3 버킷으로 들어오 메시지를 DB에 넣어주는 메소드
		@RequestMapping("mail/s3.ma")
		public String runS3Method(HttpServletRequest request) {
		AwsS3 s3 = new AwsS3();
			// **** 프로세스  **** 
			// 리스트를 조회할때 버킷을 조회해서 받은 파일이 존재하면 -> eml파일로 복사후 삭제과정
			// eml파일로 복사후 eml형식을 받아와 메시지 객체에 저장한다. 
			List<S3ObjectSummary> objects = s3.getObjects("managee");
			System.out.println("버킷 객체 리스트 가져오기 : " + objects);
			
			if(objects.size() <= 0) {
				System.out.println("버킷에 객체가 존재하지 않습니다.");
				return "redirect:/mailMain.ma";
			}
			
			for(S3ObjectSummary object : objects) {
				// 객체의 내용을 출력
				s3.downloadObject(object.getBucketName(), object.getKey());
				
				// eml파일로 복사 
				s3.updateObjectForEmlExt(object.getKey());
				
				// 확인을 완료하면 버킷에서 삭제한다. 
				s3.deleteObject(object.getBucketName(), object.getKey());
			}
			
			List<S3ObjectSummary> emlObjects = s3.getObjects("managee-eml");
			System.out.println("eml 리스트 가져오기 : " + emlObjects);
			
			for(S3ObjectSummary object : emlObjects) {
				// 객체의 내용을 출력
				s3.downloadObject(object.getBucketName(), object.getKey());
				
				// eml파일 처리하는 메소드 
				Message message= s3.getEmlFile(object.getKey());
				// System.out.println("\n\n\n\n\n메시지 객체 분석해보자 medssage:  " + message.toString() + "\n\n\n\n");
				
				Mail reciveMail = new Mail();
				Member loginUser = (Member) request.getSession().getAttribute("loginUser");
				reciveMail.setMemberNo(loginUser.getMemberNo());
				try {
					MimeMultipart mm = (MimeMultipart) message.getContent();
					MimeBodyPart mb = (MimeBodyPart) mm.getBodyPart(1);
					//System.out.println(mb.getFileName());
//					for(int i = 0; i < message.getReplyTo().length; i++) {
//						System.out.println(i + "번째 : " + message.getReplyTo()[i]);
//					}
//					System.out.println();
//					for(int i = 0; i < message.getFrom().length; i++) {
//						System.out.println(i + "번째 : " + message.getFrom()[i]);
//					}
					
					String from = String.valueOf(message.getFrom()[0]);
					System.out.println("String 변환 후 : " + from );
					from = from.substring(from.indexOf('<') + 1, from.indexOf('>'));
					System.out.println("자른 후 from : " + from);
					
					reciveMail.setContent((String) mb.getContent());
					reciveMail.setSubject(message.getSubject());
					reciveMail.setEnrollDate((Date) message.getSentDate());
					reciveMail.setFrom(from);
					reciveMail.setReceiver(message.getAllRecipients()[0].toString());
				} catch (IOException  e) {
					System.out.println("eml을 DB에 저장하기 실패!");
					System.out.println("에러 메시지 : " + e.getMessage());
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				// 메시지 객체에 저장해서 데이터를 불러온 후에 데이터베이스에 맞춰서 저장
				ms.insertReciveMail(reciveMail);
				
				// eml파일 삭제
				s3.deleteObject(object.getBucketName(), object.getKey());
			}
			
			// 리스트 조회
			return "redirect:/mailMain.ma";
		}


}
























