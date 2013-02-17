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
import com.wootion.cmmb.persistenc.po.bean.psychologyhistory;
import com.wootion.cmmb.persistenc.po.bean.psychologyinfo;
import com.wootion.cmmb.service.psychology.PsychologyService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class psychologyAction extends BaseAction{
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    private String pid;
	private String pdate;
	private String pstarttime;
	private String pendtime;
	private String pattend;
	private String pinfo;
	private String pwrite;
	private String pbelongpro;
	private String pnumber;
	private QueryResult<psychologyinfo> result;
	public PsychologyService psychologyservice;
	psychologyAction() {
		psychologyservice = IMPServiceFactory.getPsychologyService();
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
			result = psychologyservice.getQueryActResult(firstindex, maxresult, 
					pdate, pwrite, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "psychologymange";
	}

	public String add() 
	{
		return "addlist";
	}
	
	public String savePsychology() throws Exception
	{
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = response.getWriter();
		try
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			String pdate = sdf.format(new Date());
			psychologyinfo pinfos = new psychologyinfo();
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
						pstarttime = pstrs[k];
					}
					else if (k == 1)
					{
						pendtime = pstrs[k];
					}
					else if (k == 2)
					{
						pattend = pstrs[k];
					}
					else if (k == 3)
					{
						pinfo = pstrs[k];
					}
					else if (k == 4)
					{
						pwrite = pstrs[k];
					}
					else if (k == 5)
					{
						pbelongpro = pstrs[k];
					}
				}
				pinfos.setPdate(pdate);
				pinfos.setPstarttime(pstarttime);
				pinfos.setPendtime(pendtime);
				pinfos.setPattend(pattend);
				pinfos.setPinfo(pinfo);
				pinfos.setPwrite(pwrite);
				pinfos.setPbelongpro(pbelongpro);
				pinfos.setPnumber(pdate);
				psychologyservice.savePsychology(pinfos);
			}
			out.print("success");
		}catch(Exception e)
		{
			e.printStackTrace();
			out.print("error");
		}
		return null;
	}
	
	public String deletepsy() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String pnumber = request.getParameter("pnumber");// 活动id
			out = response.getWriter();
			flag = psychologyservice.delepsychology(pnumber);
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
	
	public String delchoosepsy() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String pidstr = request.getParameter("pid");// 活动id
			String strs[] = pidstr.split("\\|");
			for (int i=0; i<strs.length; i++)
			{
				out = response.getWriter();
				flag = psychologyservice.delepsychoose(strs[i]);
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
	
	public String psymodify() throws Exception{
		HttpServletRequest request = getRequest();
		String pnumber = request.getParameter("pnumber");
		List<psychologyinfo> psy = new ArrayList<psychologyinfo>();

		try {
			psy = psychologyservice.lookPsychology(pnumber);// 获取康复信息
			if (psy!=null) {
				request.setAttribute("result", psy);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("psyedit");
	}
	
	public String psyview() throws Exception{
		HttpServletRequest request = getRequest();
		String pnumber = request.getParameter("pnumber");
		List<psychologyinfo> psy = new ArrayList<psychologyinfo>();

		try {
			psy = psychologyservice.lookPsychology(pnumber);// 获取康复信息
			if (psy!=null) {
				request.setAttribute("result", psy);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("psyview");
	}
	
	public String modifypsy() throws Exception
	{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	String flag = "";
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String pdate = sdf.format(new Date());
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
					pid = pstrs[k];
				}
				else if (k == 1)
				{
					pnumber = pstrs[k];
				}
				else if (k == 2)
				{
					pstarttime = pstrs[k];
				}
				else if (k == 3)
				{
					pendtime = pstrs[k];
				}
				else if (k == 4)
				{
					pattend = pstrs[k];
				}
				else if (k == 5)
				{
					pinfo = pstrs[k];
				}
				else if (k == 6)
				{
					pwrite = pstrs[k];
				}
				else if (k == 7)
				{
					pbelongpro = pstrs[k];
				}
			}
			
//			String pstarttime = request.getParameter("pstarttime").trim();
//			String pendtime = request.getParameter("pendtime").trim();
//			String pattend = request.getParameter("pattend").trim();
//			String pinfo = request.getParameter("pinfo").trim();
//			String pwrite = request.getParameter("pwrite").trim();
			flag = psychologyservice.modifypsy(pid, pnumber, pdate, pstarttime, pendtime, pattend, pinfo, pwrite, pbelongpro);
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
		String pnumber = request.getParameter("pnumber");
		List<psychologyhistory> psyhis = new ArrayList<psychologyhistory>();

		try {
			psyhis = psychologyservice.lookPsychologyhis(pnumber);// 获取康复信息
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

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getPstarttime() {
		return pstarttime;
	}

	public void setPstarttime(String pstarttime) {
		this.pstarttime = pstarttime;
	}

	public String getPendtime() {
		return pendtime;
	}

	public void setPendtime(String pendtime) {
		this.pendtime = pendtime;
	}

	public String getPattend() {
		return pattend;
	}

	public void setPattend(String pattend) {
		this.pattend = pattend;
	}

	public String getPinfo() {
		return pinfo;
	}

	public void setPinfo(String pinfo) {
		this.pinfo = pinfo;
	}

	public String getPwrite() {
		return pwrite;
	}

	public void setPwrite(String pwrite) {
		this.pwrite = pwrite;
	}

	public QueryResult<psychologyinfo> getResult() {
		return result;
	}

	public void setResult(QueryResult<psychologyinfo> result) {
		this.result = result;
	}

	public String getPbelongpro() {
		return pbelongpro;
	}

	public void setPbelongpro(String pbelongpro) {
		this.pbelongpro = pbelongpro;
	}

	public String getPnumber() {
		return pnumber;
	}

	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}
    
}
