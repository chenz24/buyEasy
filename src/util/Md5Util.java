package util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

/*
 *  mysql_5.5.1.zip 50M
 *  MD5: 4532adf83efa4532adf83efa
 * 
 */
// md5sum mysql_5.5.1.zip mysql_5.5.1.zip 
// 4532adf83efa4532adf83efa

//TODO Day2 8 数据摘要工具类
//"数据摘要"是"数据"的"识别指纹"
//一组数据的摘要是唯一的
// 一个文件(5MByte) --摘要算法(MD5)--> 摘要(128bit)
// 另外一个文件  -- MD5 --> 摘要(128bit)
// ABC.tar.gz
// cp ABC.tar.gz def.tar.gz
// md5sum ABC.tar.gz def.tar.gz
// 不正确的说法: "MD5加密"
//            icbb
//      MD5
// 1234 ---> 1234icbb -> 81dc9bdb52d04dc20036dbd8313ed055
//  
// 1234 ---> 1234icbb -> 81dc9bdb52d04dc20036dbd8313ed055

public class Md5Util {
	public static byte[] md5(byte[] data) {
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			md.update(data);
			return md.digest();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	public static String md5(String data) {
		try {
			byte[] md5 = md5(data.getBytes("utf-8"));
			return toHexString(md5);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "";
	}

	public static String toHexString(byte[] md5) {
		StringBuilder buf = new StringBuilder();
		for (byte b : md5) {
			buf.append(leftPad(Integer.toHexString(b & 0xff), '0', 2));
		}
		return buf.toString();
	}

	public static String leftPad(String hex, char c, int size) {
		char[] cs = new char[size];
		Arrays.fill(cs, c);
		System.arraycopy(hex.toCharArray(), 0, cs, cs.length - hex.length(),
				hex.length());
		return new String(cs);
	}

	public static void main(String[] args) {
		System.out.println(Md5Util.md5("1234"));
		// 81dc9bdb52d04dc20036dbd8313ed055 -> 1234

	}
}