package com.wootion.cmmb.view.action.membermanage;

import javax.servlet.http.HttpServletRequest;

import com.wootion.cimp.util.PageBasicInfo;
import com.wootion.cimp.vo.data.Memberhistory;
import com.wootion.idp.common.utils.QueryResult;

public interface MemAction {

	public abstract String getFileName();

	public abstract void setFileName(String fileName);

	public abstract String addmem() throws Exception;

	public abstract String premodify() throws Exception;

	public abstract String modifymem() throws Exception;

	public abstract String hislist() throws Exception;

	public abstract String statistics() throws Exception;

	public abstract void deleteFile() throws Exception;

	public abstract void GetFile() throws Exception;

	public abstract String deletemem() throws Exception;

	public abstract String viewmem() throws Exception;

	public abstract String viewmemhis() throws Exception;

	/**
	 * 实现分页显示
	 * 
	 * @param request
	 * @param pageObj
	 * @return
	 */

	public abstract void page(HttpServletRequest request, PageBasicInfo pageObj);

	public abstract PageBasicInfo getPageObj();

	public abstract void setPageObj(PageBasicInfo pageObj);

	public abstract String getNowpage();

	public abstract void setNowpage(String nowpage);

	public abstract String getMaxpage();

	public abstract void setMaxpage(String maxpage);

	public abstract String getPerPageNumber();

	public abstract void setPerPageNumber(String perPageNumber);

	public abstract QueryResult<Memberhistory> getResult();

	public abstract void setResult(QueryResult<Memberhistory> result);

	public abstract String getMemname();

	public abstract void setMemname(String memname);

	public abstract String getMemid();

	public abstract void setMemid(String memid);

	public abstract String getSubmitdate();

	public abstract void setSubmitdate(String submitdate);

}