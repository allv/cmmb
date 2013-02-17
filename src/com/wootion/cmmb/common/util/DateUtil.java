package com.wootion.cmmb.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");


	public static Date getNormalDate(String date){
		try {
			return sdf.parse(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
