package com.wootion.cmmb.view.action.recovery;

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
import com.wootion.cmmb.persistenc.po.bean.sensoryhistory;
import com.wootion.cmmb.persistenc.po.bean.sensoryinfo;
import com.wootion.cmmb.service.activity.SensoryService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class sensoryAction extends BaseAction{
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    private String sid;
	private String sdate;
	private String sstarttime;
	private String sendtime;
	private String sattend;
	private String sinfo;
	private String swrite;
	private String sbelongpro;
	private String snumber;
	private QueryResult<sensoryinfo> result;
	public SensoryService sensoryservice;
	sensoryAction() {
		sensoryservice = IMPServiceFactory.getSensoryService();
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
			result = sensoryservice.getQuerySenResult(firstindex, maxresult, 
					sdate, sattend, swrite, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "sensorymange";
	}

	public String add() 
	{
		return "addlist";
	}
	
	public String saveSenchology() throws Exception
	{
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = response.getWriter();
		try
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			String sdate = sdf.format(new Date());
			sensoryinfo sinfos = new sensoryinfo();
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
						sstarttime = pstrs[k];
					}
					else if (k == 1)
					{
						sendtime = pstrs[k];
					}
					else if (k == 2)
					{
						sattend = pstrs[k];
					}
					else if (k == 3)
					{
						sinfo = pstrs[k];
					}
					else if (k == 4)
					{
						swrite = pstrs[k];
					}
					else if (k == 5)
					{
						sbelongpro = pstrs[k];
					}
				}
				sinfos.setSdate(sdate);
				sinfos.setSstarttime(sstarttime);
				sinfos.setSendtime(sendtime);
				sinfos.setSattend(sattend);
				sinfos.setSinfo(sinfo);
				sinfos.setSwrite(swrite);
				sinfos.setSbelongpro(sbelongpro);
				sinfos.setSnumber(sdate);
				sensoryservice.saveSenchology(sinfos);
			}
			out.print("success");
		}catch(Exception e)
		{
			e.printStackTrace();
			out.print("error");
		}
		
		return null;
	}
	
	public String deletesen() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String snumber = request.getParameter("snumber");// 活动id
			out = response.getWriter();
			flag = sensoryservice.delesenchology(snumber);
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
	
	public String delchoosesen() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String sidstr = request.getParameter("sid");// 活动id
			String strs[] = sidstr.split("\\|");
			for (int i=0; i<strs.length; i++)
			{
				out = response.getWriter();
				flag = sensoryservice.delesenchoose(strs[i]);
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
	
	public String senmodify() throws Exception{
		HttpServletRequest request = getRequest();
		String snumber = request.getParameter("snumber");
		List<sensoryinfo> psy = new ArrayList<sensoryinfo>();

		try {
			psy = sensoryservice.lookSenchology(snumber);// 获取康复信息
			if (psy!=null) {
				request.setAttribute("result", psy);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("senedit");
	}
	
	public String senview() throws Exception{
		HttpServletRequest request = getRequest();
		String snumber = request.getParameter("snumber");
		List<sensoryinfo> psy = new ArrayList<sensoryinfo>();

		try {
			psy = sensoryservice.lookSenchology(snumber);// 获取康复信息
			if (psy!=null) {
				request.setAttribute("result", psy);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("senview");
	}
	
	public String modifysen() throws Exception
	{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	String flag = "";
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String sdate = sdf.format(new Date());
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
					sid = pstrs[k];
				}
				else if (k == 1)
				{
					snumber = pstrs[k];
				}
				else if (k == 2)
				{
					sstarttime = pstrs[k];
				}
				else if (k == 3)
				{
					sendtime = pstrs[k];
				}
				else if (k == 4)
				{
					sattend = pstrs[k];
				}
				else if (k == 5)
				{
					sinfo = pstrs[k];
				}
				else if (k == 6)
				{
					swrite = pstrs[k];
				}
				else if (k == 7)
				{
					sbelongpro = pstrs[k];
				}
			}
			
//			String pstarttime = request.getParameter("pstarttime").trim();
//			String pendtime = request.getParameter("pendtime").trim();
//			String pattend = request.getParameter("pattend").trim();
//			String pinfo = request.getParameter("pinfo").trim();
//			String pwrite = request.getParameter("pwrite").trim();
			flag = sensoryservice.modifysen(sid, snumber, sdate, sstarttime, sendtime, sattend, sinfo, swrite, sbelongpro);
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
	
	public String viewacthistory() throws Exception{
		HttpServletRequest request = getRequest();
		String snumber = request.getParameter("snumber");
		List<sensoryhistory> psyhis = new ArrayList<sensoryhistory>();

		try {
			psyhis = sensoryservice.lookSensoryhis(snumber);// 获取康复信息
			if (psyhis!=null) {
				request.setAttribute("result", psyhis);
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

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getSstarttime() {
		return sstarttime;
	}

	public void setSstarttime(String sstarttime) {
		this.sstarttime = sstarttime;
	}

	public String getSendtime() {
		return sendtime;
	}

	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}

	public String getSattend() {
		return sattend;
	}

	public void setSattend(String sattend) {
		this.sattend = sattend;
	}

	public String getSinfo() {
		return sinfo;
	}

	public void setSinfo(String sinfo) {
		this.sinfo = sinfo;
	}

	public String getSwrite() {
		return swrite;
	}

	public void setSwrite(String swrite) {
		this.swrite = swrite;
	}

	public String getSbelongpro() {
		return sbelongpro;
	}

	public void setSbelongpro(String sbelongpro) {
		this.sbelongpro = sbelongpro;
	}

	public String getSnumber() {
		return snumber;
	}

	public void setSnumber(String snumber) {
		this.snumber = snumber;
	}

	public QueryResult<sensoryinfo> getResult() {
		return result;
	}

	public void setResult(QueryResult<sensoryinfo> result) {
		this.result = result;
	}
    
}
