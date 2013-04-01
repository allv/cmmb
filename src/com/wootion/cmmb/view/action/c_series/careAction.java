package com.wootion.cmmb.view.action.c_series;

import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cimp.services.projectService;
import com.wootion.cmmb.common.exception.SameObjectException;
import com.wootion.cmmb.persistenc.po.bean.CareAssess;
import com.wootion.cmmb.service.careservices.careService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.cimp.util.PageBasicInfo;
import com.wootion.cimp.vo.data.Project;

public class careAction 
{
	private PageBasicInfo pageObj = null;
	public projectService projectservice;
	public careService careservice;
	
	private QueryResult<CareAssess> result;
	
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

	private String              perPageNumber = null;
	
	private String assessdate ; 
	private String memname;
	private String belongproname;
	
	careAction() {
		projectservice = IMPServiceFactory.getProjectService();
		careservice = IMPServiceFactory.getCareService();
	} 
	
	public String getcarepage(){
		return "careadd";
	}
	
	//护理评估表
	public String addcare()throws Exception{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();  
    	String flag = "";
    	CareAssess careassess = new CareAssess();
    	String memnumber = request.getParameter("memnumber");
    	String memname = request.getParameter("memname");
    	String assesman = request.getParameter("assesman");
    	String assesdate = request.getParameter("assesdate");
    	String carenumber = request.getParameter("carenumber");
    	String belongproid = "";
    	String belongproname = request.getParameter("belongproname");
    	
    	careassess.setMemname(memname);
    	careassess.setMemnumber(memnumber);
    	careassess.setAssesdate(assesdate);
    	careassess.setAssesman(assesman);
    	careassess.setCarenumber(carenumber);
    	careassess.setBelongproid(belongproid);
    	careassess.setBelongproname(belongproname);
    	
    	for(int methodi=1;methodi<=84;methodi++){
    		String para = request.getParameter("a"+methodi);
    		String methodname = "setA"+methodi;
    		//动态调用方法
    		careassess.getClass().getMethod(methodname, new Class[]{String.class}).invoke(careassess, new Object[]{para});   
    	}
    	flag = careservice.saveCareAssessment(careassess);
    	
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
	
	public String manage() 
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
        
        try {
			result = careservice.getQueryCareResult(firstindex, maxresult,
					assessdate, memname, belongproname,
			         request.getSession().getId());
		} catch (ParseException e) {
			e.printStackTrace();
		}
        return "carelist";
    }
	
