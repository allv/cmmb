package com.wootion.cmmb.service.management;


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
import com.wootion.cmmb.persistenc.po.bean.Managementhistory;
import com.wootion.cmmb.persistenc.po.bean.Managementinfo;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.CommonDao;

public class ManagementServiceImpl implements ManagementService
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
	
	public void saveManagement(Managementinfo minfos)
	{
		baseDao.save(minfos);
	}
	public QueryResult<Managementinfo> getQueryManResult(Integer index,
            Integer maxresult, String mstarttime, String morganizer, String mserialnum,
            String sessionID) throws ParseException {
		String whererjpql = "1 = 1";
		List<Object> lst = new ArrayList<Object>();
		if(mstarttime != null && !mstarttime.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.mstarttime <= ?";
	         lst.add(mstarttime);
		}
		if (morganizer != null && !morganizer.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.morganizer like '%"
	                 + morganizer + "%'";
	     }
		if (mserialnum != null && !mserialnum.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.mserialnum like '%"
	                 + mserialnum + "%'";
	     }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("mstarttime", "DESC");
	     return this.commondao.getScrollData(Managementinfo.class, "mid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	
	public String modifyman(String mid, String mstarttime, String mendtime, String mnumber, String mplace, 
			String morganizer, String mserialnum, String minfo, String mbelongpro, String mimageurl) throws ParseException {
		SessionFactory factory = baseDao.getFactory();
        Session s1 = factory.openSession();
        Session s2 = factory.openSession();
        Transaction tx1 = s1.beginTransaction();
        tx1.begin();
        Managementinfo man = new Managementinfo();
		List<Managementinfo> list = baseDao.find("from Managementinfo ai where ai.mid=?", mid);
		//保存活动历史记录
		if (list.size() > 0)
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
			String mmodifytime = sdf.format(new Date());
			Managementhistory mhis = new Managementhistory();
			mhis.setMmodifytime(mmodifytime);
			mhis.setMstarttime(list.get(0).getMstarttime());
			mhis.setMendtime(list.get(0).getMendtime());
			mhis.setMnumber(list.get(0).getMnumber());
			mhis.setMplace(list.get(0).getMplace());
			mhis.setMorganizer(list.get(0).getMorganizer());
			mhis.setMserialnum(list.get(0).getMserialnum());
			mhis.setMinfo(list.get(0).getMinfo());
			mhis.setMbelongpro(list.get(0).getMbelongpro());
			mhis.setMimageurl(list.get(0).getMimageurl());
			s1.save(mhis);
			tx1.commit();
			s1.close();
		}
		Transaction tx2 = s2.beginTransaction();
	    tx2.begin();
		{
			try
			{
				man.setMid(mid);
				man.setMstarttime(mstarttime);
				man.setMendtime(mendtime);
				man.setMnumber(mnumber);
				man.setMplace(mplace);
				man.setMorganizer(morganizer);
				man.setMserialnum(mserialnum);
				man.setMinfo(minfo);
				man.setMbelongpro(mbelongpro);
				man.setMimageurl(mimageurl);
				//baseDao.update(act);
				s2.update(man);
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
	
	public Managementinfo lookManagement(String mid) throws Exception {
		List<Managementinfo> manList = null;
		try {
			manList = new ArrayList<Managementinfo>();
			manList = baseDao.find("from Managementinfo tp where tp.mid=?", mid);
			if (manList.size() > 0) {
				return manList.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean delemanchoose(String mid) throws Exception {
		List<Managementinfo> manList = null;
		try {
			manList = new ArrayList<Managementinfo>();
			manList = baseDao.find("from Managementinfo ps where mid=?", mid);
			if (manList != null && manList.size() > 0) {
				baseDao.delete(manList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public QueryResult<Managementhistory> getQueryManHistoryResult(Integer index,
            Integer maxresult, String mstarttime, String morganizer, String mserialnum,
            String sessionID)
			throws ParseException {
		String whererjpql = "1 = 1";
		List<Object> lst = new ArrayList<Object>();
		if(mstarttime != null && !mstarttime.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.mstarttime <= ?";
	         lst.add(mstarttime);
		}
		if (morganizer != null && !morganizer.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.morganizer like '%"
	                 + morganizer + "%'";
	     }
		if (mserialnum != null && !mserialnum.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.mserialnum like '%"
	                 + mserialnum + "%'";
	     }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("mstarttime", "DESC");
	     return this.commondao.getScrollData(Managementhistory.class, "mid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	
	public Managementhistory lookManagementhis(String mid)
			throws Exception {
		List<Managementhistory> manhisList = null;
		try {
			manhisList = new ArrayList<Managementhistory>();
			manhisList = baseDao.find("from Managementhistory tp where tp.mid=?", mid);
			if (manhisList.size() > 0) {
				return manhisList.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
