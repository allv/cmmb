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
import com.wootion.cmmb.persistenc.po.bean.activityhistory;
import com.wootion.cmmb.persistenc.po.bean.bathrecordhistory;
import com.wootion.cmmb.persistenc.po.bean.bathrecordinfo;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.CommonDao;

public class OthercareservicesServiceImpl implements OthercareservicesService{

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
	
	public void saveOthercareservices(Othercareservicesinfo oinfos) {
		baseDao.save(oinfos);
	}
	
	public QueryResult<Othercareservicesinfo> getQueryCarResult(Integer index,
            Integer maxresult, String odate, String oname, String opeople,
            String sessionID)
			throws ParseException {
		String whererjpql = "o.oid in (select max(a.oid) from Othercareservicesinfo as a group by a.onumber)";
		List<Object> lst = new ArrayList<Object>();
		if(odate != null && !odate.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.odate <= ?";
	         lst.add(odate);
		}
		if (oname != null && !oname.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.oname like '%"
	                 + oname + "%'";
	     }
		if (opeople != null && !opeople.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.opeople like '%"
	                 + opeople + "%'";
	     }
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("odate", "DESC");
	     return this.commondao.getScrollData(Othercareservicesinfo.class, "oid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	
	public List<Othercareservicesinfo> lookOthercareservices(String onumber) throws Exception {
		List<Othercareservicesinfo> carList = null;
		try {
			carList = new ArrayList<Othercareservicesinfo>();
			carList = baseDao.find("from Othercareservicesinfo ta where ta.onumber=?", onumber);
			if (carList.size() > 0) {
				return carList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public String modifycar(String oid, String odate, String onumber, String oname, String ocontent, 
			String ostarttime, String oendtime, String opeople, String oevaluation, String oinfo, String obelongpro)
			throws ParseException {
		SessionFactory factory = baseDao.getFactory();
        Session s1 = factory.openSession();
        Session s2 = factory.openSession();
        Transaction tx1 = s1.beginTransaction();
        tx1.begin();
        Othercareservicesinfo car = new Othercareservicesinfo();
		List<Othercareservicesinfo> list = baseDao.find("from Othercareservicesinfo bi where bi.oid=?", oid);
		//保存活动历史记录
		if (list.size() > 0)
		{
			Othercareserviceshistory ohis = new Othercareserviceshistory();
			ohis.setOdate(list.get(0).getOdate());
			ohis.setOnumber(list.get(0).getOnumber());
			ohis.setOname(list.get(0).getOname());
			ohis.setOcontent(list.get(0).getOcontent());
			ohis.setOstarttime(list.get(0).getOstarttime());
			ohis.setOendtime(list.get(0).getOendtime());
			ohis.setOevaluation(list.get(0).getOevaluation());
			ohis.setOpeople(list.get(0).getOpeople());
			ohis.setOinfo(list.get(0).getOinfo());
			ohis.setObelongpro(list.get(0).getObelongpro());
			s1.save(ohis);
			tx1.commit();
			s1.close();
		}
		Transaction tx2 = s2.beginTransaction();
	    tx2.begin();
		{
			try
			{
				car.setOid(oid);
				car.setOdate(odate);
				car.setOnumber(onumber);
				car.setOname(oname);
				car.setOcontent(ocontent);
				car.setOstarttime(ostarttime);
				car.setOendtime(oendtime);
				car.setOpeople(opeople);
				car.setOevaluation(oevaluation);
				car.setOinfo(oinfo);
				car.setObelongpro(obelongpro);
				//baseDao.update(act);
				s2.update(car);
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
	public boolean deleOthercareservicesinfo(String onumber) throws Exception {
		List<Othercareservicesinfo> carList = null;
		try {
			carList = new ArrayList<Othercareservicesinfo>();
			carList = baseDao.find("from Othercareservicesinfo ac where ac.onumber=?", onumber);
			
			if (carList != null && carList.size() > 0) {
				for (int i=0; i<carList.size(); i++)
				{
					baseDao.delete(carList.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean delecarchoose(String oid) throws Exception {
		List<Othercareservicesinfo> carList = null;
		try {
			carList = new ArrayList<Othercareservicesinfo>();
			carList = baseDao.find("from Othercareservicesinfo ps where oid=?", oid);
			if (carList != null && carList.size() > 0) {
				baseDao.delete(carList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public QueryResult<Othercareserviceshistory> getQueryCarHistoryResult(
			Integer index, Integer maxresult, String odate, String oname, String opeople,
			String sessionID) throws ParseException {
		String whererjpql = "o.oid in (select max(a.oid) from Othercareserviceshistory as a group by a.onumber)";
		List<Object> lst = new ArrayList<Object>();
		if(odate != null && !odate.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.odate <= ?";
	         lst.add(odate);
		}
		if (oname != null && !oname.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.oname like '%"
	                 + oname + "%'";
	     }
		if (opeople != null && !opeople.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.opeople like '%"
	                 + opeople + "%'";
	     }
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("odate", "DESC");
	     return this.commondao.getScrollData(Othercareserviceshistory.class, "oid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	public List<Othercareserviceshistory> lookOthercareserviceshis(
			String onumber) throws Exception {
		List<Othercareserviceshistory> carhisList = null;
		try {
			carhisList = new ArrayList<Othercareserviceshistory>();
			carhisList = baseDao.find("from Othercareserviceshistory ta where ta.onumber=?", onumber);
			if (carhisList.size() > 0) {
				return carhisList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
