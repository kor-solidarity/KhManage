package com.kh.manage.mail.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.manage.mail.model.vo.Mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Controller 
public class MailController {

	@RequestMapping("/mailMain.ma")
	public String mailMain() {

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
	public String mailSent() {

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
	public String sendMail(Mail m) throws Exception{

		System.out.println(m);


		// Replace sender@example.com with your "From" address.
		// This address must be verified.
		String FROM = "smskyl12@naver.com";
		String FROMNAME = "원준성";

		// Replace recipient@example.com with a "To" address. If your account 
		// is still in the sandbox, this address must be verified.
		String TO = m.getmAddress();

		// Replace smtp_username with your Amazon SES SMTP user name.
		String SMTP_USERNAME = "AKIAUTGXXEHXYQITHIGC";

		// Replace smtp_password with your Amazon SES SMTP password.
		String SMTP_PASSWORD = "BJniTtjWF7KgdBWnSqOgl0lsd7eNkugFrd3F0ujbUD2Z";

		// The name of the Configuration Set to use for this message.
		// If you comment out or remove this variable, you will also need to
		// comment out or remove the header below.
		//static final String CONFIGSET = "ConfigSet";

		// Amazon SES SMTP host name. This example uses the 미국 서부(오레곤) region.
		// See https://docs.aws.amazon.com/ses/latest/DeveloperGuide/regions.html#region-endpoints
		// for more information.
		String HOST = "email-smtp.us-east-1.amazonaws.com";

		// The port you will connect to on the Amazon SES SMTP endpoint. 
		int PORT = 587;

		String SUBJECT = m.getmTitle();

		String BODY = String.join(
				System.getProperty("line.separator"),
				m.getmContent()
				);



		// Create a Properties object to contain connection configuration information.
		Properties props = System.getProperties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.port", PORT); 
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");

		// Create a Session object to represent a mail session with the specified properties. 
		Session session = Session.getDefaultInstance(props);

		// Create a message with the specified information. 
		MimeMessage msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(FROM,FROMNAME));
		msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
		msg.setSubject(SUBJECT);
		msg.setContent(BODY,"text/html");

		// Add a configuration set header. Comment or delete the 
		// next line if you are not using a configuration set
		//msg.setHeader("X-SES-CONFIGURATION-SET", CONFIGSET);

		// Create a transport.
		Transport transport = session.getTransport();

		// Send the message.
		try
		{
			System.out.println("Sending...");

			// Connect to Amazon SES using the SMTP username and password you specified above.
			transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);

			// Send the email.
			transport.sendMessage(msg, msg.getAllRecipients());
			System.out.println("Email sent!");
		}
		catch (Exception ex) {
			System.out.println("The email was not sent.");
			System.out.println("Error message: " + ex.getMessage());
		}
		finally
		{
			// Close and terminate the connection.
			transport.close();
		}

		return "";
	}



}
























