package com.wootion.cmmb.view.utils;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.servlet.ServletUtilities;

public class MyChartUtility extends ServletUtilities{
	 private static String tempFilePrefix = "jfreechart-";
	 private static String tempOneTimeFilePrefix = "jfreechart-onetime-";
	 
	 public static String saveMyChartAsPNG(JFreeChart chart, int width, int height, ChartRenderingInfo info, HttpSession session)
     throws IOException
     {
	     if(chart == null)
	         throw new IllegalArgumentException("Null 'chart' argument.");
	     createTempDir();
	     String prefix = tempFilePrefix;
	     if(session == null)
	         prefix = tempOneTimeFilePrefix;
	     
	     String dir =session.getServletContext().getRealPath("/");

	     File file =new File(dir+"/temp/");
	       if(!file.exists()){
	          file.mkdir();
	       }
	     File tempFile = File.createTempFile(prefix, ".png", file);
	     ChartUtilities.saveChartAsPNG(tempFile, chart, width, height, info);
	     if(session != null)
	         registerChartForDeletion(tempFile, session);
	     return tempFile.getName();
     }
}
