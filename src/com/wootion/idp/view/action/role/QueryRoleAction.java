package com.wootion.idp.view.action.role;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.role.RoleManagerService;
import com.wootion.idp.view.action.BaseAction;

public class QueryRoleAction extends BaseAction {
	private String nowpage = null;// 页码
	private String maxpage = null;// 每页显示条数
	private String startDate;// 角色创建开始时间
	private String endDate;// 角色创建结束时间，主要用于查询一个时间区间内创建的用户
	private String rolename;

	private QueryResult<Wtrole> result;

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {

		Integer firstindex = 1;//当前页数
		Integer maxresult = 10;//每页显示数
		if (nowpage != null && !nowpage.trim().equals("")) {
			firstindex = Integer.parseInt(nowpage.trim());
			if(firstindex==0){
				firstindex=1;
			}
		}
		if (maxpage != null && !maxpage.trim().equals("")) {
			maxresult = Integer.parseInt(maxpage.trim());
		}
		RoleManagerService roleService = ServiceFactroy.getRoleService();
		result = roleService.getQueryUserResult(firstindex, maxresult,
				startDate, endDate, rolename);
		return SUCESS;
	}

	public QueryResult<Wtrole> getResult() {
		return result;
	}

	public void setResult(QueryResult<Wtrole> result) {
		this.result = result;
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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	
}