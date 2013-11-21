package  factory;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 读取properties配置文件
 * @author Chen
 * @since 2012-6-26 
 */
public class ConfigUtil {
	private static Properties props = new Properties();
	
	static {
		ClassLoader c = ConfigUtil.class.getClassLoader();
		InputStream ips = c.getResourceAsStream("dao.properties");
		try{
			props.load(ips);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	public static String getValue(String key){
		return props.getProperty(key);
	}
}
