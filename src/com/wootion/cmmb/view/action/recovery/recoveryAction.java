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
import com.wootion.cmmb.persistenc.po.bean.CareAssess;
import com.wootion.cmmb.persistenc.po.bean.activityhistory;
import com.wootion.cmmb.persistenc.po.bean.recoveryAssess;
import com.wootion.cmmb.service.activity.ActivityService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class recoveryAction extends BaseAction
{
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
	private String aid;
	private String atime;
	private String acName;
	private String acNumber;
	private String acStime;
	private String acPlace;
	private String acInfo;
	private String abelongpro;
	private String anumber;
	
	private String assessdate ; 
	private String memname;
	private String belongproname;
	private String a1;
	
	private QueryResult<Activityinfo> result;
	private QueryResult<recoveryAssess> resultR;
	public ActivityService activityservice;
	recoveryAction() {
		activityservice = IMPServiceFactory.getActivityService();
	}
	public String add() 
	{
		return "addlist";
	}

	public String addrecovery()throws Exception{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();  
    	String flag = "";
    	recoveryAssess recoveryassess = new recoveryAssess();
    	String memage = request.getParameter("memage");
    	String memname = request.getParameter("memname");
    	String memgender = request.getParameter("memgender");
    	String assesman = request.getParameter("assesman");
    	String assesdate = request.getParameter("assesdate");
    	String recoverynumber = request.getParameter("recoverynumber");
    	String belongproid = request.getParameter("belongproid");
    	String belongproname = request.getParameter("belongproname");
    	
    	recoveryassess.setMemname(memname);
    	recoveryassess.setMemage(memage);
    	recoveryassess.setMemgender(memgender);
    	recoveryassess.setAssesdate(assesdate);
    	recoveryassess.setAssesman(assesman);
    	recoveryassess.setRecoverynumber(recoverynumber);
    	recoveryassess.setBelongproid(belongproid);
    	recoveryassess.setBelongproname(belongproname);
    	
    	for(int methodi=1;methodi<=100;methodi++){
    		String para = request.getParameter("a"+methodi);
    		String methodname = "setA"+methodi;
    		//动态调用方法
    		recoveryassess.getClass().getMethod(methodname, new Class[]{String.class}).invoke(recoveryassess, new Object[]{para});   
    	}
    	flag = activityservice.saveRecoveryAssessment(recoveryassess);
    	
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
	
	public String saveActivity() throws Exception
	{
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = response.getWriter();
		try
		{
			Activityinfo ainfos = new Activityinfo();
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
						acName = pstrs[k];
					}
					else if (k == 1)
					{
						acNumber = pstrs[k];
					}
					else if (k == 2)
					{
						acStime = pstrs[k];
					}
					else if (k == 3)
					{
						acPlace = pstrs[k];
					}
					else if (k == 4)
					{
						acInfo = pstrs[k];
					}
					else if (k == 5)
					{
						abelongpro = pstrs[k];
					}
				}
				ainfos.setAtime(timestamp);
				ainfos.setAname(acName);
				ainfos.setApeoplenum(acNumber);
				ainfos.setStime(acStime);
				ainfos.setAplace(acPlace);
				ainfos.setAinfo(acInfo);
				ainfos.setAbelongpro(abelongpro);
				ainfos.setAnumber(timestamp);
				activityservice.saveActivity(ainfos);
			}
			out.print("success");
		}catch(Exception e)
		{
			e.printStackTrace();
			out.print("error");
		}
		return null;
	}

	public String deleteact() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String anumber = request.getParameter("anumber");// 活动id
			out = response.getWriter();
			flag = activityservice.deleActivityinfo(anumber);
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
	
	public String delchooseact() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String aidstr = request.getParameter("aid");// 活动id
			String strs[] = aidstr.split("\\|");
			for (int i=0; i<strs.length; i++)
			{
				out = response.getWriter();
				flag = activityservice.deleactchoose(strs[i]);
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
	
	public String actmodify() throws Exception{
		HttpServletRequest request = getRequest();
		String anumber = request.getParameter("anumber");
		List<Activityinfo> act = new ArrayList<Activityinfo>();

		try {
			act = activityservice.lookActivity(anumber);// 获取活动信息
			if (act!=null) {
				request.setAttribute("result", act);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("actedit");
	}
	
	public String modifyact() throws Exception
	{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	String flag = "";
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String atime = sdf.format(new Date());
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
					aid = pstrs[k];
				}
				else if (k == 1)
				{
					anumber = pstrs[k];
				}
				else if (k == 2)
				{
					acName = pstrs[k];
				}
				else if (k == 3)
				{
					acNumber = pstrs[k];
				}
				else if (k == 4)
				{
					acStime = pstrs[k];
				}
				else if (k == 5)
				{
					acPlace = pstrs[k];
				}
				else if (k == 6)
				{
					acInfo = pstrs[k];
				}
				else if (k == 7)
				{
					abelongpro = pstrs[k];
				}
			}
//    	String aid = request.getParameter("aid").trim();
//    	String aname = request.getParameter("aname").trim();
//    	String apeoplenum = request.getParameter("apeoplenum").trim();
//    	String stime = request.getParameter("stime").trim();
//    	String aplace = request.getParameter("aplace").trim();
//    	String ainfo = request.getParameter("ainfo").trim();
    	flag = activityservice.modifyact(aid, anumber, atime, acName, acNumber, acStime, acPlace, acInfo,abelongpro);
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
			result = activityservice.getQueryActResult(firstindex, maxresult, 
					atime, acName, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "recoverymange";
	}
	
	public String viewact() throws Exception{
		HttpServletRequest request = getRequest();
		String anumber = request.getParameter("anumber");
		List<Activityinfo> act = new ArrayList<Activityinfo>();

		try {
			act = activityservice.lookActivity(anumber);// 获取活动信息
			if (act!=null) {
				request.setAttribute("result", act);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("viewact");
	}
	
	public String viewacthistory() throws Exception{
		HttpServletRequest request = getRequest();
		String anumber = request.getParameter("anumber");
		List<activityhistory> act = new ArrayList<activityhistory>();

		try {
			act = activityservice.lookActivityhis(anumber);// 获取活动信息
			if (act!=null) {
				request.setAttribute("result", act);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("viewacthis");
	}
	
	public String getrecoverypage(){
		return "recoveryevaladd";
	}
	public String elvalist() throws Exception{
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
        	resultR = activityservice.getQueryRecoveryResult(firstindex, maxresult, 
					assessdate, memname, a1, getRequest().getSession().getId());  
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return ("evallist");
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

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getAtime() {
		return atime;
	}

	public void setAtime(String atime) {
		this.atime = atime;
	}

	public String getAcName() {
		return acName;
	}

	public void setAcName(String acName) {
		this.acName = acName;
	}

	public String getAcNumber() {
		return acNumber;
	}

	public void setAcNumber(String acNumber) {
		this.acNumber = acNumber;
	}

	public String getAcStime() {
		return acStime;
	}

	public void setAcStime(String acStime) {
		this.acStime = acStime;
	}

	public String getAcPlace() {
		return acPlace;
	}

	public void setAcPlace(String acPlace) {
		this.acPlace = acPlace;
	}

	public String getAcInfo() {
		return acInfo;
	}

	public void setAcInfo(String acInfo) {
		this.acInfo = acInfo;
	}

	public QueryResult<Activityinfo> getResult() {
		return result;
	}

	public void setResult(QueryResult<Activityinfo> result) {
		this.result = result;
	}
	public String getAbelongpro() {
		return abelongpro;
	}
	public void setAbelongpro(String abelongpro) {
		this.abelongpro = abelongpro;
	}
	public String getAnumber() {
		return anumber;
	}
	public void setAnumber(String anumber) {
		this.anumber = anumber;
	}
	public String getAssessdate() {
		return assessdate;
	}
	public void setAssessdate(String assessdate) {
		this.assessdate = assessdate;
	}
	public String getMemname() {
		return memname;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public String getBelongproname() {
		return belongproname;
	}
	public void setBelongproname(String belongproname) {
		this.belongproname = belongproname;
	}
	public QueryResult<recoveryAssess> getResultR() {
		return resultR;
	}
	public void setResultR(QueryResult<recoveryAssess> resultR) {
		this.resultR = resultR;
	}
	public String getA1() {
		return a1;
	}
	public void setA1(String a1) {
		this.a1 = a1;
	}
	
}
