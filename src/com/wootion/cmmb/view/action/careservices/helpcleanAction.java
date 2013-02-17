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
import com.wootion.cmmb.persistenc.po.bean.Helpcleanhistory;
import com.wootion.cmmb.persistenc.po.bean.Helpcleaninfo;
import com.wootion.cmmb.persistenc.po.bean.bathrecordinfo;
import com.wootion.cmmb.service.careservices.BathrecordService;
import com.wootion.cmmb.service.careservices.HelpcleanService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class helpcleanAction extends BaseAction{

	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
    private String hid;
    private String hdate;
    private String hnumber;
    private String hname;
    private String hclothingnum;
    private String hrequirement;
    private String hpeople;
    private String hinfo;
    private String hbelongpro;
    
    private QueryResult<Helpcleaninfo> result;
    public HelpcleanService helpcleanservice;
    helpcleanAction()
    {
    	helpcleanservice = IMPServiceFactory.getHelpcleanService();
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
			result = helpcleanservice.getQueryHelResult(firstindex, maxresult, 
					hdate, hname, hpeople, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "helpcleanmange";
	}
	
	public String saveHelpclean() throws Exception
	{
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = response.getWriter();
		try
		{
			Helpcleaninfo hinfos = new Helpcleaninfo();
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
						hname = pstrs[k];
					}
					else if (k == 1)
					{
						hclothingnum = pstrs[k];
					}
					else if (k == 2)
					{
						hrequirement = pstrs[k];
					}
					else if (k == 3)
					{
						hpeople = pstrs[k];
					}
					else if (k == 4)
					{
						hinfo = pstrs[k];
					}
					else if (k == 5)
					{
						hbelongpro = pstrs[k];
					}
				}
				hinfos.setHdate(timestamp);
				hinfos.setHnumber(timestamp);
				hinfos.setHname(hname);
				hinfos.setHclothingnum(hclothingnum);
				hinfos.setHrequirement(hrequirement);
				hinfos.setHpeople(hpeople);
				hinfos.setHinfo(hinfo);
				hinfos.setHbelongpro(hbelongpro);
				helpcleanservice.saveHelpclean(hinfos);
				
			}
			out.print("success");
		}catch(Exception e)
		{
			e.printStackTrace();
			out.print("error");
		}
		
		return null;

	}
	
	public String helmodify() throws Exception{
		HttpServletRequest request = getRequest();
		String hdate = request.getParameter("hdate");
		List<Helpcleaninfo> hel = new ArrayList<Helpcleaninfo>();

		try {
			hel = helpcleanservice.lookHelpclean(hdate);// 获取活动信息
			if (hel!=null) {
				request.setAttribute("result", hel);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("heledit");
	}
	
	public String helview() throws Exception{
		HttpServletRequest request = getRequest();
		String hdate = request.getParameter("hdate");
		List<Helpcleaninfo> hel = new ArrayList<Helpcleaninfo>();

		try {
			hel = helpcleanservice.lookHelpclean(hdate);// 获取活动信息
			if (hel!=null) {
				request.setAttribute("result", hel);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("helview");
	}
	
	public String modifyhel() throws Exception
	{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	String flag = "";
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String hnumber = sdf.format(new Date());
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
					hid = pstrs[k];
				}
				else if (k == 1)
				{
					hdate = pstrs[k];
				}
				else if (k == 2)
				{
					hname = pstrs[k];
				}
				else if (k == 3)
				{
					hclothingnum = pstrs[k];
				}
				else if (k == 4)
				{
					hrequirement = pstrs[k];
				}
				else if (k == 5)
				{
					hpeople = pstrs[k];
				}
				else if (k == 6)
				{
					hinfo = pstrs[k];
				}
				else if (k == 7)
				{
					hbelongpro = pstrs[k];
				}
			}
			
    	flag = helpcleanservice.modifyhel(hid, hdate, hnumber, hname, hclothingnum, hrequirement, hpeople, hinfo, hbelongpro);
		
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
	
	public String deletehel() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String hdate = request.getParameter("hdate");// 活动id
			out = response.getWriter();
			flag = helpcleanservice.deleHelpcleaninfo(hdate);
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
	
	public String delchoosehel() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String aidstr = request.getParameter("hid");// 活动id
			String strs[] = aidstr.split("\\|");
			for (int i=0; i<strs.length; i++)
			{
				out = response.getWriter();
				flag = helpcleanservice.delehelchoose(strs[i]);
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
		String hdate = request.getParameter("hdate");
		List<Helpcleanhistory> helhis = new ArrayList<Helpcleanhistory>();

		try {
			helhis = helpcleanservice.lookHelpcleanhis(hdate);// 获取活动信息
			if (helhis!=null) {
				request.setAttribute("result", helhis);
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

	public String getHid() {
		return hid;
	}

	public void setHid(String hid) {
		this.hid = hid;
	}

	public String getHdate() {
		return hdate;
	}

	public void setHdate(String hdate) {
		this.hdate = hdate;
	}

	public String getHnumber() {
		return hnumber;
	}

	public void setHnumber(String hnumber) {
		this.hnumber = hnumber;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getHclothingnum() {
		return hclothingnum;
	}

	public void setHclothingnum(String hclothingnum) {
		this.hclothingnum = hclothingnum;
	}

	public String getHrequirement() {
		return hrequirement;
	}

	public void setHrequirement(String hrequirement) {
		this.hrequirement = hrequirement;
	}

	public String getHpeople() {
		return hpeople;
	}

	public void setHpeople(String hpeople) {
		this.hpeople = hpeople;
	}

	public String getHinfo() {
		return hinfo;
	}

	public void setHinfo(String hinfo) {
		this.hinfo = hinfo;
	}

	public String getHbelongpro() {
		return hbelongpro;
	}

	public void setHbelongpro(String hbelongpro) {
		this.hbelongpro = hbelongpro;
	}

	public QueryResult<Helpcleaninfo> getResult() {
		return result;
	}

	public void setResult(QueryResult<Helpcleaninfo> result) {
		this.result = result;
	}
	
	
}
