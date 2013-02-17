package com.wootion.cmmb.service.activity;


import java.text.ParseException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.wootion.cimp.idao.BaseDao;
import com.wootion.cimp.vo.data.Member;
import com.wootion.cmmb.persistenc.po.bean.Activityinfo;
import com.wootion.cmmb.persistenc.po.bean.Instrumenthistory;
import com.wootion.cmmb.persistenc.po.bean.Instrumentinfo;
import com.wootion.cmmb.persistenc.po.bean.activityhistory;
import com.wootion.cmmb.persistenc.po.bean.psychologyinfo;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.CommonDao;

public class InstrumentServiceImpl implements InstrumentService
{
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
	
	public void saveInstrument(Instrumentinfo iinfos)
	{
		baseDao.save(iinfos);
	}
	public QueryResult<Instrumentinfo> getQueryMentResult(Integer index,
            Integer maxresult, String mdate, String mname, String mrecorder,
            String sessionID) throws ParseException {
		String whererjpql = "o.mentid in (select max(a.mentid) from Instrumentinfo as a group by a.mnumber)";
		List<Object> lst = new ArrayList<Object>();
		if(mdate != null && !mdate.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.mdate <= ?";
	         lst.add(mdate);
		}
		if (mname != null && !mname.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.mname like '%"
	                 + mname + "%'";
	     }
		if (mrecorder != null && !mrecorder.trim().equals(""))
	    {
	        whererjpql = whererjpql + " and o.mrecorder like '%"
	                 + mrecorder + "%'";
	    }
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("mdate", "DESC");
	     return this.commondao.getScrollData(Instrumentinfo.class, "mentid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	public boolean deleInstrumentinfo(String mnumber) throws Exception {
		List<Instrumentinfo> mentList = null;
		try {
			mentList = new ArrayList<Instrumentinfo>();
			mentList = baseDao.find("from Instrumentinfo ac where ac.mnumber=?", mnumber);
			
			if (mentList != null && mentList.size() > 0) {
				for (int i=0; i<mentList.size(); i++)
				{
					baseDao.delete(mentList.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public String modifyment(String mentid, String mdate, String mnumber, String mname, String mchair, 
			String mjoint, String mbelt, String mdumbbell, String mrecorder, String msupervisor, 
			String mtotaltime, String mchairchoo, String mjointchoo, String mbeltchoo, 
			String mdumbbellchoo, String mbelongpro) throws ParseException {
		SessionFactory factory = baseDao.getFactory();
        Session s1 = factory.openSession();
        Session s2 = factory.openSession();
        Transaction tx1 = s1.beginTransaction();
        tx1.begin();
        Instrumentinfo ment = new Instrumentinfo();
		List<Instrumentinfo> list = baseDao.find("from Instrumentinfo ai where ai.mentid=?", mentid);
		//保存活动历史记录
		if (list.size() > 0)
		{
			Instrumenthistory ihis = new Instrumenthistory();
			ihis.setMdate(list.get(0).getMdate());
			ihis.setMnumber(list.get(0).getMnumber());
			ihis.setMname(list.get(0).getMname());
			ihis.setMchair(list.get(0).getMchair());
			ihis.setMjoint(list.get(0).getMjoint());
			ihis.setMbelt(list.get(0).getMbelt());
			ihis.setMdumbbell(list.get(0).getMdumbbell());
			ihis.setMrecorder(list.get(0).getMrecorder());
			ihis.setMsupervisor(list.get(0).getMsupervisor());
			ihis.setMtotaltime(list.get(0).getMtotaltime());
			ihis.setMchairchoo(list.get(0).getMchairchoo());
			ihis.setMjointchoo(list.get(0).getMjointchoo());
			ihis.setMbeltchoo(list.get(0).getMbeltchoo());
			ihis.setMdumbbellchoo(list.get(0).getMdumbbellchoo());
			ihis.setMbelongpro(list.get(0).getMbelongpro());
			
			s1.save(ihis);
			tx1.commit();
			s1.close();
		}
		Transaction tx2 = s2.beginTransaction();
	    tx2.begin();
		{
			try
			{
				ment.setMentid(mentid);
				ment.setMdate(mdate);
				ment.setMnumber(mnumber);
				ment.setMname(mname);
				ment.setMchair(mchair);
				ment.setMjoint(mjoint);
				ment.setMbelt(mbelt);
				ment.setMdumbbell(mdumbbell);
				ment.setMrecorder(mrecorder);
				ment.setMsupervisor(msupervisor);
				ment.setMtotaltime(mtotaltime);
				ment.setMchairchoo(mchairchoo);
				ment.setMjointchoo(mjointchoo);
				ment.setMbeltchoo(mbeltchoo);
				ment.setMdumbbellchoo(mdumbbellchoo);
				ment.setMbelongpro(mbelongpro);
				//baseDao.update(act);
				s2.update(ment);
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
	
	public List<Instrumentinfo> lookInstrument(String mnumber) throws Exception {
		List<Instrumentinfo> mentList = null;
		try {
			mentList = new ArrayList<Instrumentinfo>();
			mentList = baseDao.find("from Instrumentinfo ta where ta.mnumber=?", mnumber);
			if (mentList.size() > 0) {
				return mentList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean delementchoose(String mentid) throws Exception {
		List<Instrumentinfo> mentList = null;
		try {
			mentList = new ArrayList<Instrumentinfo>();
			mentList = baseDao.find("from Instrumentinfo ps where mentid=?", mentid);
			if (mentList != null && mentList.size() > 0) {
				baseDao.delete(mentList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public List<Instrumenthistory> lookInstrumenthis(String mnumber)
			throws Exception {
		List<Instrumenthistory> menthisList = null;
		try {
			menthisList = new ArrayList<Instrumenthistory>();
			menthisList = baseDao.find("from Instrumenthistory ta where ta.mnumber=?", mnumber);
			if (menthisList.size() > 0) {
				return menthisList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public QueryResult<Instrumenthistory> getQueryMentHistoryResult(
			Integer index, Integer maxresult, String mdate, String mname, String mrecorder,
			String sessionID) throws ParseException {
		String whererjpql = "o.mentid in (select max(a.mentid) from Instrumenthistory as a group by a.mnumber)";
		List<Object> lst = new ArrayList<Object>();
		if(mdate != null && !mdate.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.mdate <= ?";
	         lst.add(mdate);
		}
		if (mname != null && !mname.trim().equals(""))
	    {
	        whererjpql = whererjpql + " and o.mname like '%"
	                 + mname + "%'";
	    }
		if (mrecorder != null && !mrecorder.trim().equals(""))
	    {
	        whererjpql = whererjpql + " and o.mrecorder like '%"
	                 + mrecorder + "%'";
	    }
		
	    LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	    map.put("mdate", "DESC");
	    return this.commondao.getScrollData(Instrumenthistory.class, "mentid", index,
	            maxresult, whererjpql, lst.toArray(), map);
	}
}
