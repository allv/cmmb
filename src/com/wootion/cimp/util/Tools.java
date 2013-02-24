package com.wootion.cimp.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cimp.util.PageBasicInfo;

public class Tools 
{
    public static final String SAVE_FILES_URL=IMPServiceFactory.getCMMPConfig().getSaveFileUrl();//"cimp/saveFiles/";//上传文件路径
   
    public static final String SAVE_TEMFILES_URL=IMPServiceFactory.getCMMPConfig().getTemplateFileUrl();//"cimp/saveFiles/";//上传文件路径
    
    public static final String SAVE_FILES_ZIP=IMPServiceFactory.getCMMPConfig().getZipFileUrl();//"cimp/zipFiles/";//打包文件路径

    public static final String FTP_SERVER_IP=IMPServiceFactory.getCMMPConfig().getFtpServerIP();//"10.130.45.103";//ftp地址

    public static final int FTP_SERVER_PORT=IMPServiceFactory.getCMMPConfig().getFtpServerPort();//21;//ftp端口
    
    public static final String FTP_USERNAME=IMPServiceFactory.getCMMPConfig().getFtpUserName();//"test";//ftp用户名
    
    public static final String FTP_POSSWORD=IMPServiceFactory.getCMMPConfig().getFtpUserPwd();//"test";//ftp密码
    
    public static final String FTP_REMETEPATH=IMPServiceFactory.getCMMPConfig().getFtpUploadPath();//"";//ftp上传地址
    
    public static final int HTTP_PORT=IMPServiceFactory.getCMMPConfig().getHttpServerPort();//"";//ftp上传地址
        /**
         *  转化list将其中的重复值去掉
         * @param oldList 含有重复值的list
         * @return list 没有重复值的新的list
         */
        public static List removeSameValue(List oldList)
        {
            List newList = new ArrayList();
            for (int k = 0; k < oldList.size(); k++)
            {
                if (k == 0)// 第一个直接添加
                {
                    newList.add(oldList.get(k));
                }
                else
                {// 遍历newList看是否存在重复的
                    boolean flag = true;
                    for (int m = 0; m < newList.size(); m++)
                    {
                        if (newList.get(m).equals(oldList.get(k)))
                        {// 相同则不添加
                            flag = false;
                        }
                    }
                    if (flag)
                    {// 添加
                        newList.add(oldList.get(k));
                    }
                }

            }
            return newList;
        }


        /**
         * 获取系统的当前时间，并以2009-05-22 10:32:56的形式返回
         * @return 2009-05-22 10:32:56
         */
        public static String currentTime()
        {
         // 获得系统当前时间
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            String time = df.format(new Date());// new Date()为获取当前系统时间
            return time; // 2009-05-22 10:32:56
        }
        
        /**
         * 获取系统的当前时间，并以20090522103256的形式返回
         * @return 2009-05-22 10:32:56
         */
        public static String currentTimeyy()
        {
         // 获得系统当前时间
            SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
            String time = df.format(new Date());// new Date()为获取当前系统时间
            return time; // 2009-05-22 10:32:56
        }
        
        /**
         * 获取系统的当前时间，并以2009-05-22 10:32:56的形式返回
         * @return 2009-05-22 10:32:56
         * @throws ParseException 
         */
        public static Date currentTimeDate() throws ParseException
        {
         // 获得系统当前时间
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            String time = df.format(new Date());// new Date()为获取当前系统时间
            Date date = df.parse(time);
            return date; // 2009-05-22 10:32:56
        }
        

        
        /**
         * 获取系统的当前时间，并以2008-10的形式返回
         * @return 2008-10 年月
         */
        public static String currentDate()
        {
         // 获得系统当前时间
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");//设置日期格式
            String time = df.format(new Date());// new Date()为获取当前系统时间
            return time; // 2008-10
        }
        
        /**
         * 根据时间获得该月的最后1天
         * @param year
         * @param month
         * @return
         */
        public static int getMaxDay(String year,String month)
        {
            Calendar   date   =   Calendar.getInstance(); 
            int yearInt = Integer.parseInt(year);
            int monthInt =  Integer.parseInt(month);
            date.set(yearInt,monthInt,1);   
            return   date.getActualMaximum(Calendar.DAY_OF_MONTH);
        }
        
        /**
         * 获取系统的当前时间，并以2008-10-01的形式返回
         * @return 2008-10-1 年月日
         */
        public static String currentYMD()
        {
            // 获得系统当前时间
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
            String time = df.format(new Date());// new Date()为获取当前系统时间
            return time; // 2008-10
        }

