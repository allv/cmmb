package com.wootion.cmmb.service.careservices;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.wootion.cimp.idao.BaseDao;
import com.wootion.cimp.vo.data.Member;
import com.wootion.cmmb.persistenc.po.bean.CareAssess;
import com.wootion.cmmb.persistenc.po.bean.Serviceplaninfo;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.CommonDao;

public class careServiceImpl implements careService{

	private BaseDao baseDao;
	private CommonDao commondao;
	public CommonDao getCommondao() {
		return commondao;
	}
	public void setCommondao(CommonDao commondao) {
		this.commondao = commondao;
	}
	public BaseDao getBaseDao() {
		return baseDao;
	}
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	private Member lookMember(String meminfoid)throws Exception{
		Member mem = new Member();
		List<Member> memList = null;
		memList = new ArrayList<Member>();
		memList = baseDao.find("from Member tt where tt.memid=?", meminfoid);
		mem = memList.get(0);
		return mem;
	}
	
	public String saveCareAssessment(CareAssess sinfos) {
		try{
			Member mem = lookMember(sinfos.getMemnumber());
			int isCareEva = Integer.parseInt(mem.getIsCareEva());
			mem.setIsCareEva(String.valueOf((isCareEva+1)));
			System.out.print("MMMMMMMM"+isCareEva);
			baseDao.save(mem);
			baseDao.save(sinfos);
			return "success";
		}catch(Exception e){
			System.out.println(e.getMessage()+"  ERROR");
			return "error";
		}
	}
	
	public CareAssess lookCare(String cid)throws Exception{
		CareAssess ca = new CareAssess();
		List<CareAssess> careList = null;
		careList = new ArrayList<CareAssess>();
		careList = baseDao.find("from CareAssess tt where tt.careid=?", cid);
		ca = careList.get(0);
		return ca;
	}
	
	public void saveServiceplan(Serviceplaninfo sinfos) {
		baseDao.save(sinfos);
	}
	
