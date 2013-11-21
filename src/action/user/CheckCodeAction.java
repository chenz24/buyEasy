package action.user;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Random;


import com.opensymphony.xwork2.ActionContext;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class CheckCodeAction {
	private InputStream image;

	public InputStream getImage() {
		return image;
	}

	public void setImage(InputStream image) {
		this.image = image;
	}
	public String execute(){
		Random r = new Random(System.currentTimeMillis());
		//生成随机字符串
		String[] str = new String[35];		
		int count = 0;
		for(int i=65;i<=90;i++){
			str[count++] = (char)i + "";
		}
		for(int i = 1;i<10;i++){
			str[count++] = i + "";
		}

		//先创建一个内存映像对象
		BufferedImage bimage = new BufferedImage(80, 30, BufferedImage.TYPE_INT_RGB);
		//得到画笔
		Graphics g = bimage.getGraphics();
		//设置颜色
		g.setColor(new Color(255,255,255));
		//填充一个矩形
		g.fillRect(0, 0, 80, 30);
		//画画
		
		//Font(String,int,int);字体风格，风格，大小
		g.setFont(new Font(null, Font.BOLD, 20));
		int x = 0;//验证码开始位置
		//String[] ckcode = new String[4];
		StringBuffer sb = new StringBuffer();
		for(int i =0;i<4;i++){
			//随机颜色
			g.setColor(new Color(r.nextInt(255),r.nextInt(255),r.nextInt(255)));
			//下一位验证码位置
			x += 15;
			sb.append(str[r.nextInt(35)]);
			//ckcode[i] = str[r.nextInt(35)];
			g.drawString(sb.charAt(i) + "",x,20);
		}
		String code = sb.toString();
		System.out.println(code + "  checkcode");
		//将验证码保存到session
		ActionContext.getContext().getSession().put("checkCode", code);
		//随机添加干扰线
		for(int i=0;i<8;i++){
			g.drawLine(r.nextInt(80), r.nextInt(30), r.nextInt(80), r.nextInt(30));
		}
		//将图片压缩
		//需要提供一个输入流，ecoder工具会讲图片压缩之后的数据以流的方式输出.
		try {
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(os);

			encoder.encode(bimage);
			image = new ByteArrayInputStream(os.toByteArray());
		//	System.out.println(image);
			return "success";
		} catch (IOException e) {
			e.printStackTrace();
			return "fail";
		}
		
	}
}
