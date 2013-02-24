package com.wootion.cimp.tag;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

import com.wootion.cimp.util.Tools;

/**
 * 分页标签
 * 
 * @author Administrator
 * 
 */
public class ShowHtmlTag extends TagSupport {
	private static final long serialVersionUID = -8293192819108951127L;
	private String formname = "";
	private String html;

	@Override
	public int doStartTag() throws JspException {// 这个方法不用所以直接返回值
		return EVAL_BODY_INCLUDE;
	}

	@Override
	public int doEndTag() throws JspException {// 重点在这个方法上
		try {

//			String savepath = ((HttpServletRequest) this.pageContext
//					.getRequest()).getSession().getServletContext()
//					.getRealPath("/");
//			String tpath = savepath+Tools.SAVE_FILES_URL+html+"/index.html";
			//System.out.println("==kk====> " + savepath + html);
			HttpServletRequest request = (HttpServletRequest) this.pageContext
			.getRequest();
			String path = request.getContextPath();
			String[] stem = html.split("@");
			String[] s = stem[0].split(",");
			
			
//			String tmp = "<div style='width:272px;height:452px;word-break:break-all;padding-top:80px;padding-left:21px; background-image:url("
//					+ ((HttpServletRequest) this.pageContext.getRequest())
//							.getContextPath()
//					+ "/pages/train/skins/img/cmcbgk.jpg);'><div style='width:231px;height:300px;word-break:break-all;padding:3px;overflow:auto;'>"
//					+ readFile(tpath)
//					+ "</div><div style='clear:both;'></div></div>";
//			System.out.println("========> "+tmp);
			StringBuffer sb = new StringBuffer();
			sb.append("<select id=\"htmlfiles"+stem[1]+"\">");
			sb.append("<option id=\"htmlid"+stem[1]+"\"  value=\"index.html\">");
			sb.append("index.html");
			sb.append("</option>");
			for(int i=1;i<s.length;i++){
				if("index.html".equals(s[i]))
					continue;
				sb.append("<option id=\"htmlid"+stem[1]+"\" value=\""+s[i]+"\">");
				sb.append(s[i]);
				sb.append("</option>") ;
			}
			sb.append("</select>");
			pageContext.getOut().write(sb.toString());// 标签的返回值
		} catch (Exception ex) {
			throw new JspTagException("分页标签解析错误");
		}
		return EVAL_PAGE;
	}

	public static void main(String[] args) {
		int aaa = 10;
		int bbb = 21;
		//System.out.println(aaa / bbb);
	}

	public String getFormname() {
		return formname;
	}

	public void setFormname(String formname) {
		this.formname = formname;
	}

	public String getHtml() {
		return html;
	}

	public void setHtml(String html) {
		this.html = html;
	}

	private String readFile(String path) {
		String encodin = "UTF-8";
		Reader in = null;
		StringBuffer buffer = new StringBuffer();
		try {
			FileInputStream fis = new FileInputStream(path);
			InputStreamReader isr = new InputStreamReader(fis, encodin);
			in = new BufferedReader(isr);
			int ch;
			while ((ch = in.read()) > -1) {
				buffer.append((char) ch);
			}
			in.close();
			return buffer.toString();
		} catch (IOException e) {
			//e.printStackTrace();
			return null;

		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
