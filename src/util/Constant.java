package util;

/**
 * @为了提高程序可读性
 * @避免session和application中的key冲突
 */
public class Constant {
	public static final String SESSION_CART="session";//session存储实现购物车
	public static final String DB_CART="db";//数据库存储实现购物车
	public static final String CART_KEY="cart.key";//保存购物车操作的key
	public static final int NORMAL = 0;
	public static final int HIGH = 1;
	public static final int VIP = 2;
	public static final int PERPAGE = 5;//分页数
	public static final String AUTH_KEY = "ilovejava";
}