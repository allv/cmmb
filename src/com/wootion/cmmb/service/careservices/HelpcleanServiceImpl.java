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
import com.wootion.cmmb.persistenc.po.bean.Helpcleanhistory;
import com.wootion.cmmb.persistenc.po.bean.Helpcleaninfo;
import com.wootion.cmmb.persistenc.po.bean.activityhistory;
import com.wootion.cmmb.persistenc.po.bean.bathrecordhistory;
import com.wootion.cmmb.persistenc.po.bean.bathrecordinfo;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.CommonDao;

public class HelpcleanServiceImpl implements HelpcleanService{

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
	
	public void saveHelpclean(Helpcleaninfo hinfos) {
		baseDao.save(hinfos);
	}
	
	public QueryResult<Helpcleaninfo> getQueryHelResult(Integer index,
            Integer maxresult, String hdate, String hname, String hpeople,
            String sessionID)
			throws ParseException {
		String whererjpql = "o.hid in (select max(a.hid) from Helpcleaninfo as a group by a.hdate)";
		List<Object> lst = new ArrayList<Object>();
		if(hdate != null && !hdate.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.hdate <= ?";
	         lst.add(hdate);
		}
		if (hname != null && !hname.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.hname like '%"
	                 + hname + "%'";
	     }
		if (hpeople != null && !hpeople.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.hpeople like '%"
	                 + hpeople + "%'";
	     }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("hdate", "DESC");
	     return this.commondao.getScrollData(Helpcleaninfo.class, "hid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	
	public List<Helpcleaninfo> lookHelpclean(String hdate) throws Exception {
		List<Helpcleaninfo> helList = null;
		try {
			helList = new ArrayList<Helpcleaninfo>();
			helList = baseDao.find("from Helpcleaninfo ta where ta.hdate=?", hdate);
			if (helList.size() > 0) {
				return helList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public String modifyhel(String hid, String hdate, String hnumber, String hname, String hclothingnum, 
			String hrequirement, String hpeople, String hinfo, String hbelongpro)
			throws ParseException {
		SessionFactory factory = baseDao.getFactory();
        Session s1 = factory.openSession();
        Session s2 = factory.openSession();
        Transaction tx1 = s1.beginTransaction();
        tx1.begin();
        Helpcleaninfo hel = new Helpcleaninfo();
		List<Helpcleaninfo> list = baseDao.find("from Helpcleaninfo bi where bi.hid=?", hid);
		//保存活动历史记录
		if (list.size() > 0)
		{
			Helpcleanhistory hhis = new Helpcleanhistory();
			hhis.setHdate(list.get(0).getHdate());
			hhis.setHnumber(list.get(0).getHnumber());
			hhis.setHname(list.get(0).getHname());
			hhis.setHclothingnum(list.get(0).getHclothingnum());
			hhis.setHrequirement(list.get(0).getHrequirement());
			hhis.setHpeople(list.get(0).getHpeople());
			hhis.setHinfo(list.get(0).getHinfo());
			hhis.setHbelongpro(list.get(0).getHbelongpro());
			
			s1.save(hhis);
			tx1.commit();
			s1.close();
		}
		Transaction tx2 = s2.beginTransaction();
	    tx2.begin();
		{
			try
			{
				hel.setHid(hid);
				hel.setHdate(hdate);
				hel.setHnumber(hnumber);
				hel.setHname(hname);
				hel.setHclothingnum(hclothingnum);
				hel.setHrequirement(hrequirement);
				hel.setHpeople(hpeople);
				hel.setHinfo(hinfo);
				hel.setHbelongpro(hbelongpro);
				//baseDao.update(act);
				s2.update(hel);
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
	public boolean deleHelpcleaninfo(String hdate) throws Exception {
		List<Helpcleaninfo> helList = null;
		try {
			helList = new ArrayList<Helpcleaninfo>();
			helList = baseDao.find("from Helpcleaninfo ac where ac.hdate=?", hdate);
			
			if (helList != null && helList.size() > 0) {
				for (int i=0; i<helList.size(); i++)
				{
					baseDao.delete(helList.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean delehelchoose(String hid) throws Exception {
		List<Helpcleaninfo> helList = null;
		try {
			helList = new ArrayList<Helpcleaninfo>();
			helList = baseDao.find("from Helpcleaninfo ps where hid=?", hid);
			if (helList != null && helList.size() > 0) {
				baseDao.delete(helList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public QueryResult<Helpcleanhistory> getQueryHelHistoryResult(
			Integer index, Integer maxresult, String hdate, String hname, String hpeople,
			String sessionID) throws ParseException {
		String whererjpql = "o.hid in (select max(a.hid) from Helpcleanhistory as a group by a.hdate)";
		List<Object> lst = new ArrayList<Object>();
		if(hdate != null && !hdate.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.hdate <= ?";
	         lst.add(hdate);
		}
		if (hname != null && !hname.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.hname like '%"
	                 + hname + "%'";
	     }
		if (hpeople != null && !hpeople.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.hpeople like '%"
	                 + hpeople + "%'";
	     }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("hdate", "DESC");
	     return this.commondao.getScrollData(Helpcleanhistory.class, "hid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	public List<Helpcleanhistory> lookHelpcleanhis(String hdate)
			throws Exception {
		List<Helpcleanhistory> helhisList = null;
		try {
			helhisList = new ArrayList<Helpcleanhistory>();
			helhisList = baseDao.find("from Helpcleanhistory ta where ta.hdate=?", hdate);
			if (helhisList.size() > 0) {
				return helhisList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
