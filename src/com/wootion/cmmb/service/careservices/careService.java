package com.wootion.cmmb.service.careservices;

import java.text.ParseException;
import java.util.List;

import com.wootion.cmmb.persistenc.po.bean.CareAssess;
import com.wootion.cmmb.persistenc.po.bean.Serviceplaninfo;
import com.wootion.idp.common.utils.QueryResult;

public interface careService {
    public String saveCareAssessment(CareAssess sinfos);
    
    public CareAssess lookCare(String cid)throws Exception;
    
    public QueryResult<CareAssess> getQueryCareResult(Integer index,
            Integer maxresult, String assessdate, String memname, String belongproname,
            String sessionID)
			throws ParseException;
    
    public boolean deleServiceplaninfo(String snumber) throws Exception;
	
	public boolean deleCarechoose(String careid) throws Exception;
    
    public List<Serviceplaninfo> lookServiceplan(String snumber)throws Exception;
    
    public String modifycare(String careid, String carenumber, String memnumber,
            String memname,String assesman,String assesdate,String belongproid,String belongproname,String a1,String a2,String a3,String a4,String a5,String a6,String a7
            ,String a8,String a9,String a10,String a11,String a12,String a13,String a14,String a15,String a16,
            String a17,String a18,String a19,String a20,String a21,String a22,String a23,String a24,String a25,String a26,
            String a27,String a28,String a29,String a30,String a31,String a32,String a33,String a34,String a35,String a36,String a37,String a38,
            String a39,String a40,String a41,String a42,String a43,String a44,String a45,String a46,String a47,String a48,String a49,String a50,
            String a51,String a52,String a53,String a54,String a55,String a56,String a57,String a58,String a59,String a60,String a61
            ,String a62,String a63,String a64,String a65,String a66,String a67,String a68,String a69,String a70,String a71,String a72,String a73,String a74
            ,String a75,String a76,String a77,String a78,String a79,String a80,String a81,String a82,String a83,String a84) throws ParseException;
}