        /**
         * 根据传入的时间获得下一个月
         * @param time
         * @return
         */
      public static String getNextMonth(String time)
      {  
          String nextTime = "";
          int year = Integer.parseInt(time.substring(0,4));
          int month = Integer.parseInt(time.substring(5,7)) + 1;
          if(month == 13)
          {
              nextTime = year + 1 +"-0"+1;
          }
          else if(month < 10)
          {
              
              nextTime = year +"-0"+ month;
          }
          else
          {
              nextTime = year +"-"+ month;
          }
          return nextTime;
      }

     
      
      /*****************************************
       * @功能     计算当前日期某年的第几周
       * @return  interger
       * @throws ParseException
       ****************************************/
      public int getWeekNumOfYear(){
       Calendar calendar = Calendar.getInstance(Locale.CHINESE);
       int iWeekNum = calendar.get(Calendar.WEEK_OF_YEAR);
       return iWeekNum;
      }

      /*****************************************
       * @功能     计算指定日期某年的第几周
       * @return  interger
       * @throws ParseException
       ****************************************/
      public static int getWeekNo(String time) 
      {
       Calendar calendar = Calendar.getInstance(Locale.CHINESE);
       SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
       Date curDate;
        try
        {
            curDate = format.parse(time);
            calendar.setTime(curDate);
        }
        catch (ParseException e)
        {
           e.printStackTrace();
        }
       int iWeekNum = calendar.get(Calendar.WEEK_OF_YEAR);
       return iWeekNum;
      }

      
      public static void getMiniSecond()
      {
          SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//设置日期格式
          String time = df.format(new Date());// new Date()为获取当前系统时间
          //System.out.println("时间：=========================="+time);
      }
      
      /**
       * 获得当前时间是本年的第几周
       * @param time
       * @return
       */
      public static int getCurrentWeekNo()
      {
          Calendar   date   =   Calendar.getInstance(); 
          return   date.get(Calendar.WEEK_OF_YEAR);
      }
      
        public static String escape(String src)
        {
            int i;
            char j;
            StringBuffer tmp = new StringBuffer();
            tmp.ensureCapacity(src.length() * 6);
            for (i = 0; i < src.length(); i++)
            {
                j = src.charAt(i);
                if (Character.isDigit(j) || Character.isLowerCase(j)
                        || Character.isUpperCase(j))
                    tmp.append(j);
                else if (j < 256)
                {
                    tmp.append("%");
                    if (j < 16)
                        tmp.append("0");
                    tmp.append(Integer.toString(j, 16));
                }
                else
                {
                    tmp.append("%u");
                    tmp.append(Integer.toString(j, 16));
                }
            }
            return tmp.toString();
        }

        /**
         * @功能     计算某年某周的开始日期, yearWeekNo格式为2008-51，2008-1
         * @return  interger
         * @throws ParseException
         */
        public static String getYearWeekFirstDay(String yearWeekNo) 
        {
         int yearNum = Integer.parseInt(yearWeekNo.substring(0,4));
         int weekNum = Integer.parseInt(yearWeekNo.substring(5,yearWeekNo.length()));
         Calendar cal = Calendar.getInstance(Locale.CHINESE);
         cal.set(Calendar.YEAR, yearNum);
         cal.set(Calendar.WEEK_OF_YEAR, weekNum);
         cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
         //分别取得当前日期的年、月、日
         String tempYear = Integer.toString(yearNum);
         String tempMonth = Integer.toString(cal.get(Calendar.MONTH) + 1);
         String tempDay = Integer.toString(cal.get(Calendar.DATE));
         String tempDate = tempYear + "-" +tempMonth + "-" + tempDay;
         return SetDateFormat(tempDate,"yyyy-MM-dd");
        }
        /**
         * @功能     计算某年某周的结束日期
         * @return  interger
         * @throws ParseException
         */
        public static String getYearWeekEndDay(String yearWeekNo) 
        {
        int yearNum = Integer.parseInt(yearWeekNo.substring(0,4));
        int weekNum = Integer.parseInt(yearWeekNo.substring(5,yearWeekNo.length()));   
         Calendar cal = Calendar.getInstance(Locale.CHINESE);
         cal.set(Calendar.YEAR, yearNum);
         cal.set(Calendar.WEEK_OF_YEAR, weekNum + 1);
         cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
            //分别取得当前日期的年、月、日
         String tempYear = Integer.toString(yearNum);
         String tempMonth = Integer.toString(cal.get(Calendar.MONTH) + 1);
         String tempDay = Integer.toString(cal.get(Calendar.DATE));
         String tempDate = tempYear + "-" +tempMonth + "-" + tempDay;
         return SetDateFormat(tempDate,"yyyy-MM-dd");
        }
        /**
         * @see     取得指定时间的给定格式()
         * @return String
         * @throws ParseException
         */
        public static String SetDateFormat(String myDate,String strFormat)
        {
            SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
            String sDate;
            try
            {
                sDate = sdf.format(sdf.parse(myDate));
                return sDate;
            }
            catch (ParseException e)
            {
                e.printStackTrace();
            }
            return "";
           
        }

        
        
