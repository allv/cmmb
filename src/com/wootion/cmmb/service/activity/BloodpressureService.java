package com.wootion.cmmb.service.activity;

import java.text.ParseException;
import java.util.List;

import com.wootion.cmmb.persistenc.po.bean.Bloodpressurehistory;
import com.wootion.cmmb.persistenc.po.bean.Bloodpressureinfo;
import com.wootion.idp.common.utils.QueryResult;

public interface BloodpressureService {
	public void saveBloodpressure(Bloodpressureinfo bpinfos);
	
	public QueryResult<Bloodpressureinfo> getQueryBloResult(Integer index,
            Integer maxresult, String bstarttime, String bname, String bfilenumber,
            String sessionID)
			throws ParseException;
	
    public boolean deleBloodpressureinfo(String bdate) throws Exception;
	
	public boolean deleblochoose(String bid) throws Exception;
	
	public List<Bloodpressureinfo> lookBloodpressure(String bdate)throws Exception;
	
	public List<Bloodpressurehistory> lookBloodpressurehis(String bdate)throws Exception;
	
	public String modifyblo(String bid, String bdate, String bnumber, String bname, String bgender, 
			String bage, String bphone, String bstarttime, String bdiseases, String bfilenumber, 
			String binfo, String bwritedate, String bloodnum, String bpulse, String bbelongpro) throws ParseException;
	
	public QueryResult<Bloodpressurehistory> getQueryBloHistoryResult(Integer index,
            Integer maxresult, String bstarttime, String bname, String bfilenumber,
            String sessionID)
			throws ParseException;
}
