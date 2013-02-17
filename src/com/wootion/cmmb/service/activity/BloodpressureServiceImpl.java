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
import com.wootion.cmmb.persistenc.po.bean.Bloodpressurehistory;
import com.wootion.cmmb.persistenc.po.bean.Bloodpressureinfo;
import com.wootion.cmmb.persistenc.po.bean.activityhistory;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.CommonDao;

public class BloodpressureServiceImpl implements BloodpressureService{
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
	
	public QueryResult<Bloodpressureinfo> getQueryBloResult(Integer index,
			Integer maxresult, String bstarttime, String bname, String bfilenumber, String sessionID)
			throws ParseException {
		String whererjpql = "o.bid in (select max(a.bid) from Bloodpressureinfo as a group by a.bdate)";
		List<Object> lst = new ArrayList<Object>();
		if(bstarttime != null && !bstarttime.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.bstarttime <= ?";
	         lst.add(bstarttime);
		}
		if (bname != null && !bname.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.bname like '%"
	                 + bname + "%'";
	     }
		if (bfilenumber != null && !bfilenumber.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.bfilenumber like '%"
	                 + bfilenumber + "%'";
	     }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("bwritedate", "DESC");
	     return this.commondao.getScrollData(Bloodpressureinfo.class, "bid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}

	public void saveBloodpressure(Bloodpressureinfo bpinfos) {
		baseDao.save(bpinfos);
	}
	public boolean deleBloodpressureinfo(String bdate) throws Exception {
		List<Bloodpressureinfo> bloList = null;
		try {
			bloList = new ArrayList<Bloodpressureinfo>();
			bloList = baseDao.find("from Bloodpressureinfo ac where ac.bdate=?", bdate);
			
			if (bloList != null && bloList.size() > 0) {
				for (int i=0; i<bloList.size(); i++)
				{
					baseDao.delete(bloList.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean deleblochoose(String bid) throws Exception {
		List<Bloodpressureinfo> bloList = null;
		try {
			bloList = new ArrayList<Bloodpressureinfo>();
			bloList = baseDao.find("from Bloodpressureinfo ps where bid=?", bid);
			if (bloList != null && bloList.size() > 0) {
				baseDao.delete(bloList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public List<Bloodpressureinfo> lookBloodpressure(String bdate)
			throws Exception {
		List<Bloodpressureinfo> bloList = null;
		try {
			bloList = new ArrayList<Bloodpressureinfo>();
			bloList = baseDao.find("from Bloodpressureinfo ta where ta.bdate=?", bdate);
			if (bloList.size() > 0) {
				return bloList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public String modifyblo(String bid, String bdate, String bnumber,
			String bname, String bgender, String bage, String bphone,
			String bstarttime, String bdiseases, String bfilenumber,
			String binfo, String bwritedate, String bloodnum, String bpulse,
			String bbelongpro) throws ParseException {
		SessionFactory factory = baseDao.getFactory();
        Session s1 = factory.openSession();
        Session s2 = factory.openSession();
        Transaction tx1 = s1.beginTransaction();
        tx1.begin();
        Bloodpressureinfo blo = new Bloodpressureinfo();
		List<Bloodpressureinfo> list = baseDao.find("from Bloodpressureinfo ai where ai.bid=?", bid);
		//保存活动历史记录
		if (list.size() > 0)
		{
			Bloodpressurehistory bhis = new Bloodpressurehistory();
			bhis.setBnumber(list.get(0).getBnumber());
			bhis.setBdate(list.get(0).getBdate());
			bhis.setBname(list.get(0).getBname());
			bhis.setBgender(list.get(0).getBgender());
			bhis.setBage(list.get(0).getBage());
			bhis.setBphone(list.get(0).getBphone());
			bhis.setBstarttime(list.get(0).getBstarttime());
			bhis.setBdiseases(list.get(0).getBdiseases());
			bhis.setBfilenumber(list.get(0).getBfilenumber());
			bhis.setBbelongpro(list.get(0).getBbelongpro());
			bhis.setBinfo(list.get(0).getBinfo());
			bhis.setBwritedate(list.get(0).getBwritedate());
			bhis.setBloodnum(list.get(0).getBloodnum());
			bhis.setBpulse(list.get(0).getBpulse());
			
			s1.save(bhis);
			tx1.commit();
			s1.close();
		}
		Transaction tx2 = s2.beginTransaction();
	    tx2.begin();
		{
			try
			{
				blo.setBid(bid);
				blo.setBnumber(bnumber);
				blo.setBdate(bdate);
				blo.setBname(bname);
				blo.setBgender(bgender);
				blo.setBage(bage);
				blo.setBphone(bphone);
				blo.setBstarttime(bstarttime);
				blo.setBdiseases(bdiseases);
				blo.setBfilenumber(bfilenumber);
				blo.setBbelongpro(bbelongpro);
				blo.setBinfo(binfo);
				blo.setBwritedate(bwritedate);
				blo.setBloodnum(bloodnum);
				blo.setBpulse(bpulse);
				//baseDao.update(act);
				s2.update(blo);
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
	public QueryResult<Bloodpressurehistory> getQueryBloHistoryResult(
			Integer index, Integer maxresult, String bstarttime, String bname, String bfilenumber,
			String sessionID) throws ParseException {
		String whererjpql = "o.bid in (select max(a.bid) from Bloodpressurehistory as a group by a.bdate)";
		List<Object> lst = new ArrayList<Object>();
		if(bstarttime != null && !bstarttime.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.bwritedate <= ?";
	         lst.add(bstarttime);
		}
		if (bname != null && !bname.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.bname like '%"
	                 + bname + "%'";
	     }
		if (bfilenumber != null && !bfilenumber.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.bfilenumber like '%"
	                 + bfilenumber + "%'";
	     }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("bwritedate", "DESC");
	     return this.commondao.getScrollData(Bloodpressurehistory.class, "bid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	public List<Bloodpressurehistory> lookBloodpressurehis(String bdate)
			throws Exception {
		List<Bloodpressurehistory> blohisList = null;
		try {
			blohisList = new ArrayList<Bloodpressurehistory>();
			blohisList = baseDao.find("from Bloodpressurehistory ta where ta.bdate=?", bdate);
			if (blohisList.size() > 0) {
				return blohisList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
