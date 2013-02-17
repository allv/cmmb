package com.wootion.cmmb.view.action.careservices;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.Activityinfo;
import com.wootion.cmmb.persistenc.po.bean.bathrecordhistory;
import com.wootion.cmmb.persistenc.po.bean.bathrecordinfo;
import com.wootion.cmmb.service.careservices.BathrecordService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class bathrecordAction extends BaseAction{

	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
    private String cid;
    private String cdate;
    private String cnumber;
    private String cname;
    private String clevel;
    private String cstarttime;
    private String cendtime;
    private String cpeople;
    private String cinfo;
    private String cbelongpro;
    
    private QueryResult<bathrecordinfo> result;
    public BathrecordService bathrecordservice;
    bathrecordAction()
    {
    	bathrecordservice = IMPServiceFactory.getBathrecordService();
    }
    
    public String add() 
	{
		return "addlist";
	}
    
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		Integer firstindex = 1;//当前页数
        Integer maxresult = 10;//每页显示数
        if (nowpage != null && !nowpage.trim().equals(""))
        {
            firstindex = Integer.parseInt(nowpage.trim());
            if (firstindex == 0)
            {
                firstindex = 1;
            }
        }
        if (maxpage != null && !maxpage.trim().equals(""))
        {
        	maxresult = Integer.parseInt(maxpage.trim());
        }
        
        try {
			result = bathrecordservice.getQueryActResult(firstindex, maxresult, 
					cdate, cname, cpeople, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "bathrecordmange";
	}
	
	public String saveBathrecord() throws Exception
	{
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = response.getWriter();
		try
		{
			bathrecordinfo binfos = new bathrecordinfo();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			String timestamp = sdf.format(new Date());
			String dtal = request.getParameter("detail");
			String strs[] = dtal.split("\\|");
			for (int i=0; i<strs.length; i++)
			{
				String pdetails = strs[i];
				String pstrs[] = pdetails.split("\\^");
				for (int k=0; k<pstrs.length; k++)
				{
					if (k == 0)
					{
						cname = pstrs[k];
					}
					else if (k == 1)
					{
						clevel = pstrs[k];
					}
					else if (k == 2)
					{
						cstarttime = pstrs[k];
					}
					else if (k == 3)
					{
						cendtime = pstrs[k];
					}
					else if (k == 4)
					{
						cpeople = pstrs[k];
					}
					else if (k == 5)
					{
						cinfo = pstrs[k];
					}
					else if (k == 6)
					{
						cbelongpro = pstrs[k];
					}
				}
				binfos.setCdate(timestamp);
				binfos.setCnumber(timestamp);
				binfos.setCname(cname);
				binfos.setClevel(clevel);
				binfos.setCstarttime(cstarttime);
				binfos.setCendtime(cendtime);
				binfos.setCpeople(cpeople);
				binfos.setCinfo(cinfo);
				binfos.setCbelongpro(cbelongpro);
				bathrecordservice.saveBathrecord(binfos);
			}
			out.print("success");
		}catch(Exception e)
		{
			e.printStackTrace();
			out.print("error");
		}finally{
			out.flush();
			out.close();			
		}
		return null;
	}
	
	public String batmodify() throws Exception{
		HttpServletRequest request = getRequest();
		String cdate = request.getParameter("cdate");
		List<bathrecordinfo> bat = new ArrayList<bathrecordinfo>();

		try {
			bat = bathrecordservice.lookBathrecord(cdate);// 获取活动信息
			if (bat!=null) {
				request.setAttribute("result", bat);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("batedit");
	}
	
	public String batview() throws Exception{
		HttpServletRequest request = getRequest();
		String cdate = request.getParameter("cdate");
		List<bathrecordinfo> bat = new ArrayList<bathrecordinfo>();

		try {
			bat = bathrecordservice.lookBathrecord(cdate);// 获取活动信息
			if (bat!=null) {
				request.setAttribute("result", bat);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("batview");
	}
	
	public String modifybat() throws Exception
	{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	String flag = "";
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String cnumber = sdf.format(new Date());
		String dtal = request.getParameter("detail");
		String strs[] = dtal.split("\\|");
		for (int i=0; i<strs.length; i++)
		{
			String pdetails = strs[i];
			String pstrs[] = pdetails.split("\\^");
			for (int k=0; k<pstrs.length; k++)
			{
				if (k == 0)
				{
					cid = pstrs[k];
				}
				else if (k == 1)
				{
					cdate = pstrs[k];
				}
				else if (k == 2)
				{
					cname = pstrs[k];
				}
				else if (k == 3)
				{
					clevel = pstrs[k];
				}
				else if (k == 4)
				{
					cstarttime = pstrs[k];
				}
				else if (k == 5)
				{
					cendtime = pstrs[k];
				}
				else if (k == 6)
				{
					cpeople = pstrs[k];
				}
				else if (k == 7)
				{
					cinfo = pstrs[k];
				}
				else if (k == 8)
				{
					cbelongpro = pstrs[k];
				}
			}
			
    	flag = bathrecordservice.modifybat(cid, cdate, cnumber, cname, clevel, cstarttime, cendtime, cpeople, cinfo, cbelongpro);
		
		}
    	PrintWriter out = null;
    	try {
			out = response.getWriter();
			out.print(flag);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("error");
		} finally {
			out.flush();
			out.close();
		}
		return null;
	}
	
	public String deletebat() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String cdate = request.getParameter("cdate");// 活动id
			out = response.getWriter();
			flag = bathrecordservice.deleBathrecordinfo(cdate);
			if (flag) {
				out.print("success");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("删除失败！");
		} finally {
			out.flush();
			out.close();
		}
		return null;
    }
	
	public String delchoosebat() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String aidstr = request.getParameter("cid");// 活动id
			String strs[] = aidstr.split("\\|");
			for (int i=0; i<strs.length; i++)
			{
				out = response.getWriter();
				flag = bathrecordservice.delebatchoose(strs[i]);
			}
			if (flag) {
				out.print("success");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("删除失败！");
		} finally {
			out.flush();
			out.close();
		}
		return null;
    }
	
	public String viewacthistory() throws Exception{
		HttpServletRequest request = getRequest();
		String cdate = request.getParameter("cdate");
		List<bathrecordhistory> bathis = new ArrayList<bathrecordhistory>();

		try {
			bathis = bathrecordservice.lookBathrecordhis(cdate);// 获取活动信息
			if (bathis!=null) {
				request.setAttribute("result", bathis);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("viewacthis");
	}
	
	private HttpServletRequest getRequest() {
		ActionContext ctx = ActionContext.getContext();
		return (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	}

	private HttpServletResponse getResponse() {
		ActionContext ctx = ActionContext.getContext();
		return (HttpServletResponse) ctx
				.get(ServletActionContext.HTTP_RESPONSE);
	}
	
	public String getNowpage() {
		return nowpage;
	}
	public void setNowpage(String nowpage) {
		this.nowpage = nowpage;
	}
	public String getMaxpage() {
		return maxpage;
	}
	public void setMaxpage(String maxpage) {
		this.maxpage = maxpage;
	}
	public String getPerPageNumber() {
		return perPageNumber;
	}
	public void setPerPageNumber(String perPageNumber) {
		this.perPageNumber = perPageNumber;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getCnumber() {
		return cnumber;
	}
	public void setCnumber(String cnumber) {
		this.cnumber = cnumber;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getClevel() {
		return clevel;
	}
	public void setClevel(String clevel) {
		this.clevel = clevel;
	}
	public String getCstarttime() {
		return cstarttime;
	}
	public void setCstarttime(String cstarttime) {
		this.cstarttime = cstarttime;
	}
	public String getCendtime() {
		return cendtime;
	}
	public void setCendtime(String cendtime) {
		this.cendtime = cendtime;
	}
	public String getCpeople() {
		return cpeople;
	}
	public void setCpeople(String cpeople) {
		this.cpeople = cpeople;
	}
	public String getCinfo() {
		return cinfo;
	}
	public void setCinfo(String cinfo) {
		this.cinfo = cinfo;
	}
	public String getCbelongpro() {
		return cbelongpro;
	}
	public void setCbelongpro(String cbelongpro) {
		this.cbelongpro = cbelongpro;
	}

	public QueryResult<bathrecordinfo> getResult() {
		return result;
	}

	public void setResult(QueryResult<bathrecordinfo> result) {
		this.result = result;
	}
    
}
