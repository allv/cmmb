package com.wootion.cimp.util;
import java.io.File; 
import java.io.FileInputStream; 
import java.io.FileOutputStream; 
import java.util.zip.ZipEntry; 
import java.util.zip.ZipOutputStream; 

public class CompressBook { 
public CompressBook() {} 

    /**//* 
    * inputFileName 输入一个文件夹 
    * zipFileName 输出一个压缩文件夹 
    */ 
    public void zip(String inputFileName) throws Exception { 
        String zipFileName = "E:\\apache-tomcat-5.5.26\\webapps\\FMT\\ZIPFILE\\11.zip"; //打包后文件名字 
        String fpath = "E:\\apache-tomcat-5.5.26\\webapps\\FMT\\ZIPFILE" ;
        File f = new File(fpath);
        if(!f.exists()){
        	f.mkdirs();
        }
        //System.out.println(zipFileName); 
        zip(zipFileName, new File(inputFileName)); 
    } 

    public void zip(String zipFileName, File inputFile) throws Exception { 
        ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zipFileName)); 
        zip(out, inputFile, ""); 
        out.close(); 
    } 

    public void zip(ZipOutputStream out, File f, String base) throws Exception { 
        if (f.isDirectory()) { 
           File[] fl = f.listFiles(); 
           out.putNextEntry(new ZipEntry(base + "/")); 
           base = base.length() == 0 ? "" : base + "/"; 
           for (int i = 0; i < fl.length; i++) { 
        	 if(fl[i].getName().equals("temp.html"))
        		  continue;
        	   zip(out, fl[i], base + fl[i].getName()); 
         } 
        }else { 
           out.putNextEntry(new ZipEntry(base)); 
           FileInputStream in = new FileInputStream(f); 
           int b; 
           System.out.println(f.getName()); 
         
           while ( (b = in.read()) != -1) { 
        		   out.write(b); 
		       } 
		       in.close(); 
            
        }
    } 

    public static void main(String [] temp){ 
        CompressBook book = new CompressBook(); 
        try { 
           book.zip("E:\\apache-tomcat-5.5.26\\webapps\\FMT\\FILE\\37");//你要压缩的文件夹 
        }catch (Exception ex) { 
           ex.printStackTrace(); 
       } 
    } 

} 