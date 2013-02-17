package com.wootion.cmmb.view.action.recovery;

import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.CareAssess;
import com.wootion.cmmb.persistenc.po.bean.recoveryAssess;
import com.wootion.cmmb.service.activity.ActivityService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class recoveryevalAction extends BaseAction
{
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
	private String assessdate ; 
	private String memname;
	private String belongproname;
	private String a1;
	
	private QueryResult<recoveryAssess> result;
	public ActivityService activityservice;
	recoveryevalAction() {
		activityservice = IMPServiceFactory.getActivityService();
	}

	public String recoverymodify()throws Exception{
    	HttpServletRequest request = getRequest();
		String rid = request.getParameter("recoveryid");
		recoveryAssess ca = new recoveryAssess();
		
		try {
			ca = activityservice.lookRecovery(rid);// 获取康复评估信息
	    if (ca!=null) {
	        request.setAttribute("recovery", ca);
	    } else {
	        return ("error");
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    return ("error");
	}
		return ("recoveryedit");
    }
	
	public String modifyRecovery()throws Exception{
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
    	String recoveryid = request.getParameter("recoveryid");
    	
    	recoveryassess.setMemname(memname);
    	recoveryassess.setMemage(memage);
    	recoveryassess.setMemgender(memgender);
    	recoveryassess.setAssesdate(assesdate);
    	recoveryassess.setAssesman(assesman);
    	recoveryassess.setRecoverynumber(recoverynumber);
    	recoveryassess.setBelongproid(belongproid);
    	recoveryassess.setBelongproname(belongproname);
    	recoveryassess.setRecoveryid(recoveryid);
    	
    	for(int methodi=1;methodi<=30403
    	;methodi++){
    		String para = request.getParameter("a"+methodi);
    		String methodname = "setA"+methodi;
    		//动态调用方法
    		recoveryassess.getClass().getMethod(methodname, new Class[]{String.class}).invoke(recoveryassess, new Object[]{para});   
    	}
    	flag = activityservice.modifyRecoveryAssessment(recoveryassess);
    	
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
	
	public String deleterecovery()throws Exception{
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		String flag = "";
		try {
			String pID = request.getParameter("recoveryid");// 康复评估ID
			out = response.getWriter();
			flag = activityservice.deleRecovery(pID);
			out.print("success");
		} catch (Exception e) {
			e.printStackTrace();
			out.print("error");
		} finally {
			out.flush();
			out.close();
		}
		return null;
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
    	
    	for(int methodi=1;methodi<=304;methodi++){
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
        return "recoverymange";
	}
	public String getrecoverypage(){
		HttpServletRequest request = getRequest();
	    //set object recovery
		recoveryAssess ca = new recoveryAssess();
		request.setAttribute("recovery", ca);
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
        	result = activityservice.getQueryRecoveryResult(firstindex, maxresult, 
					assessdate, memname, a1, getRequest().getSession().getId());  
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return ("evallist");
	}
	
	public String viewrecovery()throws Exception{
    	HttpServletRequest request = getRequest();
		String rid = request.getParameter("recoveryid");
		recoveryAssess ca = new recoveryAssess();
		
		try {
			ca = activityservice.lookRecovery(rid);// 获取康复评估信息
	    if (ca!=null) {
	        request.setAttribute("recovery", ca);
	        request.setAttribute("view", "yes");
	    } else {
	        return ("error");
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    return ("error");
	}
		return ("recoverydetail");
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

	

	public QueryResult<recoveryAssess> getResult() {
		return result;
	}

	public void setResult(QueryResult<recoveryAssess> result) {
		this.result = result;
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

	public String getA1() {
		return a1;
	}

	public void setA1(String a1) {
		this.a1 = a1;
	}
}
