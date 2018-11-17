package com.beadhouse.util;

import org.apache.commons.codec.digest.DigestUtils;
/**
 * 
 * @notes 加密工具类
 * @author 刘建
 * @date 2018年8月10日
 * @class SafetyUtil.java
 */
public class SafetyUtil {
	
	/**
	 *通过用户名+用户密码生成加密摘要，因为用户名不会重复，所以生成的摘要也不会相同，用户名相当于盐
	 */
	public static String addMD5Salt(String name ,String pwd){
	 String changedPswd=DigestUtils.md5Hex(name+pwd);
		return changedPswd;
	}

}