        public static String unescape(String src)
        {
            StringBuffer tmp = new StringBuffer();
            tmp.ensureCapacity(src.length());
            int lastPos = 0 , pos = 0;
            char ch;
            while (lastPos < src.length())
            {
                pos = src.indexOf("%", lastPos);
                if (pos == lastPos)
                {
                    if (src.charAt(pos + 1) == 'u')
                    {
                        ch = (char) Integer.parseInt(src
                                .substring(pos + 2, pos + 6), 16);
                        tmp.append(ch);
                        lastPos = pos + 6;
                    }
                    else
                    {
                        ch = (char) Integer.parseInt(src
                                .substring(pos + 1, pos + 3), 16);
                        tmp.append(ch);
                        lastPos = pos + 3;
                    }
                }
                else
                {
                    if (pos == -1)
                    {
                        tmp.append(src.substring(lastPos));
                        lastPos = src.length();
                    }
                    else
                    {
                        tmp.append(src.substring(lastPos, pos));
                        lastPos = pos;
                    }
                }
            }
            return tmp.toString();
        }
        
        /**
         *  根据分页信息获取要显示的结果集
         * @param list 所有的结果集
         * @param maxRecords 每页显示最多的数目
         * @param currentPage 当前页数
         * @return 要显示的结果集
         */
         @SuppressWarnings("unchecked")
         public static List getShowList(List list,int maxRecords,int currentPage)
         {
             List showList = new ArrayList();
             if(currentPage > 0)
             {
                 int start = maxRecords*(currentPage - 1);
                 int end = maxRecords * currentPage ;
                 if(list != null)
                 {
                     for(int k = start;k < end && k < list.size();k ++)
                     {
                         showList.add(list.get(k));
                     }
                 }
             }
             return showList;
         } 
         
