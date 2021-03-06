package com.wootion.cmmb.view.action.c_series;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.wootion.cimp.services.projectService;
import com.wootion.cimp.util.PageBasicInfo;
import com.wootion.cimp.vo.data.Project;
import com.wootion.cmmb.common.exception.SameObjectException;
import com.wootion.cmmb.common.util.ServletUtil;
import com.wootion.cmmb.common.workflow.WorkflowHandle;
import com.wootion.cmmb.common.workflow.WorkflowParameter;
import com.wootion.cmmb.persistenc.po.bean.Projecttracing;
import com.wootion.idp.common.utils.DomainUtil;
import com.wootion.idp.persistence.dao.CommonDao;
import com.wootion.idp.persistence.dao.CommonDaoHibernate;
import com.wootion.idp.persistence.po.bean.Wtuser;

public class ProjectActionImpl implements ProjectAction,WorkflowHandle {
	private static final String BILL_ID = WorkflowParameter.BILL_ID;
	public projectService projectservice;
	private CommonDao commondao;
    
	public CommonDao getCommondao() {
		return commondao;
	}

	public void setCommondao(CommonDao commondao) {
		this.commondao = commondao;
	}
	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.c_series.ProjectAction#addpro()
	 */
	public String addpro() throws Exception {
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
		String proidentity = request.getParameter("proidentity").trim();
		
		String trdata = request.getParameter("trdata").trim(); 
		String tddata = request.getParameter("tddata").trim();
		// UserCacheBean uc = PermissionCollection.getInstance().getUserCache(
		// request.getSession().getId());
		// Long userIdt = uc.getUserID();
		Project newProject = null;
		try{
			newProject = getProjectservice().saveProject(proname, prostate, proresponsor,
					proagency, proauthority, proresult, procontract, prostartdate,
					proenddate, probudget, protimes, prodesc, proidentity,trdata, tddata);
		}catch(SameObjectException e) {
			flag = e.getKey();
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if(newProject != null ){ 
				flag = "success";
//				request.setAttribute(FormPermissionAspect.PRIMARY_KEY_iD, newProject.getProid());
			}else {
				flag = "error";
			}
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

	

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.c_series.ProjectAction#addprotrack()
	 */
	public String addprotrack() throws Exception{
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		String flag = "";
		String proid = request.getParameter(BILL_ID).trim();
		String proname = request.getParameter("proname").trim();
		String pagedata = request.getParameter("pagedata").trim();
		String trackid = request.getParameter("trackid").trim();
		flag = getProjectservice().saveProjectTrack(proid, trackid,proname, pagedata);
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
	
	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.c_series.ProjectAction#track()
	 */
	public String track() throws Exception {
		HttpServletRequest request = getRequest();
		String pid = request.getParameter(BILL_ID);
		String isview = request.getParameter("isview");
		Project pro = new Project();
		List<Projecttracing> protracing = new ArrayList<Projecttracing>();
		Long currentUserId = ServletUtil.getCurrentUserId();
		Wtuser currentUser = commondao.getObject(Wtuser.class, currentUserId);
		if(DomainUtil.isUserAdmin(currentUser)){
			//管理员可以操作任意数据
			request.setAttribute("isadmin", "true");
		}else{
			request.setAttribute("isadmin", "false");
		}
		try {
			pro = getProjectservice().lookProject(pid);// 获取项目信息
			protracing = getProjectservice().lookProjectTrace(pid);// 获取项目进度追踪信息
			request.setAttribute("pro", pro);
			request.setAttribute("isview",isview);
		} catch (Exception e) {
			request.setAttribute("pro", null);
			e.printStackTrace();
			return ("error");
		}
		if(protracing!=null){
			request.setAttribute("trackid", protracing.get(0).getTrackid());
		    request.setAttribute("pagedataindb", protracing.get(0).getPagedata());
		   
		}else{
			request.setAttribute("trackid","");
			request.setAttribute("pagedataindb","");
		}
		return "protrack";
	}

	public static int getTotalMonth(Project pro) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		int iMonth = 0;
		int flag = 0;
		try {
			Date date1 = sdf.parse(pro.getProstartdate());
			Date date2 = sdf.parse(pro.getProenddate());
			Calendar objCalendarDate1 = Calendar.getInstance();
			objCalendarDate1.setTime(date1);

			Calendar objCalendarDate2 = Calendar.getInstance();
			objCalendarDate2.setTime(date2);

			if (objCalendarDate2.equals(objCalendarDate1))
				return 0;
			if (objCalendarDate1.after(objCalendarDate2)) {
				Calendar temp = objCalendarDate1;
				objCalendarDate1 = objCalendarDate2;
				objCalendarDate2 = temp;
			}
			if (objCalendarDate2.get(Calendar.DAY_OF_MONTH) < objCalendarDate1
					.get(Calendar.DAY_OF_MONTH))
				flag = 1;

			if (objCalendarDate2.get(Calendar.YEAR) > objCalendarDate1
					.get(Calendar.YEAR))
				iMonth = ((objCalendarDate2.get(Calendar.YEAR) - objCalendarDate1
						.get(Calendar.YEAR))
						* 12 + objCalendarDate2.get(Calendar.MONTH) - flag)
						- objCalendarDate1.get(Calendar.MONTH);
			else
				iMonth = objCalendarDate2.get(Calendar.MONTH)
						- objCalendarDate1.get(Calendar.MONTH) - flag;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return iMonth+1;
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.c_series.ProjectAction#premodify()
	 */
	public String premodify() throws Exception {
		HttpServletRequest request = getRequest();
		String pid = request.getParameter(BILL_ID);
		Project pro = new Project();

		try {
			pro = getProjectservice().lookProject(pid);// 获取项目信息
			if (pro != null) {
				request.setAttribute("pro", pro);
				request.setAttribute("trdata",pro.getTrdata());
				request.setAttribute("tddata",pro.getTddata());
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("proedit");
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.c_series.ProjectAction#modifypro()
	 */
	public String modifypro() throws Exception {
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
		
		// String proidentity = new
		// String(request.getParameter("proidentity").trim().getBytes("iso8859-1"),"utf-8");
		String proidentity = request.getParameter("proidentity").trim();
		String pid = request.getParameter(BILL_ID).trim();
		// UserCacheBean uc = PermissionCollection.getInstance().getUserCache(
		// request.getSession().getId());
		// Long userIdt = uc.getUserID();

		flag = getProjectservice().modifyProject(pid, proname, prostate,
				proresponsor, proagency, proauthority, proresult, procontract,
				prostartdate, proenddate, probudget, protimes, prodesc,
				proidentity, trdata, tddata);
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(flag);
//			request.setAttribute(FormPermissionAspect.PRIMARY_KEY_iD, pid);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("error");
		} finally {
			out.flush();
			out.close();
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.c_series.ProjectAction#deletepro()
	 */
	public String deletepro() throws Exception {
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String pID = request.getParameter(BILL_ID);// 项目ID
			out = response.getWriter();
			flag = getProjectservice().deleProject(pID);
			if (flag) {
				out.print("success");
//				request.setAttribute(FormPermissionAspect.PRIMARY_KEY_iD, pID);
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

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.c_series.ProjectAction#viewpro()
	 */
	public String viewpro() throws Exception {
		HttpServletRequest request = getRequest();
		String pid = request.getParameter(BILL_ID);
		Project pro = new Project();

		try {
			pro = getProjectservice().lookProject(pid);// 获取项目信息
			if (pro != null) {
				request.setAttribute("pro", pro);
				request.setAttribute("trdata",pro.getTrdata());
				request.setAttribute("tddata",pro.getTddata());
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("prodetail");
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.c_series.ProjectAction#page(javax.servlet.http.HttpServletRequest, com.wootion.cimp.util.PageBasicInfo)
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

	@Override
	public String getBillid() {
		HttpServletRequest request = getRequest();
		return request.getParameter(BILL_ID).trim();
	}

	@Override
	public Long getFormid() {
		return WorkflowParameter.FORM_PROJECT;
	}

	public projectService getProjectservice() {
		return projectservice;
	}

	public void setProjectservice(projectService projectservice) {
		this.projectservice = projectservice;
	}
}