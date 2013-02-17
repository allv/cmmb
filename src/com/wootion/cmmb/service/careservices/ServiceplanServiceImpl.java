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
import com.wootion.cmmb.persistenc.po.bean.Activityinfo;
import com.wootion.cmmb.persistenc.po.bean.Othercareserviceshistory;
import com.wootion.cmmb.persistenc.po.bean.Othercareservicesinfo;
import com.wootion.cmmb.persistenc.po.bean.Serviceplanhistory;
import com.wootion.cmmb.persistenc.po.bean.Serviceplaninfo;
import com.wootion.cmmb.persistenc.po.bean.activityhistory;
import com.wootion.cmmb.persistenc.po.bean.bathrecordhistory;
import com.wootion.cmmb.persistenc.po.bean.bathrecordinfo;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.CommonDao;

public class ServiceplanServiceImpl implements ServiceplanService{

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
	
	public void saveServiceplan(Serviceplaninfo sinfos) {
		baseDao.save(sinfos);
	}
	
	public QueryResult<Serviceplaninfo> getQuerySerResult(Integer index,
            Integer maxresult, String sdate, String sname, String speople,
            String sessionID)
			throws ParseException {
		String whererjpql = "o.sid in (select min(a.sid) from Serviceplaninfo as a group by a.snumber)";
		List<Object> lst = new ArrayList<Object>();
		if(sdate != null && !sdate.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.sdate <= ?";
	         lst.add(sdate);
		}
		if (sname != null && !sname.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.sname like '%"
	                 + sname + "%'";
	     }
		if (speople != null && !speople.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.speople like '%"
	                 + speople + "%'";
	     }
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("sdate", "DESC");
	     return this.commondao.getScrollData(Serviceplaninfo.class, "sid", index,
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
	public String modifyser(String sid, String snumber, String sname, String sgender, String sage, 
			String sdate, String sproject1, String sproject2, String sproject3, String sproject4, 
			String sproject5, String sproject6, String sproject7, String sproject8, 
			String sother, String speople, String status, String sbelongpro)
			throws ParseException {
		SessionFactory factory = baseDao.getFactory();
        Session s1 = factory.openSession();
        Session s2 = factory.openSession();
        Transaction tx1 = s1.beginTransaction();
        tx1.begin();
        Serviceplaninfo ser = new Serviceplaninfo();
		List<Serviceplaninfo> list = baseDao.find("from Serviceplaninfo bi where bi.sid=?", sid);
		//保存活动历史记录
		if (list.size() > 0)
		{
			Serviceplanhistory shis = new Serviceplanhistory();
			shis.setSnumber(list.get(0).getSnumber());
			shis.setSname(list.get(0).getSname());
			shis.setSgender(list.get(0).getSgender());
			shis.setSage(list.get(0).getSage());
			shis.setSdate(list.get(0).getSdate());
			shis.setSproject1(list.get(0).getSproject1());
			shis.setSproject2(list.get(0).getSproject2());
			shis.setSproject3(list.get(0).getSproject3());
			shis.setSproject4(list.get(0).getSproject4());
			shis.setSproject5(list.get(0).getSproject5());
			shis.setSproject6(list.get(0).getSproject6());
			shis.setSproject7(list.get(0).getSproject7());
			shis.setSproject8(list.get(0).getSproject8());
			shis.setSother(list.get(0).getSother());
			shis.setSpeople(list.get(0).getSpeople());
			shis.setStatus(list.get(0).getStatus());
			shis.setSbelongpro(list.get(0).getSbelongpro());
			s1.save(shis);
			tx1.commit();
			s1.close();
		}
		Transaction tx2 = s2.beginTransaction();
	    tx2.begin();
		{
			try
			{
				ser.setSid(sid);
				ser.setSnumber(snumber);
				ser.setSname(sname);
				ser.setSgender(sgender);
				ser.setSage(sage);
				ser.setSdate(sdate);
				ser.setSproject1(sproject1);
				ser.setSproject2(sproject2);
				ser.setSproject3(sproject3);
				ser.setSproject4(sproject4);
				ser.setSproject5(sproject5);
				ser.setSproject6(sproject6);
				ser.setSproject7(sproject7);
				ser.setSproject8(sproject8);
				ser.setSother(sother);
				ser.setSpeople(speople);
				ser.setStatus(status);
				ser.setSbelongpro(sbelongpro);
				//baseDao.update(act);
				s2.update(ser);
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
	
	public boolean deleSerchoose(String sid) throws Exception {
		List<Serviceplaninfo> serList = null;
		try {
			serList = new ArrayList<Serviceplaninfo>();
			serList = baseDao.find("from Serviceplaninfo ps where sid=?", sid);
			if (serList != null && serList.size() > 0) {
				baseDao.delete(serList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public QueryResult<Serviceplanhistory> getQuerySerHistoryResult(
			Integer index, Integer maxresult, String sdate, String sname, String speople,
			String sessionID) throws ParseException {
		String whererjpql = "o.sid in (select min(a.sid) from Serviceplanhistory as a group by a.snumber)";
		List<Object> lst = new ArrayList<Object>();
		if(sdate != null && !sdate.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.sdate <= ?";
	         lst.add(sdate);
		}
		if (sname != null && !sname.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.sname like '%"
	                 + sname + "%'";
	     }
		if (speople != null && !speople.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.speople like '%"
	                 + speople + "%'";
	     }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("sdate", "DESC");
	     return this.commondao.getScrollData(Serviceplanhistory.class, "sid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	public List<Serviceplanhistory> lookServiceplanhis(String snumber)
			throws Exception {
		List<Serviceplanhistory> serhisList = null;
		try {
			serhisList = new ArrayList<Serviceplanhistory>();
			serhisList = baseDao.find("from Serviceplanhistory ta where ta.snumber=?", snumber);
			if (serhisList.size() > 0) {
				return serhisList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
