package com.wootion.cimp.services;

import java.text.ParseException;
import java.util.List;

import com.wootion.cimp.vo.data.Member;
import com.wootion.cimp.vo.data.Memberhistory;
import com.wootion.idp.common.utils.QueryResult;

public interface memberService {
	public QueryResult<Member> getQueryProResult(Integer index,
            Integer maxresult, String enterdate, String memname,
            String memid, String sessionID,String chooseflag)
			throws ParseException;
	
	public String saveMem(String memname, String memid,
            String memsex,String creditid,String birthday,String culture,String professor,String financial,String marry,String kids,String ways,String enterdate,String reside,String fees,
            String mycellnumber,String mylandlinenumber,String myaddress,String mycounty,String mystreet,String mycity,String myemail,String mynation,String coname,
            String relationship,String concellnumber,String connumber,String conaddress,String concity,String conpost,String concountry,String assessment,String asesdate)throws Exception;

    public boolean deleMember(String memid)throws Exception;
    
    public Member lookMember(String meminfoid)throws Exception;
    
    public Memberhistory lookMemberhis(String meminfoid)throws Exception;
    
    public String modifyMem(String meminfoid,String memname, String memid,
            String memsex,String creditid,String birthday,String culture,String professor,String financial,String marry,String kids,String ways,String enterdate,String reside,String fees,
            String mycellnumber,String mylandlinenumber,String myaddress,String mycounty,String mystreet,String mycity,String myemail,String mynation,String coname,
            String relationship,String concellnumber,String connumber,String conaddress,String concity,String conpost,String concountry,String assessment,String asesdate)throws Exception;

    public QueryResult<Memberhistory> getQueryMemhisResult(Integer index,
            Integer maxresult, String submitdate, String memname,
            String memid, String sessionID)
			throws ParseException;
   
    public List<String> getCaremark(String memid)throws Exception;
}
