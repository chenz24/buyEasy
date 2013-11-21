package util;

import java.util.UUID;
/**
 * 邮件验证码
 * @author teacher
 *
 */
public class VerifyUtil {
	public static String getVerifyCode(){
		UUID uuid = UUID.randomUUID();
		return uuid.toString();
	}
	
	public static void main(String[] args){
		System.out.println(getVerifyCode());
	}
	
	
}
