package com.java.utils;

/**
 * @Title: 短信发送工具类
 * @date 2011-3-22
 * @version V1.2  
 */
public class SMSUtil {
	
	//用户名
	private static String Uid = "verysuperbigbird";
	
	//接口安全秘钥
	private static String Key = "d41d8cd98f00b204e980";


	public static int sendSMS(String txt,String phone) {

		HttpClientUtil client = HttpClientUtil.getInstance();
		//UTF发送
		int result = client.sendMsgUtf8(Uid, Key, txt, phone);
		return result;
	}
}