        /**
         * 根据分页显示的信息封装字符串
         * @param pageAction action路径
         * @param params 参数列表
         * @param pageObj pageObj 分页对象
         * @param cols 显示的表格的最多列数
         * @return StringBuffer 字符串
         * @throws Exception
         */
         public static StringBuffer pageInfoStr(PageBasicInfo pageObj,int cols) throws Exception
         {
             StringBuffer sb = new StringBuffer();
             if(pageObj != null)
             {
                 if(pageObj.getCurrentPage() <= 0 ||
                         pageObj.getMaxRecords() <= 0 ||
                         pageObj.getTotalPages() < 0 ||
                         pageObj.getTotalRecords() < 0)
                 {
                     throw new Exception("pageObj对象数据异常！！");
                 }
                 int totalPages = pageObj.getTotalPages();
                 int currentPage = pageObj.getCurrentPage();
                 int maxRecords = pageObj.getMaxRecords();
                 String pageAction = pageObj.getPageAction();
                 String basePath = pageObj.getBasePath();

                 //cols = cols - 1;
                 
                 sb.append("<td colspan='"+cols +"'>每页<a  onclick=\"toSelect(this,'"+basePath+pageAction+"')\" style='cursor:hand'>");
                 sb.append(pageObj.getMaxRecords() + "</a>条&nbsp;&nbsp;共");
                 sb.append(pageObj.getTotalRecords()+"条&nbsp;&nbsp;共"+totalPages+"页&nbsp;&nbsp;");
                 
                 
                 StringBuffer sbUrl = new StringBuffer();
                 sbUrl.append("style='cursor:hand' onClick=\"changePageTo('"+basePath+pageAction+"',"+maxRecords+","+totalPages+","+currentPage);
                 
                 StringBuffer sbUrlChagePage = new StringBuffer();
                 sbUrlChagePage.append("onclick=\"changeToSelect(this,'"+basePath+pageAction+"',"+maxRecords+","+totalPages+","+currentPage+")\" style='cursor:hand'");
                 
                 
                 if(totalPages == 1 || totalPages == 0)
                 {// 0000
                     sb.append("首页&nbsp;&nbsp;");
                     sb.append("上一页&nbsp;&nbsp;"); 
                     sb.append("下一页&nbsp;&nbsp;");
                     sb.append("末页&nbsp;&nbsp;"); 
                     sb.append("第"+currentPage+"页&nbsp;&nbsp;");
                     
              
                 }
                 else if(totalPages > 1 && currentPage ==1)
                 {// 0011
                           
                     sb.append("首页&nbsp;&nbsp;");
                     sb.append("上一页&nbsp;&nbsp;"); 
                     sb.append("<a "+sbUrl+",3)\"><span style='color:blue'>下一页</span></a>&nbsp;&nbsp;");
                     sb.append("<a "+sbUrl+",4)\"><span style='color:blue'>末页</span></a>&nbsp;&nbsp;");
                     sb.append("<a  "+sbUrlChagePage+">第"+currentPage+"页</a>&nbsp;&nbsp;");
               
                 }
                 else if(totalPages > 1 && currentPage ==totalPages)
                 {// 1100
                          
                     sb.append("<a "+sbUrl+",1)\"><span style='color:blue'>首页</span></a>&nbsp;&nbsp;");
                     sb.append("<a "+sbUrl+",2)\"><span style='color:blue'>上一页</span></a>&nbsp;&nbsp;");
                     sb.append("下一页&nbsp;&nbsp;");
                     sb.append("末页&nbsp;&nbsp;");
                     sb.append("<a  "+sbUrlChagePage+">第"+currentPage+"页</a>&nbsp;&nbsp;");   
             
                 }
                 else
                 {// 1111
                     
                     sb.append("<a "+sbUrl+",1)\"><span style='color:blue'>首页</span></a>&nbsp;&nbsp;");
                     sb.append("<a "+sbUrl+",2)\"><span style='color:blue'>上一页</span></a>&nbsp;&nbsp;");
                     sb.append("<a "+sbUrl+",3)\"><span style='color:blue'>下一页</span></a>&nbsp;&nbsp;");
                     sb.append("<a "+sbUrl+",4)\"><span style='color:blue'>末页</span></a>&nbsp;&nbsp;"); 
                     sb.append("<a  "+sbUrlChagePage+">第"+currentPage+"页</a>&nbsp;&nbsp;"); 
                 } 
                 sb.append("</td>");
             }
             else
             {
                 throw new Exception("pageObj对象为空！！");
             }
             return sb;
         }
        
         
     /**
         替换字符串
     */
     public static String  replaceValue(String value)
     {
         int i = 0;
         while(i >= 0)
         {
             i = value.indexOf("\\#",i);
             value = value.replace("\\#","<br>");
         }
         return value;
     }

         public static void  main(String[] args)
         {       
                //System.out.println(currentTime());  
         }
         