    public String addpro() throws Exception 
    {
    	HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	String flag = "";
		String proname = request.getParameter("proname").trim();
		String prostate = request.getParameter("prostate").trim();
		String proresponsor = request.getParameter("proresponsor").trim();
		String proagency = request.getParameter("proagency").trim();
		String proauthority = request.getParameter("proauthority").trim();
		String proresult = request.getParameter("proresult").trim();
		String procontract = request.getParameter("procontract").trim();
		String prostartdate = request.getParameter("prostartdate").trim();
		String proenddate = request.getParameter("proenddate").trim();
		String probudget = request.getParameter("probudget").trim();
		String protimes = request.getParameter("protimes").trim();
		String prodesc = request.getParameter("prodesc").trim();
		String trdata = request.getParameter("trdata").trim();
		String tddata = request.getParameter("tddata").trim();
		String proidentity = request.getParameter("proidentity").trim();
		
		//UserCacheBean uc = PermissionCollection.getInstance().getUserCache(
		//		request.getSession().getId());
		//Long userIdt = uc.getUserID();
		Project newProject = null;
		try{
			newProject = projectservice.saveProject(proname, prostate, proresponsor, proagency, proauthority, proresult,
					procontract, prostartdate, proenddate, probudget, protimes, prodesc, proidentity,trdata,tddata);
		}catch(SameObjectException e) {
			flag = e.getKey();
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
    
    public String premodify() throws Exception{
    	HttpServletRequest request = getRequest();
		String pid = request.getParameter("proid");
		Project pro = new Project();
		
		try {
			pro = projectservice.lookProject(pid);// 获取项目信息
	    if (pro!=null) {
	        request.setAttribute("pro", pro);
	    } else {
	        return ("error");
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    return ("error");
	}
		return ("proedit");
    }
    
    public String modifypro() throws Exception 
    {
    	HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	String flag = "";
		String proname = request.getParameter("proname").trim();
		String prostate = request.getParameter("prostate").trim();
		String proresponsor = request.getParameter("proresponsor").trim();
		String proagency = request.getParameter("proagency").trim();
		String proauthority = request.getParameter("proauthority").trim();
		String proresult = request.getParameter("proresult").trim();
		String procontract = request.getParameter("procontract").trim();
		String prostartdate = request.getParameter("prostartdate").trim();
		String proenddate = request.getParameter("proenddate").trim();
		String probudget = request.getParameter("probudget").trim();
		String protimes = request.getParameter("protimes").trim();
		String prodesc = request.getParameter("prodesc").trim();
		String trdata = request.getParameter("trdata").trim();
		String tddata = request.getParameter("tddata").trim();
		//String proidentity = new String(request.getParameter("proidentity").trim().getBytes("iso8859-1"),"utf-8");
		String proidentity = request.getParameter("proidentity").trim();
		String pid = request.getParameter("proid").trim();
		//UserCacheBean uc = PermissionCollection.getInstance().getUserCache(
		//		request.getSession().getId());
		//Long userIdt = uc.getUserID();
		
	    flag = projectservice.modifyProject(pid,proname, prostate, proresponsor, proagency, proauthority, proresult,
	    		procontract, prostartdate, proenddate, probudget, protimes, prodesc, proidentity,trdata,tddata);
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
    
    public String deletepro() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String pID = request.getParameter("proid");// 项目ID
			out = response.getWriter();
			flag = projectservice.deleProject(pID);
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
    
    public String deletecare() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String careid = request.getParameter("careid");// 项目ID
			out = response.getWriter();
			flag = careservice.deleCarechoose(careid);
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
    
    public String caremodify()throws Exception{
    	HttpServletRequest request = getRequest();
		String cid = request.getParameter("careid");
		CareAssess ca = new CareAssess();
		
		try {
			ca = careservice.lookCare(cid);// 获取项目信息
	    if (ca!=null) {
	        request.setAttribute("care", ca);
	    } else {
	        return ("error");
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    return ("error");
	}
		return ("careedit");
    }
    
    public String modifycare() throws Exception 
    {
    	HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	String flag = "";
		String careid = request.getParameter("careid");
		String memnumber = request.getParameter("memnumber");
    	String memname = request.getParameter("memname");
    	String assesman = request.getParameter("assesman");
    	String assesdate = request.getParameter("assesdate");
    	String carenumber = request.getParameter("carenumber");
    	String belongproid = "";
    	String belongproname = request.getParameter("belongproname");
    	String a1 = request.getParameter("a1");
    	String a2 = request.getParameter("a2");
    	String a3 = request.getParameter("a3");
    	String a4 = request.getParameter("a4");
    	String a5 = request.getParameter("a5");
    	String a6 = request.getParameter("a6");
    	String a7 = request.getParameter("a7");
    	String a8 = request.getParameter("a8");
    	String a9 = request.getParameter("a9");
    	String a10 = request.getParameter("a10");
    	String a11 = request.getParameter("a11");
    	String a12 = request.getParameter("a12");
    	String a13 = request.getParameter("a13");
    	String a14 = request.getParameter("a14");
    	String a15 = request.getParameter("a15");
    	String a16 = request.getParameter("a16");
    	String a17 = request.getParameter("a17");
    	String a18 = request.getParameter("a18");
    	String a19 = request.getParameter("a19");
    	String a20 = request.getParameter("a20");
    	String a21 = request.getParameter("a21");
    	String a22 = request.getParameter("a22");
    	String a23 = request.getParameter("a23");
    	String a24 = request.getParameter("a24");
    	String a25 = request.getParameter("a25");
    	String a26 = request.getParameter("a26");
    	String a27 = request.getParameter("a27");
    	String a28 = request.getParameter("a28");
    	String a29 = request.getParameter("a29");
    	String a30 = request.getParameter("a30");
    	String a31 = request.getParameter("a31");
    	String a32 = request.getParameter("a32");
    	String a33 = request.getParameter("a33");
    	String a34 = request.getParameter("a34");
    	String a35 = request.getParameter("a35");
    	String a36 = request.getParameter("a36");
    	String a37 = request.getParameter("a37");
    	String a38 = request.getParameter("a38");
    	String a39 = request.getParameter("a39");
    	String a40 = request.getParameter("a40");
    	String a41 = request.getParameter("a41");
    	String a42 = request.getParameter("a42");
    	String a43 = request.getParameter("a43");
    	String a44 = request.getParameter("a44");
    	String a45 = request.getParameter("a45");
    	String a46 = request.getParameter("a46");
    	String a47 = request.getParameter("a47");
    	String a48 = request.getParameter("a48");
    	String a49 = request.getParameter("a49");
    	String a50 = request.getParameter("a50");
    	String a51 = request.getParameter("a51");
    	String a52 = request.getParameter("a52");
    	String a53 = request.getParameter("a53");
    	String a54 = request.getParameter("a54");
    	String a55 = request.getParameter("a55");
    	String a56 = request.getParameter("a56");
    	String a57 = request.getParameter("a57");
    	String a58 = request.getParameter("a58");
    	String a59 = request.getParameter("a59");
    	String a60 = request.getParameter("a60");
    	String a61 = request.getParameter("a61");
    	String a62 = request.getParameter("a62");
    	String a63 = request.getParameter("a63");
    	String a64 = request.getParameter("a64");
    	String a65 = request.getParameter("a65");
    	String a66 = request.getParameter("a66");
    	String a67 = request.getParameter("a67");
    	String a68 = request.getParameter("a68");
    	String a69 = request.getParameter("a69");
    	String a70 = request.getParameter("a70");
    	String a71 = request.getParameter("a71");
    	String a72 = request.getParameter("a72");
    	String a73 = request.getParameter("a73");
    	String a74 = request.getParameter("a74");
    	String a75 = request.getParameter("a75");
    	String a76 = request.getParameter("a76");
    	String a77 = request.getParameter("a77");
    	String a78 = request.getParameter("a78");
    	String a79 = request.getParameter("a79");
    	String a80 = request.getParameter("a80");
    	String a81 = request.getParameter("a81");
    	String a82 = request.getParameter("a82");
    	String a83 = request.getParameter("a83");
    	String a84 = request.getParameter("a84");
		
	    flag = careservice.modifycare(careid, carenumber, memnumber, memname, assesman, assesdate,
	    		belongproid, belongproname, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13,
	    		a14, a15, a16, a17, a18, a19, a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, a30,
	    		a31, a32, a33, a34, a35, a36, a37, a38, a39, a40, a41, a42, a43, a44, a45, a46, a47,
	    		a48, a49, a50, a51, a52, a53, a54, a55, a56, a57, a58, a59, a60, a61, a62, a63, a64,
	    		a65, a66, a67, a68, a69, a70, a71, a72, a73, a74, a75, a76, a77, a78, a79, a80, a81,a82,a83,a84);
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
    
    public String viewcare()throws Exception{
    	HttpServletRequest request = getRequest();
		String cid = request.getParameter("careid");
		CareAssess ca = new CareAssess();
		
		try {
			ca = careservice.lookCare(cid);// 获取项目信息
	    if (ca!=null) {
	        request.setAttribute("care", ca);
	    } else {
	        return ("error");
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    return ("error");
	}
		return ("caredetail");
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

	public QueryResult<CareAssess> getResult() {
		return result;
	}

	public void setResult(QueryResult<CareAssess> result) {
		this.result = result;
	}
}