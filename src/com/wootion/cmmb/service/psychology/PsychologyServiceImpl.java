package com.wootion.cmmb.service.psychology;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.wootion.cimp.idao.BaseDao;
import com.wootion.cimp.vo.data.Project;
import com.wootion.cmmb.persistenc.po.bean.Activityinfo;
import com.wootion.cmmb.persistenc.po.bean.activityhistory;
import com.wootion.cmmb.persistenc.po.bean.psychologyhistory;
import com.wootion.cmmb.persistenc.po.bean.psychologyinfo;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.CommonDao;

public class PsychologyServiceImpl implements PsychologyService {
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
	
	public QueryResult<psychologyinfo> getQueryActResult(Integer index,
			Integer maxresult, String pdate, String pwrite,
			String sessionID) throws ParseException {
		String whererjpql = "o.pid in (select max(s.pid) from psychologyinfo as s group by s.pdate)";
		List<Object> lst = new ArrayList<Object>();
		if(pdate != null && !pdate.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.pdate >= ?";
	         lst.add(pdate);
		}
		if (pwrite != null && !pwrite.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.pwrite like '%"
	                 + pwrite + "%'";
	     }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
	     map.put("pstarttime", "DESC");
	     return this.commondao.getScrollData(psychologyinfo.class, "pid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	public void savePsychology(psychologyinfo pinfos) {
		// TODO Auto-generated method stub
		baseDao.save(pinfos);
	}
	public boolean delepsychology(String pnumber) throws Exception {
		List<psychologyinfo> psyList = null;
		try {
			psyList = new ArrayList<psychologyinfo>();
			psyList = baseDao.find("from psychologyinfo ps where ps.pnumber=?", pnumber);
			if (psyList != null && psyList.size() > 0) {
				for (int i=0; i<psyList.size(); i++)
				{
					baseDao.delete(psyList.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public List<psychologyinfo> lookPsychology(String pnumber) throws Exception {
		List<psychologyinfo> psyList = null;
		try {
			psyList = new ArrayList<psychologyinfo>();
			psyList = baseDao.find("from psychologyinfo py where py.pnumber=?", pnumber);
			if (psyList.size() > 0) {
				return psyList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public String modifypsy(String pid, String pnumber, String pdate, String pstarttime,
			String pendtime, String pattend, String pinfo, String pwrite, String pbelongpro)
			throws ParseException {
		SessionFactory factory = baseDao.getFactory();
        Session s1 = factory.openSession();
        Session s2 = factory.openSession();
        Transaction tx1 = s1.beginTransaction();
        tx1.begin();
        psychologyinfo psy = new psychologyinfo();
		List<psychologyinfo> list = baseDao.find("from psychologyinfo ai where ai.pid=?", pid);
		//保存活动历史记录
		if (list.size() > 0)
		{
			psychologyhistory phis = new psychologyhistory();
			phis.setPnumber(list.get(0).getPnumber());
			phis.setPdate(list.get(0).getPdate());
			phis.setPstarttime(list.get(0).getPstarttime());
			phis.setPendtime(list.get(0).getPendtime());
			phis.setPattend(list.get(0).getPattend());
			phis.setPinfo(list.get(0).getPinfo());
			phis.setPwrite(list.get(0).getPwrite());
			phis.setPbelongpro(list.get(0).getPbelongpro());
			
			s1.save(phis);
			tx1.commit();
			s1.close();
		}
		Transaction tx2 = s2.beginTransaction();
	    tx2.begin();
		{
			try
			{
				psy.setPid(pid);
				psy.setPnumber(pnumber);
				psy.setPdate(pdate);
				psy.setPstarttime(pstarttime);
				psy.setPendtime(pendtime);
				psy.setPattend(pattend);
				psy.setPinfo(pinfo);
				psy.setPwrite(pwrite);
				psy.setPbelongpro(pbelongpro);
				//baseDao.update(act);
				s2.update(psy);
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
	
	public QueryResult<Project> getQueryProResult(Integer index,
			Integer maxresult, String prostartdate, String proenddate,
			String proname, String proidentity, String sessionID)
			throws ParseException {
		String whererjpql = " 1=1 ";
	     List<Object> lst = new ArrayList<Object>();
	     if (prostartdate != null && !prostartdate.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.prostartdate <= ?";
	         lst.add(prostartdate);
	     }
	     if (proenddate != null && !proenddate.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.proenddate >= ?";
	         lst.add(proenddate);
	     }
	     if (proname != null && !proname.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.proname = ?";
	         lst.add(proname);
	     }
	     if (proidentity != null && !proidentity.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.proidentity = ?";
	         lst.add(proidentity);
	     }
	     
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("prostartdate", "DESC");

	     return this.commondao.getScrollData(Project.class, "proid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	
	public boolean delepsychoose(String pid) throws Exception {
		List<psychologyinfo> psyList = null;
		try {
			psyList = new ArrayList<psychologyinfo>();
			psyList = baseDao.find("from psychologyinfo ps where pid=?", pid);
			if (psyList != null && psyList.size() > 0) {
				baseDao.delete(psyList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public QueryResult<psychologyhistory> getQueryPsyHistoryResult(
			Integer index, Integer maxresult, String pdate, String pwrite,
			String sessionID) throws ParseException {
		String whererjpql = "o.pid in (select max(s.pid) from psychologyhistory as s group by s.pdate)";
		List<Object> lst = new ArrayList<Object>();
		if(pdate != null && !pdate.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.pdate <= ?";
	         lst.add(pdate);
		}
		if (pwrite != null && !pwrite.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.pwrite like '%"
	                 + pwrite + "%'";
	     }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
	     map.put("pstarttime", "DESC");
	     return this.commondao.getScrollData(psychologyhistory.class, "pid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	
	public List<psychologyhistory> lookPsychologyhis(String pnumber)
			throws Exception {
		List<psychologyhistory> psyhisList = null;
		try {
			psyhisList = new ArrayList<psychologyhistory>();
			psyhisList = baseDao.find("from psychologyhistory py where py.pnumber=?", pnumber);
			if (psyhisList.size() > 0) {
				return psyhisList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
