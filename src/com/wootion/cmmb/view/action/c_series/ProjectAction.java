package com.wootion.cmmb.view.action.c_series;

import javax.servlet.http.HttpServletRequest;

import com.wootion.cimp.util.PageBasicInfo;

public interface ProjectAction {

	public abstract String addpro() throws Exception;

	public abstract String addprotrack() throws Exception;

	public abstract String track() throws Exception;

	public abstract String premodify() throws Exception;

	public abstract String modifypro() throws Exception;

	public abstract String deletepro() throws Exception;

	public abstract String viewpro() throws Exception;

	/**
	 * 实现分页显示
	 * 
	 * @param request
	 * @param pageObj
	 * @return
	 */

	public abstract void page(HttpServletRequest request, PageBasicInfo pageObj);

}