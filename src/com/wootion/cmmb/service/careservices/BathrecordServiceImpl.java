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
import com.wootion.cmmb.persistenc.po.bean.activityhistory;
import com.wootion.cmmb.persistenc.po.bean.bathrecordhistory;
import com.wootion.cmmb.persistenc.po.bean.bathrecordinfo;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.CommonDao;

public class BathrecordServiceImpl implements BathrecordService{

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
	
	public void saveBathrecord(bathrecordinfo binfos) {
		baseDao.save(binfos);
	}
	
	public QueryResult<bathrecordinfo> getQueryActResult(Integer index,
			Integer maxresult, String cdate, String cname, String cpeople, String sessionID)
			throws ParseException {
		String whererjpql = "o.cid in (select max(a.cid) from bathrecordinfo as a group by a.cdate)";
		List<Object> lst = new ArrayList<Object>();
		if(cdate != null && !cdate.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.cdate <= ?";
	         lst.add(cdate);
		}
		if (cname != null && !cname.trim().equals(""))
	    {
	        whererjpql = whererjpql + " and o.cname like '%"
	                + cname + "%'";
	    }
		
		if (cpeople != null && !cpeople.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.cpeople like '%"
	                 + cpeople + "%'";
	     }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("cdate", "DESC");
	     return this.commondao.getScrollData(bathrecordinfo.class, "cid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	
	public List<bathrecordinfo> lookBathrecord(String cdate) throws Exception {
		List<bathrecordinfo> batList = null;
		try {
			batList = new ArrayList<bathrecordinfo>();
			batList = baseDao.find("from bathrecordinfo ta where ta.cdate=?", cdate);
			if (batList.size() > 0) {
				return batList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public String modifybat(String cid, String cdate, String cnumber,
			String cname, String clevel, String cstarttime, String cendtime,
			String cpeople, String cinfo, String cbelongpro)
			throws ParseException {
		SessionFactory factory = baseDao.getFactory();
        Session s1 = factory.openSession();
        Session s2 = factory.openSession();
        Transaction tx1 = s1.beginTransaction();
        tx1.begin();
        bathrecordinfo bat = new bathrecordinfo();
		List<bathrecordinfo> list = baseDao.find("from bathrecordinfo bi where bi.cid=?", cid);
		//保存活动历史记录
		if (list.size() > 0)
		{
			bathrecordhistory bhis = new bathrecordhistory();
			bhis.setCdate(list.get(0).getCdate());
			bhis.setCnumber(list.get(0).getCnumber());
			bhis.setCname(list.get(0).getCname());
			bhis.setClevel(list.get(0).getClevel());
			bhis.setCstarttime(list.get(0).getCstarttime());
			bhis.setCendtime(list.get(0).getCendtime());
			bhis.setCpeople(list.get(0).getCpeople());
			bhis.setCinfo(list.get(0).getCinfo());
			bhis.setCbelongpro(list.get(0).getCbelongpro());
			s1.save(bhis);
			tx1.commit();
			s1.close();
		}
		Transaction tx2 = s2.beginTransaction();
	    tx2.begin();
		{
			try
			{
				bat.setCid(cid);
				bat.setCdate(cdate);
				bat.setCnumber(cnumber);
				bat.setCname(cname);
				bat.setClevel(clevel);
				bat.setCstarttime(cstarttime);
				bat.setCendtime(cendtime);
				bat.setCpeople(cpeople);
				bat.setCinfo(cinfo);
				bat.setCbelongpro(cbelongpro);
				//baseDao.update(act);
				s2.update(bat);
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
	public boolean deleBathrecordinfo(String cdate) throws Exception {
		List<bathrecordinfo> batList = null;
		try {
			batList = new ArrayList<bathrecordinfo>();
			batList = baseDao.find("from bathrecordinfo ac where ac.cdate=?", cdate);
			
			if (batList != null && batList.size() > 0) {
				for (int i=0; i<batList.size(); i++)
				{
					baseDao.delete(batList.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean delebatchoose(String cid) throws Exception {
		List<bathrecordinfo> batList = null;
		try {
			batList = new ArrayList<bathrecordinfo>();
			batList = baseDao.find("from bathrecordinfo ps where cid=?", cid);
			if (batList != null && batList.size() > 0) {
				baseDao.delete(batList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public QueryResult<bathrecordhistory> getQueryActHistoryResult(
			Integer index, Integer maxresult, String cdate, String cname, String cpeople,
			String sessionID) throws ParseException {
		String whererjpql = "o.cid in (select max(a.cid) from bathrecordhistory as a group by a.cdate)";
		List<Object> lst = new ArrayList<Object>();
		if(cdate != null && !cdate.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.cdate <= ?";
	         lst.add(cdate);
		}
		if (cname != null && !cname.trim().equals(""))
	    {
	        whererjpql = whererjpql + " and o.cname like '%"
	                 + cname + "%'";
	    }
		if (cpeople != null && !cpeople.trim().equals(""))
	    {
	        whererjpql = whererjpql + " and o.cpeople like '%"
	                 + cpeople + "%'";
	    }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("cdate", "DESC");
	     return this.commondao.getScrollData(bathrecordhistory.class, "cid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	public List<bathrecordhistory> lookBathrecordhis(String cdate)
			throws Exception {
		List<bathrecordhistory> bathisList = null;
		try {
			bathisList = new ArrayList<bathrecordhistory>();
			bathisList = baseDao.find("from bathrecordhistory ta where ta.cdate=?", cdate);
			if (bathisList.size() > 0) {
				return bathisList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
