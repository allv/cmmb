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
import com.wootion.cmmb.persistenc.po.bean.Othercareservicesinfo;
import com.wootion.cmmb.persistenc.po.bean.Serviceplanhistory;
import com.wootion.cmmb.persistenc.po.bean.Serviceplaninfo;
import com.wootion.cmmb.persistenc.po.bean.bathrecordinfo;
import com.wootion.cmmb.service.careservices.BathrecordService;
import com.wootion.cmmb.service.careservices.OthercareservicesService;
import com.wootion.cmmb.service.careservices.ServiceplanService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class serviceplanAction extends BaseAction{

	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
    private String sid;
    private String snumber;
    private String sname;
    private String sgender;
    private String sage;
    private String sdate;
    private String sproject1;
    private String sproject2;
    private String sproject3;
    private String sproject4;
    private String sproject5;
    private String sproject6;
    private String sproject7;
    private String sproject8;
    private String sother;
    private String speople;
    private String status;
    private String sbelongpro;
    
    private QueryResult<Serviceplaninfo> result;
    public ServiceplanService serviceplanservice;
    serviceplanAction()
    {
    	serviceplanservice = IMPServiceFactory.getServiceplanService();
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
			result = serviceplanservice.getQuerySerResult(firstindex, maxresult, 
					sdate, sname, speople, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "serviceplanmange";
	}
	
	public String saveServiceplan() throws Exception
	{
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = response.getWriter();
		try
		{
			Serviceplaninfo sinfos = new Serviceplaninfo();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
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
						sname = pstrs[k];
					}
					else if (k == 1)
					{
						sgender = pstrs[k];
					}
					else if (k == 2)
					{
						sage = pstrs[k];
					}
					else if (k == 3)
					{
						sdate = pstrs[k];
					}
					else if (k == 4)
					{
						sproject1 = pstrs[k];
					}
					else if (k == 5)
					{
						sproject2 = pstrs[k];
					}
					else if (k == 6)
					{
						sproject3 = pstrs[k];
					}
					else if (k == 7)
					{
						sproject4 = pstrs[k];
					}
					else if (k == 8)
					{
						sproject5 = pstrs[k];
					}
					else if (k == 9)
					{
						sproject6 = pstrs[k];
					}
					else if (k == 10)
					{
						sproject7 = pstrs[k];
					}
					else if (k == 11)
					{
						sproject8 = pstrs[k];
					}
					else if (k == 12)
					{
						sother = pstrs[k];
					}
					else if (k == 13)
					{
						speople = pstrs[k];
					}
					else if (k == 14)
					{
						status = pstrs[k];
					}
					else if (k == 15)
					{
						sbelongpro = pstrs[k];
					}
				}
				sinfos.setSnumber(timestamp);
				sinfos.setSname(sname);
				sinfos.setSgender(sgender);
				sinfos.setSage(sage);
				sinfos.setSdate(sdate);
				sinfos.setSproject1(sproject1);
				sinfos.setSproject2(sproject2);
				sinfos.setSproject3(sproject3);
				sinfos.setSproject4(sproject4);
				sinfos.setSproject5(sproject5);
				sinfos.setSproject6(sproject6);
				sinfos.setSproject7(sproject7);
				sinfos.setSproject8(sproject8);
				sinfos.setSother(sother);
				sinfos.setSpeople(speople);
				sinfos.setStatus(status);
				sinfos.setSbelongpro(sbelongpro);
				serviceplanservice.saveServiceplan(sinfos);
			}
			out.print("success");
		}catch(Exception e)
		{
			e.printStackTrace();
			out.print("error");
		}
		return null;
	}
	
	public String sermodify() throws Exception{
		HttpServletRequest request = getRequest();
		String snumber = request.getParameter("snumber");
		List<Serviceplaninfo> ser = new ArrayList<Serviceplaninfo>();

		try {
			ser = serviceplanservice.lookServiceplan(snumber);// 获取活动信息
			if (ser!=null) {
				request.setAttribute("result", ser);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("seredit");
	}
	
	public String serview() throws Exception{
		HttpServletRequest request = getRequest();
		String snumber = request.getParameter("snumber");
		List<Serviceplaninfo> ser = new ArrayList<Serviceplaninfo>();

		try {
			ser = serviceplanservice.lookServiceplan(snumber);// 获取活动信息
			if (ser!=null) {
				request.setAttribute("result", ser);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("serview");
	}
	
	public String modifyser() throws Exception
	{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	
    	String flag = "";
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
    	String snumber = sdf.format(new Date());
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
					sname = pstrs[k];
				}
				else if (k == 2)
				{
					sgender = pstrs[k];
				}
				else if (k == 3)
				{
					sage = pstrs[k];
				}
				else if (k == 4)
				{
					sdate = pstrs[k];
				}
				else if (k == 5)
				{
					sproject1 = pstrs[k];
				}
				else if (k == 6)
				{
					sproject2 = pstrs[k];
				}
				else if (k == 7)
				{
					sproject3 = pstrs[k];
				}
				else if (k == 8)
				{
					sproject4 = pstrs[k];
				}
				else if (k == 9)
				{
					sproject5 = pstrs[k];
				}
				else if (k == 10)
				{
					sproject6 = pstrs[k];
				}
				else if (k == 11)
				{
					sproject7 = pstrs[k];
				}
				else if (k == 12)
				{
					sproject8 = pstrs[k];
				}
				else if (k == 13)
				{
					sother = pstrs[k];
				}
				else if (k == 14)
				{
					speople = pstrs[k];
				}
				else if (k == 15)
				{
					status = pstrs[k];
				}
				else if (k == 16)
				{
					sbelongpro = pstrs[k];
				}
			}
			
    	flag = serviceplanservice.modifyser(sid, snumber, sname, sgender, sage, sdate, sproject1, sproject2, sproject3, sproject4, sproject5, sproject6, sproject7, sproject8, sother, speople, status, sbelongpro);
		
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
	
	public String deleteser() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String snumber = request.getParameter("snumber");// 活动id
			out = response.getWriter();
			flag = serviceplanservice.deleServiceplaninfo(snumber);
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
	
	public String delchooseser() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String aidstr = request.getParameter("sid");// 活动id
			String strs[] = aidstr.split("\\|");
			for (int i=0; i<strs.length; i++)
			{
				out = response.getWriter();
				flag = serviceplanservice.deleSerchoose(strs[i]);
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
		String snumber = request.getParameter("snumber");
		List<Serviceplanhistory> serhis = new ArrayList<Serviceplanhistory>();

		try {
			System.out.println("snumber"+snumber);
			serhis = serviceplanservice.lookServiceplanhis(snumber);// 获取活动信息
			System.out.println("serhis"+serhis);
			if (serhis!=null) {
				request.setAttribute("result", serhis);
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

	public String getSnumber() {
		return snumber;
	}

	public void setSnumber(String snumber) {
		this.snumber = snumber;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSgender() {
		return sgender;
	}

	public void setSgender(String sgender) {
		this.sgender = sgender;
	}

	public String getSage() {
		return sage;
	}

	public void setSage(String sage) {
		this.sage = sage;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getSproject1() {
		return sproject1;
	}

	public void setSproject1(String sproject1) {
		this.sproject1 = sproject1;
	}

	public String getSproject2() {
		return sproject2;
	}

	public void setSproject2(String sproject2) {
		this.sproject2 = sproject2;
	}

	public String getSproject3() {
		return sproject3;
	}

	public void setSproject3(String sproject3) {
		this.sproject3 = sproject3;
	}

	public String getSproject4() {
		return sproject4;
	}

	public void setSproject4(String sproject4) {
		this.sproject4 = sproject4;
	}

	public String getSproject5() {
		return sproject5;
	}

	public void setSproject5(String sproject5) {
		this.sproject5 = sproject5;
	}

	public String getSproject6() {
		return sproject6;
	}

	public void setSproject6(String sproject6) {
		this.sproject6 = sproject6;
	}

	public String getSproject7() {
		return sproject7;
	}

	public void setSproject7(String sproject7) {
		this.sproject7 = sproject7;
	}

	public String getSproject8() {
		return sproject8;
	}

	public void setSproject8(String sproject8) {
		this.sproject8 = sproject8;
	}

	public String getSother() {
		return sother;
	}

	public void setSother(String sother) {
		this.sother = sother;
	}

	public String getSpeople() {
		return speople;
	}

	public void setSpeople(String speople) {
		this.speople = speople;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSbelongpro() {
		return sbelongpro;
	}

	public void setSbelongpro(String sbelongpro) {
		this.sbelongpro = sbelongpro;
	}

	public QueryResult<Serviceplaninfo> getResult() {
		return result;
	}

	public void setResult(QueryResult<Serviceplaninfo> result) {
		this.result = result;
	}
}
