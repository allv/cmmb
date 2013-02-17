package com.wootion.cmmb.service.activity;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.wootion.cimp.idao.BaseDao;
import com.wootion.cmmb.persistenc.po.bean.Activityinfo;
import com.wootion.cmmb.persistenc.po.bean.activityhistory;
import com.wootion.cmmb.persistenc.po.bean.sensoryhistory;
import com.wootion.cmmb.persistenc.po.bean.sensoryinfo;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.CommonDao;

public class SensoryServiceImpl implements SensoryService {
	private BaseDao baseDao;
	private CommonDao commondao;
	public BaseDao getBaseDao() {
		return baseDao;
	}
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	public CommonDao getCommondao() {
		return commondao;
	}
	public void setCommondao(CommonDao commondao) {
		this.commondao = commondao;
	}
	
	public QueryResult<sensoryinfo> getQuerySenResult(Integer index,
			Integer maxresult, String sdate, String sattend, String swrite,
			String sessionID) throws ParseException {
		String whererjpql = "o.sid in (select max(s.sid) from sensoryinfo as s group by s.sdate)";
		List<Object> lst = new ArrayList<Object>();
		if(sdate != null && !sdate.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.sdate >= ?";
	         lst.add(sdate);
		}
		if (sattend != null && !sattend.trim().equals(""))
	    {
	        whererjpql = whererjpql + " and o.sattend like '%"
	                 + sattend + "%'";
	    }
		if (swrite != null && !swrite.trim().equals(""))
	    {
	        whererjpql = whererjpql + " and o.mrecorder like '%"
	                 + swrite + "%'";
	    }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
	     map.put("sstarttime", "DESC");
	     return this.commondao.getScrollData(sensoryinfo.class, "sid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	public void saveSenchology(sensoryinfo sinfos) {
		// TODO Auto-generated method stub
		baseDao.save(sinfos);
	}
	public boolean delesenchology(String snumber) throws Exception {
		List<sensoryinfo> senList = null;
		try {
			senList = new ArrayList<sensoryinfo>();
			senList = baseDao.find("from sensoryinfo ps where ps.snumber=?", snumber);
			if (senList != null && senList.size() > 0) {
				for (int i=0; i<senList.size(); i++)
				{
					baseDao.delete(senList.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public List<sensoryinfo> lookSenchology(String snumber) throws Exception {
		List<sensoryinfo> senList = null;
		try {
			senList = new ArrayList<sensoryinfo>();
			senList = baseDao.find("from sensoryinfo py where py.snumber=?", snumber);
			if (senList.size() > 0) {
				return senList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String modifysen(String sid, String snumber, String sdate, String sstarttime,
			String sendtime, String sattend, String sinfo, String swrite, String sbelongpro)
			throws ParseException {
		SessionFactory factory = baseDao.getFactory();
        Session s1 = factory.openSession();
        Session s2 = factory.openSession();
        Transaction tx1 = s1.beginTransaction();
        tx1.begin();
        sensoryinfo sen = new sensoryinfo();
		List<sensoryinfo> list = baseDao.find("from sensoryinfo ai where ai.sid=?", sid);
		//保存活动历史记录
		if (list.size() > 0)
		{
			sensoryhistory shis = new sensoryhistory();
			shis.setSnumber(list.get(0).getSnumber());
			shis.setSdate(list.get(0).getSdate());
			shis.setSstarttime(list.get(0).getSstarttime());
			shis.setSendtime(list.get(0).getSendtime());
			shis.setSattend(list.get(0).getSattend());
			shis.setSinfo(list.get(0).getSinfo());
			shis.setSwrite(list.get(0).getSwrite());
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
				sen.setSid(sid);
				sen.setSnumber(snumber);
				sen.setSdate(sdate);
				sen.setSstarttime(sstarttime);
				sen.setSendtime(sendtime);
				sen.setSattend(sattend);
				sen.setSinfo(sinfo);
				sen.setSwrite(swrite);
				sen.setSbelongpro(sbelongpro);
				//baseDao.update(act);
				s2.update(sen);
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
	
	public boolean delesenchoose(String sid) throws Exception {
		List<sensoryinfo> senList = null;
		try {
			senList = new ArrayList<sensoryinfo>();
			senList = baseDao.find("from sensoryinfo ps where sid=?", sid);
			if (senList != null && senList.size() > 0) {
				baseDao.delete(senList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public QueryResult<sensoryhistory> getQuerySenHistoryResult(Integer index,
			Integer maxresult, String sdate, String sattend, String swrite,
			String sessionID) throws ParseException {
		String whererjpql = "o.sid in (select max(s.sid) from sensoryhistory as s group by s.sdate)";
		List<Object> lst = new ArrayList<Object>();
		if(sdate != null && !sdate.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.sdate >= ?";
	         lst.add(sdate);
		}
		if (sattend != null && !sattend.trim().equals(""))
	    {
	        whererjpql = whererjpql + " and o.sattend like '%"
	                 + sattend + "%'";
	    }
		if (swrite != null && !swrite.trim().equals(""))
	    {
	        whererjpql = whererjpql + " and o.mrecorder like '%"
	                 + swrite + "%'";
	    }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
	     map.put("sstarttime", "DESC");
	     return this.commondao.getScrollData(sensoryhistory.class, "sid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	public List<sensoryhistory> lookSensoryhis(String snumber) throws Exception {
		List<sensoryhistory> senhisList = null;
		try {
			senhisList = new ArrayList<sensoryhistory>();
			senhisList = baseDao.find("from sensoryhistory py where py.snumber=?", snumber);
			if (senhisList.size() > 0) {
				return senhisList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
