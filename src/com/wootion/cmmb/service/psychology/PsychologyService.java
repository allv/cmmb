package com.wootion.cmmb.service.psychology;

import java.text.ParseException;
import java.util.List;

import com.wootion.cimp.vo.data.Project;
import com.wootion.cmmb.persistenc.po.bean.activityhistory;
import com.wootion.cmmb.persistenc.po.bean.psychologyhistory;
import com.wootion.cmmb.persistenc.po.bean.psychologyinfo;
import com.wootion.idp.common.utils.QueryResult;

public interface PsychologyService {
	public QueryResult<psychologyinfo> getQueryActResult(Integer index,
            Integer maxresult, String pdate, String pwrite,
            String sessionID)
			throws ParseException;
	
	public void savePsychology(psychologyinfo pinfos);
	
	public boolean delepsychology(String pnumber) throws Exception;
	
	public boolean delepsychoose(String pid) throws Exception;
	
	public List<psychologyhistory> lookPsychologyhis(String pnumber)throws Exception;
	
    public List<psychologyinfo> lookPsychology(String pnumber)throws Exception;
	
	public String modifypsy(String pid, String pnumber, String pdate, String pstarttime, String pendtime, 
			String pattend, String pinfo, String pwrite, String pbelongpro) throws ParseException;
	
	public QueryResult<psychologyhistory> getQueryPsyHistoryResult(Integer index,
            Integer maxresult, String pdate, String pwrite,
            String sessionID)
			throws ParseException;
	
	public QueryResult<Project> getQueryProResult(Integer index,
            Integer maxresult, String prostartdate, String proenddate,
            String proname, String proidentity, String sessionID)
			throws ParseException;
}
