package com.wootion.cmmb.service.activity;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import com.wootion.cimp.vo.data.Project;
import com.wootion.cmmb.persistenc.po.bean.Activityinfo;
import com.wootion.cmmb.persistenc.po.bean.Instrumenthistory;
import com.wootion.cmmb.persistenc.po.bean.Instrumentinfo;
import com.wootion.cmmb.persistenc.po.bean.activityhistory;
import com.wootion.idp.common.utils.QueryResult;

public interface InstrumentService {
	public void saveInstrument(Instrumentinfo iinfos);
	
	public QueryResult<Instrumentinfo> getQueryMentResult(Integer index,
            Integer maxresult, String mdate, String mname, String mrecorder,
            String sessionID)
			throws ParseException;
	
	public boolean deleInstrumentinfo(String mnumber) throws Exception;
	
	public boolean delementchoose(String mentid) throws Exception;
	
	public List<Instrumentinfo> lookInstrument(String mnumber)throws Exception;
	
	public List<Instrumenthistory> lookInstrumenthis(String mnumber)throws Exception;
	
	public String modifyment(String mentid, String mdate, String mnumber, String mname, String mchair, 
			String mjoint, String mbelt, String mdumbbell, String mrecorder, String msupervisor, 
			String mtotaltime, String mchairchoo, String mjointchoo, String mbeltchoo, 
			String mdumbbellchoo, String mbelongpro) throws ParseException;
	
	public QueryResult<Instrumenthistory> getQueryMentHistoryResult(Integer index,
            Integer maxresult, String mdate, String mname, String mrecorder,
            String sessionID)
			throws ParseException;
}
