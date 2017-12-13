package com.kh.everycvs.common.util;

import java.util.UUID;

import org.apache.log4j.Logger;
public class CommonUtils {
	private static final Logger log = Logger.getLogger(CommonUtils.class);
	
	public CommonUtils() {}
	
	public static String getRandomString(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
}
