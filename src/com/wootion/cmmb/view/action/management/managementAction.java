package com.wootion.cmmb.view.action.management;

import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.Managementhistory;
import com.wootion.cmmb.persistenc.po.bean.Managementinfo;
import com.wootion.cmmb.service.management.ManagementService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class managementAction extends BaseAction
{
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
    private String mid;
	private String mmodifytime;
	private String mstarttime;
	private String mendtime;
	private String mnumber;
	private String mplace;
	private String morganizer;
	private String mserialnum;
	private String minfo;
	private String mbelongpro;
	private String mimageurl;
	//活动名称
	private String mimagename;
	//活动志愿者
	private String mimagevolunteer;
	//活动满意度
	private String mimagereflect;
	
	//活动满意度
	private String mimagereflect2;
	
	//活动满意度
	private String mimagereflect3;
	
	//活动满意度
	private String mimagereflect4;
	
	private String a1;
	
	//活动费用
	private String mimagefee;
	
	private QueryResult<Managementinfo> result;
	public ManagementService managementservice;
	managementAction() {
		managementservice = IMPServiceFactory.getManagementService();
	}
	public String add() 
	{
		return "addlist";
	}

	public String saveActivity() throws Exception
	{
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = response.getWriter();
		try
		{
			Managementinfo minfos = new Managementinfo();
			String dtal = request.getParameter("detail");
			String mimagereflect2 = request.getParameter("mimagereflect2");
			String mimagereflect3 = request.getParameter("mimagereflect3");
			String mimagereflect4 = request.getParameter("mimagereflect4");
			
			String pstrs[] = dtal.split("\\|");
			for (int k=0; k<pstrs.length; k++)
			{
				if (k == 0)
				{
					mstarttime = pstrs[k];
				}
				else if (k == 1)
				{
					mimagename = pstrs[k];
				}
				else if (k == 2)
				{
					mimagefee = pstrs[k];
				}
				else if (k == 3)
				{
					mimagereflect = pstrs[k];
				}
				else if (k == 4)
				{
					mimagevolunteer = pstrs[k];
				}
				else if (k == 5)
				{
					mnumber = pstrs[k];
				}
				else if (k == 6)
				{
					mplace = pstrs[k];
				}
				else if (k == 7)
				{
					morganizer = pstrs[k];
				}
				else if (k == 8)
				{
					mserialnum = pstrs[k];
				}
				else if (k == 9)
				{
					mbelongpro = pstrs[k];
				}
				else if (k == 10)
				{
					minfo = pstrs[k];
				}
				else if (k == 11)
				{
					mimageurl = pstrs[k];
				}
			}
			
			minfos.setMstarttime(mstarttime);
			minfos.setMendtime(mendtime);
			minfos.setMnumber(Integer.parseInt(mnumber));
			minfos.setMplace(mplace);
			minfos.setMorganizer(morganizer);
			minfos.setMserialnum(mserialnum);
			minfos.setMbelongpro(mbelongpro);
			minfos.setMinfo(minfo);
			minfos.setMimageurl(mimageurl);
			minfos.setMimagename(mimagename);
			minfos.setMimagefee(Integer.parseInt(mimagefee));
			minfos.setMimagereflect(mimagereflect);
			minfos.setMimagevolunteer(mimagevolunteer);
			minfos.setMimagereflect2(mimagereflect2);
			minfos.setMimagereflect3(mimagereflect3);
			minfos.setMimagereflect4(mimagereflect4);
			managementservice.saveManagement(minfos);
			out.print("success");
		}catch(Exception e)
		{
			e.printStackTrace();
			out.print("error");
		}
		
		return null;
	}
	
	public String delchooseman() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String mid = request.getParameter("mid");// 活动id
			out = response.getWriter();
			flag = managementservice.delemanchoose(mid);
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
	
	public String manmodify() throws Exception{
		HttpServletRequest request = getRequest();
		String mid = request.getParameter("mid");
		Managementinfo man = new Managementinfo();

		try {
			man = managementservice.lookManagement(mid);
			if (man!=null) {
				request.setAttribute("result", man);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("manedit");
	}
	
	public String viewman() throws Exception{
		HttpServletRequest request = getRequest();
		String mid = request.getParameter("mid");
		Managementinfo man = new Managementinfo();

		try {
			man = managementservice.lookManagement(mid);// 获取活动信息
			if (man!=null) {
				request.setAttribute("result", man);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("viewman");
	}
	
	public String modifyman() throws Exception
	{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	String flag = "";
    	String dtal = request.getParameter("detail");
		String pstrs[] = dtal.split("\\|");
		for (int k=0; k<pstrs.length; k++)
		{
			if (k == 0)
			{
				mid = pstrs[k];
			}
				if (k == 1)
				{
					mstarttime = pstrs[k];
				}
				else if (k == 2)
				{
					mimagename = pstrs[k];
				}
				else if (k == 3)
				{
					mimagefee = pstrs[k];
				}
				else if (k == 4)
				{
					mimagereflect = pstrs[k];
				}
				else if (k == 5)
				{
					mimagevolunteer = pstrs[k];
				}
				else if (k == 6)
				{
					mnumber = pstrs[k];
				}
				else if (k == 7)
				{
					mplace = pstrs[k];
				}
				else if (k == 8)
				{
					morganizer = pstrs[k];
				}
				else if (k == 9)
				{
					mserialnum = pstrs[k];
				}
				else if (k == 10)
				{
					mbelongpro = pstrs[k];
				}
				else if (k == 11)
				{
					minfo = pstrs[k];
				}
				else if (k == 12)
				{
					mimageurl = pstrs[k];
				}
		}
		Managementinfo minfos = new Managementinfo();
		minfos.setMid(mid);
		minfos.setMstarttime(mstarttime);
		minfos.setMendtime(mendtime);
		minfos.setMnumber(Integer.parseInt(mnumber));
		minfos.setMplace(mplace);
		minfos.setMorganizer(morganizer);
		minfos.setMserialnum(mserialnum);
		minfos.setMbelongpro(mbelongpro);
		minfos.setMinfo(minfo);
		minfos.setMimageurl(mimageurl);
		minfos.setMimagename(mimagename);
		minfos.setMimagefee(Integer.parseInt(mimagefee));
		minfos.setMimagereflect(mimagereflect);
		minfos.setMimagereflect2(mimagereflect2);
		minfos.setMimagereflect3(mimagereflect3);
		minfos.setMimagereflect4(mimagereflect4);
		minfos.setMimagevolunteer(mimagevolunteer);
		
    	flag = managementservice.modifyman(minfos);
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
		String mid = request.getParameter("mid");
		Managementhistory manhis = new Managementhistory();

		try {
			manhis = managementservice.lookManagementhis(mid);
			if (manhis!=null) {
				request.setAttribute("result", manhis);
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
			result = managementservice.getQueryManResult(firstindex, maxresult, 
					mstarttime, mserialnum, mimagefee,mnumber,a1, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "managementmange";
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
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMmodifytime() {
		return mmodifytime;
	}
	public void setMmodifytime(String mmodifytime) {
		this.mmodifytime = mmodifytime;
	}
	public String getMstarttime() {
		return mstarttime;
	}
	public void setMstarttime(String mstarttime) {
		this.mstarttime = mstarttime;
	}
	public String getMendtime() {
		return mendtime;
	}
	public void setMendtime(String mendtime) {
		this.mendtime = mendtime;
	}
	public String getMnumber() {
		return mnumber;
	}
	public void setMnumber(String mnumber) {
		this.mnumber = mnumber;
	}
	public String getMplace() {
		return mplace;
	}
	public void setMplace(String mplace) {
		this.mplace = mplace;
	}
	public String getMorganizer() {
		return morganizer;
	}
	public void setMorganizer(String morganizer) {
		this.morganizer = morganizer;
	}
	public String getMserialnum() {
		return mserialnum;
	}
	public void setMserialnum(String mserialnum) {
		this.mserialnum = mserialnum;
	}
	public String getMinfo() {
		return minfo;
	}
	public void setMinfo(String minfo) {
		this.minfo = minfo;
	}
	public String getMbelongpro() {
		return mbelongpro;
	}
	public void setMbelongpro(String mbelongpro) {
		this.mbelongpro = mbelongpro;
	}
	public QueryResult<Managementinfo> getResult() {
		return result;
	}
	public void setResult(QueryResult<Managementinfo> result) {
		this.result = result;
	}
	public String getMimageurl() {
		return mimageurl;
	}
	public void setMimageurl(String mimageurl) {
		this.mimageurl = mimageurl;
	}
	public String getMimagename() {
		return mimagename;
	}
	public void setMimagename(String mimagename) {
		this.mimagename = mimagename;
	}
	public String getMimagevolunteer() {
		return mimagevolunteer;
	}
	public void setMimagevolunteer(String mimagevolunteer) {
		this.mimagevolunteer = mimagevolunteer;
	}
	public String getMimagereflect() {
		return mimagereflect;
	}
	public void setMimagereflect(String mimagereflect) {
		this.mimagereflect = mimagereflect;
	}
	public String getMimagefee() {
		return mimagefee;
	}
	public void setMimagefee(String mimagefee) {
		this.mimagefee = mimagefee;
	}
	public ManagementService getManagementservice() {
		return managementservice;
	}
	public void setManagementservice(ManagementService managementservice) {
		this.managementservice = managementservice;
	}
	public String getMimagereflect2() {
		return mimagereflect2;
	}
	public void setMimagereflect2(String mimagereflect2) {
		this.mimagereflect2 = mimagereflect2;
	}
	public String getMimagereflect3() {
		return mimagereflect3;
	}
	public void setMimagereflect3(String mimagereflect3) {
		this.mimagereflect3 = mimagereflect3;
	}
	public String getMimagereflect4() {
		return mimagereflect4;
	}
	public void setMimagereflect4(String mimagereflect4) {
		this.mimagereflect4 = mimagereflect4;
	}
	public String getA1() {
		return a1;
	}
	public void setA1(String a1) {
		this.a1 = a1;
	}
}
