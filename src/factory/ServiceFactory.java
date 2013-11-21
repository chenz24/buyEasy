package factory;

import com.opensymphony.xwork2.ActionContext;

import service.CartService;
import service.impl.CartServiceImpl;
import util.Constant;

public class ServiceFactory {

	public static CartService getCartService(String type){
		//如果是session方式，就创建实例后放入session。
		if(Constant.SESSION_CART.equals(type)){
			CartService cartService = (CartService) ActionContext.getContext().getSession().get(Constant.CART_KEY);
			if(cartService == null){
				cartService = new CartServiceImpl();
				ActionContext.getContext().getSession().put(Constant.CART_KEY, cartService);
			}
			return cartService;
		}else if(Constant.DB_CART.equals(type)){
			//DB存储方式
			return null;
		}else{
			return null;
		}		
	}
}