	public QueryResult<CareAssess> getQueryCareResult(Integer index,
            Integer maxresult, String assessdate, String memname, String belongproname,
            String sessionID)
			throws ParseException {
		String whererjpql = "1=1";
		List<Object> lst = new ArrayList<Object>();
		if(assessdate != null && !assessdate.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.assesdate <= ?";
	        lst.add(assessdate);
		}
		if (memname != null && !memname.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.memname like '%"
	                 + memname + "%'";
	     }
		
		if (belongproname != null && !belongproname.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.belongproname like '%"
	                 + belongproname + "%'";
	     }
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("assesdate", "DESC");
	     return this.commondao.getScrollData(CareAssess.class, "careid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	
	public List<Serviceplaninfo> lookServiceplan(String snumber) throws Exception {
		List<Serviceplaninfo> serList = null;
		try {
			serList = new ArrayList<Serviceplaninfo>();
			serList = baseDao.find("from Serviceplaninfo ta where ta.snumber=?", snumber);
			if (serList.size() > 0) {
				return serList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public String modifycare(String careid, String carenumber, String memnumber,
            String memname,String assesman,String assesdate,String belongproid,String belongproname,String a1,String a2,String a3,String a4,String a5,String a6,String a7
            ,String a8,String a9,String a10,String a11,String a12,String a13,String a14,String a15,String a16,
            String a17,String a18,String a19,String a20,String a21,String a22,String a23,String a24,String a25,String a26,
            String a27,String a28,String a29,String a30,String a31,String a32,String a33,String a34,String a35,String a36,String a37,String a38,
            String a39,String a40,String a41,String a42,String a43,String a44,String a45,String a46,String a47,String a48,String a49,String a50,
            String a51,String a52,String a53,String a54,String a55,String a56,String a57,String a58,String a59,String a60,String a61
            ,String a62,String a63,String a64,String a65,String a66,String a67,String a68,String a69,String a70,String a71,String a72,String a73,String a74
            ,String a75,String a76,String a77,String a78,String a79,String a80,String a81,String a82,String a83,String a84)
			throws ParseException {
		SessionFactory factory = baseDao.getFactory();
        Session s1 = factory.openSession();
        Session s2 = factory.openSession();
        Transaction tx1 = s1.beginTransaction();
        tx1.begin();
        CareAssess careassess = new CareAssess();
		List<CareAssess> list = baseDao.find("from CareAssess bi where bi.careid=?", careid);
		//保存活动历史记录
		if (list.size() > 0)
		{
//			Serviceplanhistory shis = new Serviceplanhistory();
//			ser.setSnumber(list.get(0).getSnumber());
//			ser.setSname(list.get(0).getSname());
//			ser.setSgender(list.get(0).getSgender());
//			ser.setSage(list.get(0).getSage());
//			ser.setSdate(list.get(0).getSdate());
//			ser.setSproject1(list.get(0).getSproject1());
//			ser.setSproject2(list.get(0).getSproject2());
//			ser.setSproject3(list.get(0).getSproject3());
//			ser.setSproject4(list.get(0).getSproject4());
//			ser.setSproject5(list.get(0).getSproject5());
//			ser.setSproject6(list.get(0).getSproject6());
//			ser.setSproject7(list.get(0).getSproject7());
//			ser.setSproject8(list.get(0).getSproject8());
//			ser.setSother(list.get(0).getSother());
//			ser.setSpeople(list.get(0).getSpeople());
//			ser.setStatus(list.get(0).getStatus());
//			ser.setSbelongpro(list.get(0).getSbelongpro());
//			s1.save(shis);
			tx1.commit();
			s1.close();
		}
		Transaction tx2 = s2.beginTransaction();
	    tx2.begin();
		{
			try
			{
				careassess.setCareid(careid);
				careassess.setMemname(memname);
		    	careassess.setMemnumber(memnumber);
		    	careassess.setAssesdate(assesdate);
		    	careassess.setAssesman(assesman);
		    	careassess.setCarenumber(carenumber);
		    	careassess.setBelongproid(belongproid);
		    	careassess.setBelongproname(belongproname);
		    	careassess.setA1(a1);
		    	careassess.setA2(a2);
		    	careassess.setA3(a3);
		    	careassess.setA4(a4);
		    	careassess.setA5(a5);
		    	careassess.setA6(a6);
		    	careassess.setA7(a7);
		    	careassess.setA8(a8);
		    	careassess.setA9(a9);
		    	careassess.setA10(a10);
		    	careassess.setA11(a11);
		    	careassess.setA12(a12);
		    	careassess.setA13(a13);
		    	careassess.setA14(a14);
		    	careassess.setA15(a15);
		    	careassess.setA16(a16);
		    	careassess.setA17(a17);
		    	careassess.setA18(a18);
		    	careassess.setA19(a19);
		    	careassess.setA20(a20);
		    	careassess.setA21(a21);
		    	careassess.setA22(a22);
		    	careassess.setA23(a23);
		    	careassess.setA24(a24);
		    	careassess.setA25(a25);
		    	careassess.setA26(a26);
		    	careassess.setA27(a27);
		    	careassess.setA28(a28);
		    	careassess.setA29(a29);
		    	careassess.setA30(a30);
		    	careassess.setA31(a31);
		    	careassess.setA32(a32);
		    	careassess.setA33(a33);
		    	careassess.setA34(a34);
		    	careassess.setA35(a35);
		    	careassess.setA36(a36);
		    	careassess.setA37(a37);
		    	careassess.setA38(a38);
		    	careassess.setA39(a39);
		    	careassess.setA40(a40);
		    	careassess.setA41(a41);
		    	careassess.setA42(a42);
		    	careassess.setA43(a43);
		    	careassess.setA44(a44);
		    	careassess.setA45(a45);
		    	careassess.setA46(a46);
		    	careassess.setA47(a47);
		    	careassess.setA48(a48);
		    	careassess.setA49(a49);
		    	careassess.setA50(a50);
		    	careassess.setA51(a51);
		    	careassess.setA52(a52);
		    	careassess.setA53(a53);
		    	careassess.setA54(a54);
		    	careassess.setA55(a55);
		    	careassess.setA56(a56);
		    	careassess.setA57(a57);
		    	careassess.setA58(a58);
		    	careassess.setA59(a59);
		    	careassess.setA60(a60);
		    	careassess.setA61(a61);
		    	careassess.setA62(a62);
		    	careassess.setA63(a63);
		    	careassess.setA64(a64);
		    	careassess.setA65(a65);
		    	careassess.setA66(a66);
		    	careassess.setA67(a67);
		    	careassess.setA68(a68);
		    	careassess.setA69(a69);
		    	careassess.setA70(a70);
		    	careassess.setA71(a71);
		    	careassess.setA72(a72);
		    	careassess.setA73(a73);
		    	careassess.setA74(a74);
		    	careassess.setA75(a75);
		    	careassess.setA76(a76);
		    	careassess.setA77(a77);
		    	careassess.setA78(a78);
		    	careassess.setA79(a79);
		    	careassess.setA80(a80);
		    	careassess.setA82(a82);
		    	careassess.setA81(a81);
		    	careassess.setA83(a83);
		    	careassess.setA84(a84);
				//baseDao.update(act);
				s2.update(careassess);
				tx2.commit();
				s2.close();
			} catch (Exception e) {
				e.printStackTrace();
				tx2.commit();
				s2.close();
				return "error";
			}
		}
    	return "success";
	}
	
	public boolean deleServiceplaninfo(String snumber) throws Exception {
		List<Serviceplaninfo> serList = null;
		try {
			serList = new ArrayList<Serviceplaninfo>();
			serList = baseDao.find("from Serviceplaninfo ac where ac.snumber=?", snumber);
			
			if (serList != null && serList.size() > 0) {
				for (int i=0; i<serList.size(); i++)
				{
					baseDao.delete(serList.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean deleCarechoose(String careid) throws Exception {
		List<CareAssess> careList = null;
		try {
			careList = new ArrayList<CareAssess>();
			careList = baseDao.find("from CareAssess ps where careid=?", careid);
			if (careList != null && careList.size() > 0) {
				Member mem = lookMember(careList.get(0).getMemnumber());
				int isCareEva = Integer.parseInt(mem.getIsCareEva());
				mem.setIsCareEva(String.valueOf((isCareEva-1)));
				//mem.setIsRecoverEva(String.valueOf((isR+1)));
				System.out.print("DDDDDDD"+isCareEva);
				baseDao.save(mem);
				baseDao.delete(careList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
