package factory;

/**
 * DAO工厂类，通过查询配置文件创建某个DAO的实例
 * @author Chen
 * @since 2012-6-26
 */
public class DaoFactory {
	public static Object getInstance(String interfaceName){
		String className = ConfigUtil.getValue(interfaceName);
		Object obj = null;
		try{
			Class c = Class.forName(className);
			obj = c.newInstance();
		}catch(Exception e){
			e.printStackTrace();
		}
		return obj;
	}
}