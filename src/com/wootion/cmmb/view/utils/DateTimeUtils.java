package com.wootion.cmmb.view.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateTimeUtils
{
    public static final String Simple_Date_Pattern = "yyyy-MM-dd HH:mm";
    public static final String Simple_DateTime_Pattern = "yyyy-MM-dd HH:mm:ss";
    public static final String EXTJS_DATETIME_PATTERN = "yyyy-MM-dd'T'HH:mm:ss";
    /**
     * 将时间对象格式化成yyyy-MM-dd HH:mm:ss类型字符串
     * @param date
     * @return
     */
    public static String formatSimpleDateTime(Date date){
    	return formatDate(date,Simple_DateTime_Pattern);
    }
    /**
     * 将时间对象格式化成yyyy-MM-dd类型字符串
     * @param date
     * @return
     */
    public static String fomateSimpleDate(Date date){
        return formatDate(date, Simple_Date_Pattern);
    }
    /**
     * 将时间格式化成指定类型字符串
     * @param date
     * @param datePattern
     * @return
     */
    public static String formatDate(Date date,String datePattern){
    	String formatStr = "";
    	if(date == null)
    		return formatStr;
    	SimpleDateFormat df = new SimpleDateFormat(datePattern);
    	formatStr = df.format(date);
    	return formatStr;
    }
    /**
     * 将字符串解析成时间对象
     * @param dateValue
     * @return
     */
    public static Date parseToDate(String dateValue){
        Date date = parseToDate(Simple_Date_Pattern,dateValue);
        return date;
    }
    /**
     * 将字符串解析成时间对象
     * @param dateValue
     * @return
     */
    public static Date parseToDateTime(String dateValue){
        Date date = parseToDate(Simple_DateTime_Pattern,dateValue);
        return date;
    }
    /**
     * 将ext字符串转换为时间对象
     * @param dateValue
     * @return
     */
    public static Date parstToExtDateTime(String dateValue){
        Date date = parseToDate(EXTJS_DATETIME_PATTERN,dateValue);
        return date;
    }
    /**
     * 将字符串按指定pattern解析成时间对象
     * @param pattern
     * @param dateValue
     * @return
     */
    public static Date parseToDate(String pattern,String dateValue){
        Date date = null;
        SimpleDateFormat df = new SimpleDateFormat(pattern);
        try
        {
            date = df.parse(dateValue);
        }
        catch (ParseException e)
        {
            e.printStackTrace();
        }
        return date;
    }
    
    /**
     * 按指定年月日生成时间对象
     * @param year
     * @param month
     * @param day
     * @param hour
     * @param minute
     * @param second
     * @return
     */
    public static Date createDateTime(int year,int month,int day,int hour,int minute,int second){
        Calendar calendar = new GregorianCalendar(year,month-1,day,hour,minute,second);
        return calendar.getTime();
    }
    
    
}
