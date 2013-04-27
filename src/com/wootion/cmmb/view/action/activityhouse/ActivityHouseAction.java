package com.wootion.cmmb.view.action.activityhouse;

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
import com.wootion.cmmb.persistenc.po.bean.Activityhouse;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class ActivityHouseAction extends BaseAction
{
	private PageBasicInfo pageObj = null;
	public memberHealthService memhealthservice;
	  
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

	private String              perPageNumber = null;
	
	private String              ahnum = null;
	
	private String              ahtotalpeo = null;
	
	private String              ahtotalnum = null;
	
	private String              ahmanager = null;
	
	
	private QueryResult<Activityhouse> result;
	ActivityHouseAction() {
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
	
	public String modifyHouse()throws Exception{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();  
    	String flag = "";
    	String ahid = request.getParameter("ahid");
    	Activityhouse ahouse = memhealthservice.lookActivityHouse(ahid);
    	String ahnum = request.getParameter("ahnum");
    	String ahmanager = request.getParameter("ahmanager");
    	String ahvolunteer = request.getParameter("ahvolunteer");
    	String ahplan = request.getParameter("ahplan");
        
    	String arrange1 = request.getParameter("arrange1");
    	String arrange2 = request.getParameter("arrange2");
    	String arrange3 = request.getParameter("arrange3");
    	String arrange4 = request.getParameter("arrange4");
    	String arrange5 = request.getParameter("arrange5");
    	
    	ahouse.setAhid(ahid);
    	ahouse.setAhplan(ahplan);
    	ahouse.setAhvolunteer(ahvolunteer);
    	ahouse.setAhnum(ahnum);
    	ahouse.setAhmanager(ahmanager);
    	ahouse.setArrange1(arrange1);
    	ahouse.setArrange3(arrange3);
    	ahouse.setArrange2(arrange2);
    	ahouse.setArrange5(arrange5);
    	ahouse.setArrange4(arrange4);
    	
    	flag = memhealthservice.modifyActivityHouse(ahouse);
    	
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
	
	
	public String house(){
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
        	result = memhealthservice.getQueryActivityHouseResult(firstindex, maxresult,
					ahnum, ahtotalpeo, ahtotalnum,ahmanager,
					 getRequest().getSession().getId());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return ("houselist");
	}
	
	public String premodifyHouse()throws Exception{
		HttpServletRequest request = getRequest();
		String ahid = request.getParameter("ahid");
		Activityhouse ahouse = new Activityhouse();
		
		try {
			ahouse = memhealthservice.lookActivityHouse(ahid);// 获取活动室信息
	    if (ahouse!=null) {
	        request.setAttribute("ahouse", ahouse);
	    } else {
	        return ("error");
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    return ("error");
	}
		return ("houseedit");
	}
	
	public void deletehouse(){
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String ahid = request.getParameter("ahid");
			out = response.getWriter();
			flag = memhealthservice.deleActivityHouse(ahid);
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
	
	public String viewHouse(){
		HttpServletRequest request = getRequest();
		String ahid = request.getParameter("ahid");
		Activityhouse ahouse = new Activityhouse();
		
		try {
			ahouse = memhealthservice.lookActivityHouse(ahid);// 获取评估表信息
	    if (ahouse!=null) {
	        request.setAttribute("ahouse", ahouse);
	    } else {
	        return ("error");
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    return ("error");
	}
		return ("housedetail");
	}
	
	public String saveHouse()throws Exception{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();  
    	String flag = "";
    	Activityhouse ahouse = new Activityhouse();
    	String ahnum = request.getParameter("ahnum");
    	String ahmanager = request.getParameter("ahmanager");
    	String ahvolunteer = request.getParameter("ahvolunteer");
    	String ahplan = request.getParameter("ahplan");
    	
    	String arrange1 = request.getParameter("arrange1");
    	String arrange2 = request.getParameter("arrange2");
    	String arrange3 = request.getParameter("arrange3");
    	String arrange4 = request.getParameter("arrange4");
    	String arrange5 = request.getParameter("arrange5");
        
    	ahouse.setAhplan(ahplan);
    	ahouse.setAhvolunteer(ahvolunteer);
    	ahouse.setAhnum(ahnum);
    	ahouse.setAhmanager(ahmanager);
    	ahouse.setArrange1(arrange1);
    	ahouse.setArrange3(arrange3);
    	ahouse.setArrange2(arrange2);
    	ahouse.setArrange5(arrange5);
    	ahouse.setArrange4(arrange4);
    	
    	flag = memhealthservice.saveActivityHouse(ahouse);
    	
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
	
	//活动统计
	public String houseservtime()throws Exception{
		HttpServletRequest request = getRequest();
		String ahid = request.getParameter("ahid");
		request.setAttribute("ahid", ahid);
		
		Activityhouse house = new Activityhouse();
		house = memhealthservice.lookActivityHouse(ahid);// 获取活动信息
	    request.setAttribute("activity", house);
		return "houseactivity";
	}
	
	public String counterSubmit()throws Exception{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	
    	String ahid = (String)request.getParameter("ahid");
    	
    	Activityhouse house = new Activityhouse();
		house = memhealthservice.lookActivityHouse(ahid);// 获取活动室信息
    	
    	String activitydate = (String)request.getParameter("servdateitem");
    	String activitynum = (String)request.getParameter("activityitem2");
    	String activitypeonum = (String)request.getParameter("activityitem3");
    	String activitybak = (String)request.getParameter("servbakitem");
    	String ahtotalpeo = (String)request.getParameter("ahtotalpeo");
    	String ahtotalnum = (String)request.getParameter("ahtotalnum");
    	String flag = "";
    	house.setActivitybak(activitybak);
    	house.setActivitydate(activitydate);
    	house.setActivitynum(activitynum);
    	house.setActivitypeonum(activitypeonum);
    	house.setAhtotalnum(Integer.parseInt(ahtotalnum));
    	house.setAhtotalpeo(Integer.parseInt(ahtotalpeo));
    	flag = memhealthservice.saveActivityCounter(house);
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
	
	public String servicesubmit()throws Exception{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	
    	String ahid = (String)request.getParameter("ahid");
    	
    	Activityhouse house = new Activityhouse();
		house = memhealthservice.lookActivityHouse(ahid);// 获取活动室信息
    	
    	String ahservicename = (String)request.getParameter("servdateitem");
    	String ahservicestart = (String)request.getParameter("activityitem2");
    	String ahserviceend = (String)request.getParameter("activityitem3");
    	String ahservicestop = (String)request.getParameter("servbakitem");
    	String flag = "";
    	house.setAhserviceend(ahserviceend);
    	house.setAhservicename(ahservicename);
    	house.setAhservicestart(ahservicestart);
    	house.setAhservicestop(ahservicestop);
    	flag = memhealthservice.saveActivityCounter(house);
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
	
	public String servicemanage()throws Exception{
		HttpServletRequest request = getRequest();
		String ahid = request.getParameter("ahid");
		request.setAttribute("ahid", ahid);
		
		Activityhouse house = new Activityhouse();
		house = memhealthservice.lookActivityHouse(ahid);// 获取活动信息
	    request.setAttribute("activity", house);
		
		return "houseservice";
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
        return ("houselist");
	}
	
	public String activityplan(){
		return "";
	}
	
	public String addActivityhouse(){
		return "houseadd";
	}
	
	public String getaddpage(){
		return ("memhealthadd");
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

	public String getAhnum() {
		return ahnum;
	}

	public void setAhnum(String ahnum) {
		this.ahnum = ahnum;
	}

	public String getAhtotalpeo() {
		return ahtotalpeo;
	}

	public void setAhtotalpeo(String ahtotalpeo) {
		this.ahtotalpeo = ahtotalpeo;
	}

	public String getAhtotalnum() {
		return ahtotalnum;
	}

	public void setAhtotalnum(String ahtotalnum) {
		this.ahtotalnum = ahtotalnum;
	}

	public String getAhmanager() {
		return ahmanager;
	}

	public void setAhmanager(String ahmanager) {
		this.ahmanager = ahmanager;
	}

	public QueryResult<Activityhouse> getResult() {
		return result;
	}
	public void setResult(QueryResult<Activityhouse> result) {
		this.result = result;
	}

}