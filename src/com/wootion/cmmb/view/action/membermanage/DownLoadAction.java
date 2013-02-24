package com.wootion.cmmb.view.action.membermanage;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DownLoadAction extends ActionSupport {
	// 下载文件原始存放路径
	// 文件名参数变量
	private String fileName;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	// 从下载文件原始存放路径读取得到文件输出流
	public InputStream getDownloadFile() {
		System.out.println(fileName);
		System.out.println(ServletActionContext.getServletContext());
		return ServletActionContext.getServletContext().getResourceAsStream(
				"/temp/" + getRequest().getParameter("filename"));
	}

	// 如果下载文件名为中文，进行字符编码转换
	public String getDownloadChineseFileName() {
		String downloadChineseFileName = getRequest().getParameter("filename");

		try {
			downloadChineseFileName = new String(downloadChineseFileName
					.getBytes(), "ISO8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return downloadChineseFileName;
	}

	public String execute() {
		//DOWNLOADFILEPATH = getRequest().getSession().getServletContext().getRealPath("/")+"/temp/";
		return SUCCESS;
	}
	
	private HttpServletRequest getRequest() {
		ActionContext ctx = ActionContext.getContext();
		return (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	}
}