         /**
          * 根据分页显示的信息封装字符串
          * @param pageAction action路径
          * @param params 参数列表
          * @param pageObj pageObj 分页对象
          * @param cols 显示的表格的最多列数
          * @return StringBuffer 字符串
          * @throws Exception
          */
          public static StringBuffer pageInfoStrI18N(Locale locale, PageBasicInfo pageObj,int cols) throws Exception
          {
              if(null == locale)
              {
                  locale = Locale.getDefault();
              }
              ResourceBundle bundle = ResourceBundle.getBundle("res.page",locale);
              
              StringBuffer sb = new StringBuffer();
              if(pageObj != null)
              {
                  if(pageObj.getCurrentPage() <= 0 ||
                          pageObj.getMaxRecords() <= 0 ||
                          pageObj.getTotalPages() < 0 ||
                          pageObj.getTotalRecords() < 0)
                  {
                      throw new Exception("pageObj对象数据异常！！");
                  }
                  int totalPages = pageObj.getTotalPages();
                  int currentPage = pageObj.getCurrentPage();
                  int maxRecords = pageObj.getMaxRecords();
                  String pageAction = pageObj.getPageAction();
                  String basePath = pageObj.getBasePath();

                  //cols = cols - 1;
                  
                  sb.append("<td colspan='"+cols +"'>"+bundle.getString("perpage")+"<a  onclick=\"toSelect(this,'"+basePath+pageAction+"')\" style='cursor:hand'>");
                  sb.append(pageObj.getMaxRecords() + "</a>"+bundle.getString("record2")+"&nbsp;&nbsp;"+bundle.getString("total"));
                  sb.append(pageObj.getTotalRecords()+bundle.getString("record")+"&nbsp;&nbsp;"+bundle.getString("cur")+currentPage+bundle.getString("mark")+totalPages+bundle.getString("page")+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
               
                  StringBuffer sbUrl = new StringBuffer();
                  sbUrl.append("style='cursor:hand' onClick=\"changePageTo('"+basePath+pageAction+"',"+maxRecords+","+totalPages+","+currentPage);
                  
                  StringBuffer sbUrlChagePage = new StringBuffer();
                  sbUrlChagePage.append("onclick=\"changeToSelect(this,'"+basePath+pageAction+"',"+maxRecords+","+totalPages+","+currentPage+")\" style='cursor:hand'");
                  
                  String first = bundle.getString("first");
                  String last = bundle.getString("last");
                  String prev = bundle.getString("prev");
                  String next = bundle.getString("next");
                  
                  if(totalPages == 1 || totalPages == 0)
                  {// 0000
                      sb.append(first + "&nbsp;&nbsp;");
                      sb.append(prev + "&nbsp;&nbsp;"); 
                      sb.append(next + "&nbsp;&nbsp;");
                      sb.append(last + "&nbsp;&nbsp;"); 
                      //sb.append("第"+currentPage+"页&nbsp;&nbsp;");
                      
               
                  }
                  else if(totalPages > 1 && currentPage ==1)
                  {// 0011
                            
                      sb.append(first + "&nbsp;&nbsp;");
                      sb.append(prev + "&nbsp;&nbsp;"); 
                      sb.append("<a "+sbUrl+",3)\"><span style='color:blue'>" + next + "</span></a>&nbsp;&nbsp;");
                      sb.append("<a "+sbUrl+",4)\"><span style='color:blue'>" + last + "</span></a>&nbsp;&nbsp;");
                      //sb.append("<a  "+sbUrlChagePage+">第"+currentPage+"页</a>&nbsp;&nbsp;");
                
                  }
                  else if(totalPages > 1 && currentPage ==totalPages)
                  {// 1100
                           
                      sb.append("<a "+sbUrl+",1)\"><span style='color:blue'>" + first + "</span></a>&nbsp;&nbsp;");
                      sb.append("<a "+sbUrl+",2)\"><span style='color:blue'>" + prev + "</span></a>&nbsp;&nbsp;");
                      sb.append(next + "&nbsp;&nbsp;");
                      sb.append(last + "&nbsp;&nbsp;");
                      //sb.append("<a  "+sbUrlChagePage+">第"+currentPage+"页</a>&nbsp;&nbsp;");   
              
                  }
                  else
                  {// 1111
                      
                      sb.append("<a "+sbUrl+",1)\"><span style='color:blue'>" + first + "</span></a>&nbsp;&nbsp;");
                      sb.append("<a "+sbUrl+",2)\"><span style='color:blue'>" + prev + "</span></a>&nbsp;&nbsp;");
                      sb.append("<a "+sbUrl+",3)\"><span style='color:blue'>" + next + "</span></a>&nbsp;&nbsp;");
                      sb.append("<a "+sbUrl+",4)\"><span style='color:blue'>" + last + "</span></a>&nbsp;&nbsp;"); 
                      //sb.append("<a  "+sbUrlChagePage+">第"+currentPage+"页</a>&nbsp;&nbsp;"); 
                  } 
                  sb.append("</td>");
              }
              else
              {
                  throw new Exception("pageObj对象为空！！");
              }
              return sb;
          }
          

          /**
           * 创建上传目录，需要先创建这个文件夹
           * 
           * @param filePath
           * @return
           */

          public static void creatFolder(String filePath)
          {
        	  filePath = filePath.replace("\\", "/");
              java.io.File wt_downTemp = new java.io.File(filePath);
              try
              {
                  if (wt_downTemp.isDirectory())
                  {

                  }
                  else
                  {
                      wt_downTemp.mkdirs();
                  }
              }
              catch (Exception e)
              {

              }
              finally
              {
                  wt_downTemp = null;
              }
              // return bFile;
          }
          /**获取当前时间的提前某个月份的时间
           * @param moString
           * @return
           */
          @SuppressWarnings("deprecation")
          public static String getMonthSith(String moString) {
              String twoHoursSith = "";
              Date mydate = new Date();
              //System.out.println("####mydate111:==" + mydate);
              int moStrings = Integer.parseInt(moString);
              mydate.setMonth(mydate.getMonth() - moStrings);
              twoHoursSith = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                      .format(mydate);
              //System.out.println("####mydate222:==" + twoHoursSith);
              return twoHoursSith;
          } 

    }

   
