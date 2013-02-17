package com.wootion.cmmb.service.activity;

import java.text.ParseException;
import java.util.List;

import com.wootion.cmmb.persistenc.po.bean.Activityinfo;
import com.wootion.cmmb.persistenc.po.bean.CareAssess;
import com.wootion.cmmb.persistenc.po.bean.activityhistory;
import com.wootion.cmmb.persistenc.po.bean.recoveryAssess;
import com.wootion.idp.common.utils.QueryResult;

public interface ActivityService {
	public void saveActivity(Activityinfo ainfos);
	
	public QueryResult<recoveryAssess> getQueryRecoveryResult(Integer index,
            Integer maxresult,String assessdate, String memname, String belongproname,
            String sessionID)
			throws ParseException;
	
	public QueryResult<Activityinfo> getQueryActResult(Integer index,
            Integer maxresult, String atime, String aname,
            String sessionID)
			throws ParseException;
	
	public recoveryAssess lookRecovery(String rid)throws Exception;
	
	public String modifyRecoveryAssessment(recoveryAssess sinfos)throws Exception;
	
	public String deleRecovery(String rid)throws Exception;
	
	public String saveRecoveryAssessment(recoveryAssess sinfos) ;
	
	public boolean deleActivityinfo(String anumber) throws Exception;
	
	public boolean deleactchoose(String aid) throws Exception;
	
	public List<Activityinfo> lookActivity(String anumber)throws Exception;
	
	public List<activityhistory> lookActivityhis(String anumber)throws Exception;
	
	public String modifyact(String aid, String anumber, String atime, String aname, String apeoplenum, 
			String stime, String aplace, String ainfo, String abelongpro) throws ParseException;

	public QueryResult<activityhistory> getQueryActHistoryResult(Integer index,
            Integer maxresult, String atime, String aname,
            String sessionID)
			throws ParseException;
}
