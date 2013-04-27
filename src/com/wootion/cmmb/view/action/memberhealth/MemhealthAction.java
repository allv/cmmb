package com.wootion.cmmb.view.action.memberhealth;

import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cimp.services.memberHealthService;
import com.wootion.cimp.util.PageBasicInfo;
import com.wootion.cimp.vo.data.healtheval;
import com.wootion.cimp.vo.data.healthpsyeval;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class MemhealthAction extends BaseAction
{
	private PageBasicInfo pageObj = null;
	public memberHealthService memhealthservice;
	
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

	private String              perPageNumber = null;
	
	private String              assesdate = null;
	
	private String              belongproname = null;
	
	private String              applyreason = null;
	
	private String              memname = null;
	
	private String              healthnumber = null;
	
	private QueryResult<healtheval> result;
	MemhealthAction() {
		memhealthservice = IMPServiceFactory.getMemberHealthService();
	} 
	
	
	
	public String premodify()throws Exception{
		HttpServletRequest request = getRequest();
		String healthid = request.getParameter("healthid");
		healtheval health = new healtheval();
		
		try {
			health = memhealthservice.lookHealthEval(healthid);// 获取健康评估表信息
	    if (health!=null) {
	        request.setAttribute("health", health);
	    } else {
	        return ("error");
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    return ("error");
	}
		return ("memhealthedit");
	}
	
	public String modifyhealth()throws Exception{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();  
    	String flag = "";
    	String healthid = request.getParameter("healthid");
    	healtheval health = memhealthservice.lookHealthEval(healthid);
    	String memname = request.getParameter("memname");
    	String memnumber = request.getParameter("memnumber");
    	String assesdate = request.getParameter("assesdate");
    	String healthnumber = request.getParameter("healthnumber");
    	String belongproname = request.getParameter("belongproname");
    	String applyreason = request.getParameter("applyreason");
    	
    	
    	health.setMemname(memname);
    	health.setMemnumber(memnumber);
    	health.setAssesdate(assesdate);
    	health.setHealthnumber(healthnumber);
    	health.setApplyreason(applyreason);
    	health.setBelongproname(belongproname);
    	health.setHealthid(healthid);
    	for(int methodi=1;methodi<=369;methodi++){
    		String para = request.getParameter("a"+methodi);
    		String methodname = "setA"+methodi;
    		if(methodi==45){
    			//整型
    			health.setA45(Integer.parseInt(para));
    		}else{
	    		//动态调用方法
	    		health.getClass().getMethod(methodname, new Class[]{String.class}).invoke(health, new Object[]{para});
    		}
    	}
    	flag = memhealthservice.modifyHealthEval(health);
    	
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
	
	public void deletehealth(){
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String healthid = request.getParameter("healthid");
			out = response.getWriter();
			flag = memhealthservice.deleHealth(healthid);
			if (flag) {
				out.print("success");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("error");
		} finally {
			out.flush();
			out.close();
		}
	}
	
	public String viewhealth(){
		HttpServletRequest request = getRequest();
		String healthid = request.getParameter("healthid");
		healtheval health = new healtheval();
		
		try {
			health = memhealthservice.lookHealthEval(healthid);// 获取评估表信息
	    if (health!=null) {
	        request.setAttribute("health", health);
	    } else {
	        return ("error");
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    return ("error");
	}
		return ("memhealthview");
	}
	
	
	public String listH(){
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
        
        memhealthservice = IMPServiceFactory.getMemberHealthService();
        try {
			result = memhealthservice.getQueryHealthResult(firstindex, maxresult,
					assesdate, memname, applyreason,healthnumber,
					 getRequest().getSession().getId());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return ("memhealthlist");
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
        return ("memhealthlist");
	}
	
	public String getaddpage(){
		return ("memhealthadd");
	}

	public String addhealth()throws Exception{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();  
    	String flag = "";
    	healtheval health = new healtheval();
    	String memname = request.getParameter("memname");
    	String memnumber = request.getParameter("memnumber");
    	String assesdate = request.getParameter("assesdate");
    	String healthnumber = request.getParameter("healthnumber");
    	String belongproname = request.getParameter("belongproname");
    	String applyreason = request.getParameter("applyreason");
    	health.setMemname(memname);
    	health.setMemnumber(memnumber);
    	health.setAssesdate(assesdate);
    	health.setHealthnumber(healthnumber);
    	health.setApplyreason(applyreason);
    	health.setBelongproname(belongproname);
    	
    	for(int methodi=1;methodi<=369;methodi++){
    		String para = request.getParameter("a"+methodi);
    		String methodname = "setA"+methodi;
    		//动态调用方法
    		if(methodi==45){
    			//整型
    			health.setA45(Integer.parseInt(para));
    		}else{
	    		//动态调用方法
	    		health.getClass().getMethod(methodname, new Class[]{String.class}).invoke(health, new Object[]{para});
    		}
    	}
    	flag = memhealthservice.saveHealthEval(health);
    	
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
    
    /**
	 * 实现分页显示
	 * 
	 * @param request
	 * @param pageObj
	 * @return
	 */

	public void page(HttpServletRequest request, PageBasicInfo pageObj) {
		// 获得要查询的页数
		String pageStr = request.getParameter("currentPage") == null ? ""
				: request.getParameter("currentPage");

		// 获得每页最多显示多少条记录
		if (request.getParameter("maxRecords") != null) {
			int maxRecords = Integer.parseInt((String) request
					.getParameter("maxRecords"));
			pageObj.setMaxRecords(maxRecords);
		}

		if (!pageStr.equals(""))// 空说明，为默认的第一页
		{
			int currentPage = Integer.parseInt(pageStr);
			pageObj.setCurrentPage(currentPage);
		}
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

	public PageBasicInfo getPageObj() {
		return pageObj;
	}

	public void setPageObj(PageBasicInfo pageObj) {
		this.pageObj = pageObj;
	}

	public memberHealthService getMemhealthservice() {
		return memhealthservice;
	}

	public void setMemhealthservice(memberHealthService memhealthservice) {
		this.memhealthservice = memhealthservice;
	}

	public String getAssesdate() {
		return assesdate;
	}

	public void setAssesdate(String assesdate) {
		this.assesdate = assesdate;
	}

	public String getBelongproname() {
		return belongproname;
	}

	public void setBelongproname(String belongproname) {
		this.belongproname = belongproname;
	}

	public String getMemname() {
		return memname;
	}

	public void setMemname(String memname) {
		this.memname = memname;
	}

	public String getHealthnumber() {
		return healthnumber;
	}

	public void setHealthnumber(String healthnumber) {
		this.healthnumber = healthnumber;
	}

	public QueryResult<healtheval> getResult() {
		return result;
	}

	public void setResult(QueryResult<healtheval> result) {
		this.result = result;
	}
	
	//提交心理评估表
	public String addpsy()throws Exception{
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();  
		String healthinfoid = request.getParameter("healthid");
		String flag = "";
		healthpsyeval health = new healthpsyeval();
    	String memname = request.getParameter("memname");
    	String memnumber = request.getParameter("memnumber");
    	String assesdate = request.getParameter("assesdate");
    	String healthnumber = request.getParameter("healthnumber");
    	String belongproname = request.getParameter("belongproname");
    	String applyreason = request.getParameter("applyreason");
    	health.setMemname(memname);
    	health.setMemnumber(memnumber);
    	health.setAssesdate(assesdate);
    	health.setHealthnumber(healthnumber);
    	health.setApplyreason(applyreason);
    	health.setBelongproname(belongproname);
        health.setHealthinfoid(healthinfoid);
    	for(int methodi=1;methodi<=76;methodi++){
    		String para = request.getParameter("a"+methodi);
    		String methodname = "setA"+methodi;
    		//动态调用方法
    		health.getClass().getMethod(methodname, new Class[]{String.class}).invoke(health, new Object[]{para});   
    	}
    	flag = memhealthservice.saveHealthPsyEval(health);
    	
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
	
	//心理评估
	public String premodifypsy()throws Exception{
		HttpServletRequest request = getRequest();
		String healthinfoid = request.getParameter("healthid");
		healtheval health = new healtheval();
		healthpsyeval healpsy = new healthpsyeval();
		try {
			health = memhealthservice.lookHealthEval(healthinfoid);// 获取健康评估表信息
			healpsy = memhealthservice.lookHealthPsyEval(healthinfoid);//获取心理评估表信息
	    if (health!=null) {
	        request.setAttribute("health", health);
	        request.setAttribute("healthpsy", healpsy);
	    } else {
	        return ("error");
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    return ("error");
	}
		return ("healthpsyedit");
	}

    //心理评估修改
	public String modifypsy()throws Exception{
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();  
		String healthinfoid = request.getParameter("healthid");
		String mmseid = request.getParameter("mmseid");
		String flag = "";
		healthpsyeval health = new healthpsyeval();
		
    	String memname = request.getParameter("memname");
    	String memnumber = request.getParameter("memnumber");
    	String assesdate = request.getParameter("assesdate");
    	String healthnumber = request.getParameter("healthnumber");
    	String belongproname = request.getParameter("belongproname");
    	String applyreason = request.getParameter("applyreason");
    	health.setMemname(memname);
    	health.setMemnumber(memnumber);
    	health.setAssesdate(assesdate);
    	health.setHealthnumber(healthnumber);
    	health.setApplyreason(applyreason);
    	health.setBelongproname(belongproname);
        health.setHealthinfoid(healthinfoid);
        health.setMmseid(mmseid);
    	for(int methodi=1;methodi<=76;methodi++){
    		String para = request.getParameter("a"+methodi);
    		String methodname = "setA"+methodi;
    		//动态调用方法
    		health.getClass().getMethod(methodname, new Class[]{String.class}).invoke(health, new Object[]{para});   
    	}
    	flag = memhealthservice.modifyHealthPsyEval(health);
    	
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
	

	public String getApplyreason() {
		return applyreason;
	}



	public void setApplyreason(String applyreason) {
		this.applyreason = applyreason;
	}

}