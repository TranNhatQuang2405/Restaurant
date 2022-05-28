package com.Server;

import javax.mail.*;
import javax.mail.internet.*;

import java.util.Properties;

public class SendMail {
	public static void Send(String content, String Title, String Receive) throws AddressException, MessagingException {
		final String username = "godzillarestaurant5@gmail.com";
		final String password = "12345678@a";
		Properties properties = new Properties();
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
//		properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
//		properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		Session session = Session.getInstance(properties, new javax.mail.Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);			
			}
		});
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress(username));
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(Receive));
		message.setSubject(Title);
		message.setText(content);
		Transport.send(message);
	}
}
