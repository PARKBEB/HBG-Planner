package hbg.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import KISA.SHA256;
import sun.misc.BASE64Encoder;

public class EmailConfirm {
	public void connectEmail(String email ,String UUID){
		String to1 = email;
		String host="smtp.gmail.com"; 
		String subject="이메일 인증";
		String fromName="관리자"; 
		String from="gmail";
		String content="<a href=http://localhost:8089/HBG/hbg-register-email-ok.jsp?UUID=" + UUID + "&user_email=" + email + ">이메일인증</a>";
		
		try{
			Properties props=new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty
                       ("mail.smtp.socketFactory.class",
                        "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port","465");
			props.put("mail.smtp.user",from);
			props.put("mail.smtp.auth","true");
		
			Session mailSession 
				= Session.getInstance(props,new javax.mail.Authenticator(){
			    protected PasswordAuthentication getPasswordAuthentication(){
				    return new PasswordAuthentication
				    		("ehdals0116","ehdals1202@");
			    }
			});
		
			Message msg = new MimeMessage(mailSession);
			InternetAddress []address1 = {new InternetAddress(to1)};
			msg.setFrom(new InternetAddress
                      (from, MimeUtility.encodeText(fromName,"utf-8","B")));
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject); 
			msg.setSentDate(new java.util.Date()); 
			msg.setContent(content,"text/html; charset=utf-8");
		
			Transport.send(msg);
		}catch(MessagingException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

/*
	public static String authNum(){
		StringBuffer buffer=new StringBuffer();
		for(int i=0;i<=4;i++){
			int num=(int)(Math.random()*9+1);
			buffer.append(num);
		}
		return buffer.toString();
	}
	*/
	//임시 비밀번호 생성(8~10자리)
	//public static String passNum(){
		//String uuid = UUID.randomUUID().toString();
		//return uuid.substring(0,8);
	//}
}
