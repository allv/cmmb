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
import com.wootion.cmmb.persistenc.po.bean.Activityinfo;
import com.wootion.cmmb.persistenc.po.bean.Bloodpressurehistory;
import com.wootion.cmmb.persistenc.po.bean.Bloodpressureinfo;
import com.wootion.cmmb.service.activity.ActivityService;
import com.wootion.cmmb.service.activity.BloodpressureService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class BloodpressureAction extends BaseAction{
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
    private String bid;
	private String bdate;
	private String bnumber;
	private String bname;
	private String bgender;
	private String bage;
	private String bphone;
	private String bstarttime;
	private String bdiseases;
	private String bfilenumber;
	private String bbelongpro;
	private String binfo;
	private String bwritedate;
	private String bloodnum;
	private String bpulse;
	private QueryResult<Bloodpressureinfo> result;
	public BloodpressureService bloodpressureservice;
	BloodpressureAction() {
		bloodpressureservice = IMPServiceFactory.getBloodpressureService();
	}
	public String add() 
	{
		return "addlist";
	}
	
	public String saveBloodpressure() throws Exception
	{
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = response.getWriter();
		try
		{
			Bloodpressureinfo bpinfos = new Bloodpressureinfo();
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
						bname = pstrs[k];
					}
					else if (k == 1)
					{
						bgender = pstrs[k];
					}
					else if (k == 2)
					{
						bage = pstrs[k];
					}
					else if (k == 3)
					{
						bphone = pstrs[k];
					}
					else if (k == 4)
					{
						bstarttime = pstrs[k];
					}
					else if (k == 5)
					{
						bdiseases = pstrs[k];
					}
					else if (k == 6)
					{
						bfilenumber = pstrs[k];
					}
					else if (k == 7)
					{
						binfo = pstrs[k];
					}
					else if (k == 8)
					{
						bwritedate = pstrs[k];
					}
					else if (k == 9)
					{
						bloodnum = pstrs[k];
					}
					else if (k == 10)
					{
						bpulse = pstrs[k];
					}
					else if (k == 11)
					{
						bbelongpro = pstrs[k];
					}
				}
				bpinfos.setBnumber(timestamp);
				bpinfos.setBdate(timestamp);
				bpinfos.setBname(bname);
				bpinfos.setBgender(bgender);
				bpinfos.setBage(bage);
				bpinfos.setBphone(bphone);
				bpinfos.setBstarttime(bstarttime);
				bpinfos.setBdiseases(bdiseases);
				bpinfos.setBfilenumber(bfilenumber);
				bpinfos.setBinfo(binfo);
				bpinfos.setBwritedate(bwritedate);
				bpinfos.setBloodnum(bloodnum);
				bpinfos.setBpulse(bpulse);
				bpinfos.setBbelongpro(bbelongpro);
				bloodpressureservice.saveBloodpressure(bpinfos);
				
			}
			out.print("success");
		}catch(Exception e)
		{
			e.printStackTrace();
			out.print("error");
		}
		return null;
	}
	
	public String deleteblo() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String bdate = request.getParameter("bdate");// 活动id
			out = response.getWriter();
			flag = bloodpressureservice.deleBloodpressureinfo(bdate);
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
	
	public String delchooseblo() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String aidstr = request.getParameter("bid");// 活动id
			String strs[] = aidstr.split("\\|");
			for (int i=0; i<strs.length; i++)
			{
				out = response.getWriter();
				flag = bloodpressureservice.deleblochoose(strs[i]);
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
	
	public String blomodify() throws Exception{
		HttpServletRequest request = getRequest();
		String bdate = request.getParameter("bdate");
		List<Bloodpressureinfo> blo = new ArrayList<Bloodpressureinfo>();
		try {
			blo = bloodpressureservice.lookBloodpressure(bdate);// 获取活动信息
			if (blo!=null) {
				request.setAttribute("result", blo);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return "bloedit";
	}
	
	public String viewblo() throws Exception{
		HttpServletRequest request = getRequest();
		String bdate = request.getParameter("bdate");
		List<Bloodpressureinfo> blo = new ArrayList<Bloodpressureinfo>();
		try {
			blo = bloodpressureservice.lookBloodpressure(bdate);// 获取活动信息
			if (blo!=null) {
				request.setAttribute("result", blo);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return "bloview";
	}
	
	public String modifyblo() throws Exception
	{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	String flag = "";
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String bnumber = sdf.format(new Date());
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
					bid = pstrs[k];
				}
				else if (k == 1)
				{
					bdate = pstrs[k];
				}
				else if (k == 2)
				{
					bname = pstrs[k];
				}
				else if (k == 3)
				{
					bgender = pstrs[k];
				}
				else if (k == 4)
				{
					bage = pstrs[k];
				}
				else if (k == 5)
				{
					bphone = pstrs[k];
				}
				else if (k == 6)
				{
					bstarttime = pstrs[k];
				}
				else if (k == 7)
				{
					bdiseases = pstrs[k];
				}
				else if (k == 8)
				{
					bfilenumber = pstrs[k];
				}
				else if (k == 9)
				{
					binfo = pstrs[k];
				}
				else if (k == 10)
				{
					bwritedate = pstrs[k];
				}
				else if (k == 11)
				{
					bloodnum = pstrs[k];
				}
				else if (k == 12)
				{
					bpulse = pstrs[k];
				}
				else if (k == 13)
				{
					bbelongpro = pstrs[k];
				}
			}
			
    	flag = bloodpressureservice.modifyblo(bid, bdate, bnumber, bname, bgender, bage, bphone, bstarttime, bdiseases, bfilenumber, binfo, bwritedate, bloodnum, bpulse, bbelongpro);
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
			result = bloodpressureservice.getQueryBloResult(firstindex, maxresult, 
					bstarttime, bname, bfilenumber, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "bloodpressuremange";
	}
	
	public String viewacthistory() throws Exception{
		HttpServletRequest request = getRequest();
		String bdate = request.getParameter("bdate");
		List<Bloodpressurehistory> blohis = new ArrayList<Bloodpressurehistory>();
		try {
			blohis = bloodpressureservice.lookBloodpressurehis(bdate);// 获取活动信息
			if (blohis!=null) {
				request.setAttribute("result", blohis);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return "viewacthis";
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
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public String getBnumber() {
		return bnumber;
	}
	public void setBnumber(String bnumber) {
		this.bnumber = bnumber;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBgender() {
		return bgender;
	}
	public void setBgender(String bgender) {
		this.bgender = bgender;
	}
	public String getBage() {
		return bage;
	}
	public void setBage(String bage) {
		this.bage = bage;
	}
	public String getBphone() {
		return bphone;
	}
	public void setBphone(String bphone) {
		this.bphone = bphone;
	}
	public String getBstarttime() {
		return bstarttime;
	}
	public void setBstarttime(String bstarttime) {
		this.bstarttime = bstarttime;
	}
	public String getBdiseases() {
		return bdiseases;
	}
	public void setBdiseases(String bdiseases) {
		this.bdiseases = bdiseases;
	}
	public String getBfilenumber() {
		return bfilenumber;
	}
	public void setBfilenumber(String bfilenumber) {
		this.bfilenumber = bfilenumber;
	}
	public String getBbelongpro() {
		return bbelongpro;
	}
	public void setBbelongpro(String bbelongpro) {
		this.bbelongpro = bbelongpro;
	}
	public String getBinfo() {
		return binfo;
	}
	public void setBinfo(String binfo) {
		this.binfo = binfo;
	}
	public String getBwritedate() {
		return bwritedate;
	}
	public void setBwritedate(String bwritedate) {
		this.bwritedate = bwritedate;
	}
	public String getBloodnum() {
		return bloodnum;
	}
	public void setBloodnum(String bloodnum) {
		this.bloodnum = bloodnum;
	}
	public String getBpulse() {
		return bpulse;
	}
	public void setBpulse(String bpulse) {
		this.bpulse = bpulse;
	}
	public QueryResult<Bloodpressureinfo> getResult() {
		return result;
	}
	public void setResult(QueryResult<Bloodpressureinfo> result) {
		this.result = result;
	}
	
}
