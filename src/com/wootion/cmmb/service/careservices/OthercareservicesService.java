package com.wootion.cmmb.service.careservices;

import java.text.ParseException;
import java.util.List;

import com.wootion.cmmb.persistenc.po.bean.Activityinfo;
import com.wootion.cmmb.persistenc.po.bean.Othercareserviceshistory;
import com.wootion.cmmb.persistenc.po.bean.Othercareservicesinfo;
import com.wootion.cmmb.persistenc.po.bean.bathrecordinfo;
import com.wootion.idp.common.utils.QueryResult;

public interface OthercareservicesService {
    public void saveOthercareservices(Othercareservicesinfo oinfos);
    
    public QueryResult<Othercareservicesinfo> getQueryCarResult(Integer index,
            Integer maxresult, String odate, String oname, String opeople,
            String sessionID)
			throws ParseException;
    
    public boolean deleOthercareservicesinfo(String onumber) throws Exception;
	
	public boolean delecarchoose(String oid) throws Exception;
    
    public List<Othercareservicesinfo> lookOthercareservices(String onumber)throws Exception;
    
    public List<Othercareserviceshistory> lookOthercareserviceshis(String onumber)throws Exception;
    
    public String modifycar(String oid, String odate, String onumber, String oname, String ocontent, 
			String ostarttime, String oendtime, String opeople, String oevaluation, String oinfo, String obelongpro) throws ParseException;
    
    public QueryResult<Othercareserviceshistory> getQueryCarHistoryResult(Integer index,
            Integer maxresult, String odate, String oname, String opeople,
            String sessionID)
			throws ParseException;
}
