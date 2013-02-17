package com.wootion.cmmb.view.utils;
import java.util.Date;

public class FlexTimeMonstrX{
    public static Long getMonyX(String BeginningTime,String time){
        Long mc = null ;
        try
        {
            long px = 272;
            Date date1 = DateTimeUtils.parseToDate(BeginningTime);
            Date date2 = DateTimeUtils.parseToDate(time);
            long tmp = date2.getTime()-date1.getTime();
            
            mc = (tmp*px/1000/24/60/60)+170;
        }
        catch (Exception e)
        {
        }
        return mc;
    }
    
    public static Long getLastTime(String BeginningTime,String time){
        Long mc = null ;
        try
        {
            long px = 272;
            Date date1 = DateTimeUtils.parseToDate(BeginningTime);
            Date date2 = DateTimeUtils.parseToDate(time);
            long tmp = date2.getTime()-date1.getTime();
            
            mc = tmp*px/1000/24/60/60;
        }
        catch (Exception e)
        {
        }
        return mc;
    }
}
