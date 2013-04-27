package com.wootion.cmmb.view.action.careservices;

import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.common.util.ServletUtil;
import com.wootion.cmmb.persistenc.po.bean.evaluationforbusiness;
import com.wootion.cmmb.service.careservices.careService;
import com.wootion.idp.common.utils.DomainUtil;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.view.action.BaseAction;

public class evaluationWorkerAction extends BaseAction
{
    private String              nowpage       = null; // 页码

    private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;

    private String evaldate ;
    private String evalname;
    private String evaluationnumber;
    
    private QueryResult<evaluationforbusiness> result;
    public careService careservice;
    evaluationWorkerAction() {
		careservice = IMPServiceFactory.getCareService();
	} 
	
    @Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
        return "returnlist";
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
    
    public String list()
    {
    	HttpServletRequest request = getRequest();
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
        
        String evalenddate = (String)request.getParameter("evalenddate");
        try {
        	{
        		result = careservice.getQueryEvaluationResult(firstindex, maxresult,
        				evalname,evaluationnumber,evaldate,evalenddate);
        	}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "returnlist";
    }

    public String addnew(){
    	HttpServletRequest request = getRequest();
    	evaluationforbusiness efb = new evaluationforbusiness();
    	String roleid = careservice.isManager();
		if("2".equals(roleid)){
			//普通员工
			request.setAttribute("isadmin", "employee");
		}else{
			//管理员或经理
			request.setAttribute("isadmin", "leader");
		}
    	try{
    		request.setAttribute("evalEntity", efb);
    	}catch(Exception ee){
    		ee.printStackTrace();
    	}
    	return "evaluationnew";
    }
    
    public String premodifyEvalBusiness()throws Exception{
    	HttpServletRequest request = getRequest();
    	String evalid = request.getParameter("ahid");
    	evaluationforbusiness efb = careservice.lookEvalBusiness(evalid);
    	request.setAttribute("evalEntity", efb);
    	
    	String roleid = careservice.isManager();
		if("2".equals(roleid)){
			//普通员工
			request.setAttribute("isadmin", "employee");
		}else{
			//管理员或经理
			request.setAttribute("isadmin", "leader");
		}
    	return "evaluationnew";
    }
    
    public String viewevalbusiness()throws Exception{
    	HttpServletRequest request = getRequest();
    	String evalid = request.getParameter("ahid");
    	evaluationforbusiness efb = careservice.lookEvalBusiness(evalid);
    	request.setAttribute("evalEntity", efb);
    	request.setAttribute("view", "yes");
    	return "evaluationnew";
    }
    
    public String delthis()throws Exception{
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String ahid = request.getParameter("ahid");//考评表id
			out = response.getWriter();
			flag = careservice.deleEvalBusiness(ahid);
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
    
    public String modifyevalform()throws Exception{
    	HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();  
    	String flag = "";
    	
    	String evalid = request.getParameter("evalid");
    	evaluationforbusiness efb = careservice.lookEvalBusiness(evalid);
    	String evalname = request.getParameter("evalname");
    	String evaluationnumber = request.getParameter("evaluationnumber");
    	
    	efb.setEvaluationid(evalid);
    	efb.setEvalname(evalname);
    	efb.setEvaluationnumber(evaluationnumber);
    	efb.setEvaldate(efb.getEvaldate());
    	
    	for(int methodi=1;methodi<=66;methodi++){
    		String para = request.getParameter("a"+methodi);
    		int aval = 0;
    		if(para!=null&&!"".equals(para)){
    			aval = Integer.parseInt(para);
    		}
    		String methodname = "setA"+methodi;
    		//动态调用方法
    		efb.getClass().getMethod(methodname, new Class[]{int.class}).invoke(efb, new Object[]{aval});   
    	}
    	flag = careservice.modifyEvalForBusiness(efb);
    	
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
    
    public String addevalform() throws Exception{
    	HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();  
    	String flag = "";
    	evaluationforbusiness efb = new evaluationforbusiness();
    	String evalname = request.getParameter("evalname");
    	String evaluationnumber = request.getParameter("evaluationnumber");
    	//获取当前年月日
    	Calendar cal = Calendar.getInstance();
		int day = cal.get(Calendar.DATE);
		int month = cal.get(Calendar.MONTH) + 1;
		int year = cal.get(Calendar.YEAR);
		String strmonth = ""+month;
		String strday = ""+day;
		if(month<10){
			strmonth="0"+month;		
		}
		
		if(day<10){
			strday="0"+day;
		}
		String curdate = year+"-" + strmonth + "-" + strday;
		
    	efb.setEvalname(evalname);
    	efb.setEvaluationnumber(evaluationnumber);
    	efb.setEvaldate(evaldate);
    	efb.setEvaldate(curdate);
    	for(int methodi=1;methodi<=66;methodi++){
    		String para = request.getParameter("a"+methodi);
    		int aval = 0;
    		if(para!=null&&!"".equals(para)){
    			aval = Integer.parseInt(para);
    		}
    		String methodname = "setA"+methodi;
    		//动态调用方法
    		efb.getClass().getMethod(methodname, new Class[]{int.class}).invoke(efb, new Object[]{aval});   
    	}
    	flag = careservice.saveEvalForBusiness(efb);
    	
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
    
    public String getNowpage()
    {
        return nowpage;
    }

    public void setNowpage(String nowpage)
    {
        this.nowpage = nowpage;
    }

    public String getMaxpage()
    {
        return maxpage;
    }

    public void setMaxpage(String maxpage)
    {
        this.maxpage = maxpage;
    }

    public String getPerPageNumber()
    {
        return perPageNumber;
    }

    public void setPerPageNumber(String perPageNumber)
    {
        this.perPageNumber = perPageNumber;
    }

	public QueryResult<evaluationforbusiness> getResult() {
		return result;
	}

	public void setResult(QueryResult<evaluationforbusiness> result) {
		this.result = result;
	}

	public String getEvaldate() {
		return evaldate;
	}

	public void setEvaldate(String evaldate) {
		this.evaldate = evaldate;
	}

	public String getEvalname() {
		return evalname;
	}

	public void setEvalname(String evalname) {
		this.evalname = evalname;
	}

	public String getEvaluationnumber() {
		return evaluationnumber;
	}

	public void setEvaluationnumber(String evaluationnumber) {
		this.evaluationnumber = evaluationnumber;
	}
}