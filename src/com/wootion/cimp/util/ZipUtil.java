package com.wootion.cimp.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.CRC32;
import java.util.zip.CheckedOutputStream;

import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;

public class ZipUtil {
private static List list = new ArrayList();
    
    public static void main(String argv[]) {
        try {
            byte b[] = new byte[512];
            
            //压缩文件的保存路径
            String zipFile = "D:/log/test.zip";
            
            //压缩文件目录
            String filepath = "D:/programfiles/tomcat-6.0.18/webapps/cmmb/cimp/saveFiles/100120100830141839/";
            
            List fileList = allFile(filepath);
//            for (int i = 0; i <fileList.size(); i++) {
//				System.out.println("============> "+fileList.get(i));
//			}
            FileOutputStream fileOutputStream = new FileOutputStream(zipFile);
            //使用输出流检查
            CheckedOutputStream cs = new CheckedOutputStream(fileOutputStream, new CRC32());
            //声明输出zip流
            ZipOutputStream out = new ZipOutputStream(new BufferedOutputStream(
                    cs));
            
            
            
            
//            for (int i = 0; i < fileList.size(); i++) {
//               InputStream in = new FileInputStream((String)fileList.get(i));
//               String fileName = ((String)(fileList.get(i))).replace(File.separatorChar,'/');
//               System.out.println("ziping " + fileName);
//               fileName = fileName.substring(fileName.indexOf("/")+1);
//               
//               ZipEntry e = new ZipEntry(fileName);
//               out.putNextEntry(e);
//               int len = 0;
//               while((len = in.read(b)) != -1) {
//                   out.write(b,0,len);
//                 }
//               out.closeEntry();
//            }
            
            for (int i = 0; i < fileList.size(); i++) {
            	InputStream in = new FileInputStream((String)fileList.get(i));
            	String fileName = ((String)(fileList.get(i))).replace(File.separatorChar,'/');

            	//fileName = fileName
				//.substring(fileName.lastIndexOf("/") + 1);
				
            	//filepath
            	String kmc = fileName.replace(filepath, "");
            	
            	//System.out.println("=========================> "+fileName);
				//System.out.println("*************************> "+filepath);
				//fileName = fileName.substring(fileName.indexOf("/")+1);
				ZipEntry e = new ZipEntry(kmc);
				out.putNextEntry(e);
				int len = 0;
				while ((len = in.read(b)) != -1) {
					out.write(b, 0, len);
				}
				out.closeEntry();
			}
            
            
            out.close();  
            //System.out.println("done!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private static List allFile(String path)
    {       
        File file = new File(path);
        String[] array = null;
        String sTemp = "";
                

        if(file.isDirectory())
        {
        }else{
            return null;
        }
        array= file.list();
        if(array.length>0)
        {
            for(int i=0;i<array.length;i++)
            {
                sTemp = path+array[i];
                file = new File(sTemp);
                if(file.isDirectory())
                {
                    allFile(sTemp+"/");

                }else{
                    list.add(sTemp);
                }
            }
        }else{
            return null;
        }

        return list;
    	
//    	List list = new ArrayList();
//
//		File file = new File(path);
//		String[] array = null;
//		String sTemp = "";
//
//		if (file.isDirectory()) {
//		} else {
//			return null;
//		}
//		array = file.list();
//		if (array.length > 0) {
//			for (int i = 0; i < array.length; i++) {
//				sTemp = path + array[i];
//				file = new File(sTemp);
//				if (file.isDirectory()) {
//					allFile(sTemp + "/");
//
//				} else {
//					list.add(sTemp);
//				}
//			}
//		} else {
//			return null;
//		}
//
//		return list;
    }    

    

}
