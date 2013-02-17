package com.wootion.cimp.services;

import java.text.ParseException;
import java.util.List;

import com.wootion.cimp.vo.data.Project;
import com.wootion.cmmb.persistenc.po.bean.Projecttracing;
import com.wootion.idp.common.utils.QueryResult;

public interface projectService {
	
	public QueryResult<Project> getQueryProResult(Integer index,
            Integer maxresult, String prostartdate, String proenddate,
            String proname, String proidentity, String sessionID)
			throws ParseException;
	
	public String saveProject(String proname, String prostate, String proresponsor, String proagency, String proauthority, String proresult,
			String procontract, String prostartdate, String proenddate, String probudget, String protimes, String prodesc, String proidentity,String trdata,String tddata)
			throws ParseException;
	public boolean deleProject(String pid) throws Exception;
	
	public Project lookProject(String pid)throws Exception;
	
	public List<Projecttracing> lookProjectTrace(String ptid)throws Exception;
	
	public String saveProjectTrack(String proid,String trackid,String proname,String pagedata) throws Exception;
	
	public String modifyProject(String pid,String proname, String prostate,
			String proresponsor,String proagency,String proauthority,String proresult,String procontract,String prostartdate,String proenddate,String probudget,String protimes,String prodesc, String proidentity,String trdata,String tddata)
			throws ParseException;
}
