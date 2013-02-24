package com.wootion.cimp.util;


import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.wootion.cimp.util.CompressBook;


/**
 * Servlet implementation class for Servlet: FileServlet
 *
 */
public class ZipFileServlet extends javax.servlet.http.HttpServlet
    implements
        javax.servlet.Servlet
{

    static final long serialVersionUID = 1L;

    private static String baseDir = "/FILE/";//上传文件存储目录

    /* (non-Java-doc)
     * @see javax.servlet.http.HttpServlet#HttpServlet()
     */
    public void FileServlet()
    {
    }

    /* (non-Java-doc)
     * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        // TODO Auto-generated method stub
    }

    /* (non-Java-doc)
     * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        // TODO Auto-generated method stub

        response.setContentType("text/html; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        /*获取web.xml中servlet的配置文件目录参数*/
        baseDir = this.getInitParameter("baseDir");

        /*获取文件上传存储的相对路径*/
        if (StringUtils.isBlank(baseDir))
            baseDir = "/FILE/";
        String realBaseDir = this.getServletConfig().getServletContext().getRealPath(
            baseDir);
        System.out.println(realBaseDir);
        File baseFile = new File(realBaseDir);
        if (!baseFile.exists())
        {
            baseFile.mkdir();
        }

        //获取编辑器源码
        String source = new String(request.getParameter("xh_editor").getBytes(
            "ISO-8859-1"), "UTF-8");
        //获取相对路径
        String tempDir = "/cmmb" + baseDir;
        //将源码中相对路径替换为空
        String soutceTemp = source.replace(tempDir, "");
        //设置源码 +头
        String cmlSource = "<html><head>"
            + "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>"
            + "<title>预览</title>" + "</head><body>" + soutceTemp + "</body></html>";
        //String cmlSource="<html><head>"+ "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>"+"<title>预览</title>"+"</head><body>"+soutceTemp+"</body></html>";
        //设置生成源码文件名（绝对路径+文件名）
        String fileName = realBaseDir + "\\" + "index.html";
        //将CML编辑器源码保存到文件
        saveStringToFile(fileName, cmlSource, "UTF-8");
        String zippath = request.getSession().getServletContext().getRealPath("/")+"/temp.zip"; 
        try {
			new CompressBook().zip(zippath,new File(realBaseDir));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        //将request跳转至CML.jsp 在CML.jsp中取属性值
        request.getRequestDispatcher("cimp/cml/cml_edit.jsp").forward(request, response);

    }

    /* 将文本内容写入文件	 
    * @param fileName 带有完整绝对路径的文件名	 
    * @param encoding 文本文件打开的编码方式	 
    * @param towrite 文本内容	 */
    public static void saveStringToFile(String fileName, String towrite, String encoding)
    {
        FileOutputStream fos = null;
        OutputStreamWriter osw = null;
        try
        {
            File file = new File(fileName);
            if (!file.exists())
            {
                file.createNewFile();
                file = new File(fileName);
            }
            fos = new FileOutputStream(file);
            osw = new OutputStreamWriter(fos, encoding);
            osw.write(towrite);
            osw.flush();

        } catch (IOException e)
        {
            e.printStackTrace();
        } finally
        {
            try
            {
                if (null != osw)
                    osw.close();
                if (null != fos)
                    fos.close();
            } catch (IOException e)
            {
                // TODO Auto-generated catch block				
                e.printStackTrace();
            }
        }
    }

}