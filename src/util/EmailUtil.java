package util;

import java.io.IOException;
import java.util.Properties;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class EmailUtil {
	public static void sendEmail(String mail,String msg){
		SimpleEmail email=new SimpleEmail();
		Properties ps=new Properties();
		try {
			ps.load(EmailUtil.class.getClassLoader().getResourceAsStream("email.properties"));//通过配置文件灵活控制
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		email.setHostName(ps.getProperty("server"));//smtp地址
		email.setAuthentication(ps.getProperty("username"),ps.getProperty("password"));//邮箱用户名密码
		email.setCharset("utf-8");
		try {
			email.addTo(mail);//发送给谁
			email.setFrom(ps.getProperty("email"));//完整邮箱地址
			email.setSubject("当当网验证");
			email.setMsg(msg);
			email.send();
		} catch (EmailException e) {
			e.printStackTrace();
		}
		
	}
}
