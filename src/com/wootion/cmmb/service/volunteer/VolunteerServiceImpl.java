package com.wootion.cmmb.service.volunteer;


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
import com.wootion.cmmb.persistenc.po.bean.Volunteerhistory;
import com.wootion.cmmb.persistenc.po.bean.Volunteerinfo;
import com.wootion.cmmb.persistenc.po.bean.activityhistory;
import com.wootion.cmmb.persistenc.po.bean.psychologyinfo;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.CommonDao;

public class VolunteerServiceImpl implements VolunteerService
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
	
	public void saveVolunteer(Volunteerinfo vinfos)
	{
		baseDao.save(vinfos);
	}
	public QueryResult<Volunteerinfo> getQueryVolResult(Integer index,
            Integer maxresult, String vname, String vcallno,String vtime,String vgender,
            String sessionID) throws ParseException {
		String whererjpql = "1 = 1";
		List<Object> lst = new ArrayList<Object>();
		if (vname != null && !vname.trim().equals(""))
	    {
	         whererjpql = whererjpql + " and o.vname like '%"
	                 + vname + "%'";
	    }
		if (vcallno != null && !vcallno.trim().equals(""))
	    {
	         whererjpql = whererjpql + " and o.vcallno like '%"
	                 + vcallno + "%'";
	    }
		if (vtime != null && !vtime.trim().equals(""))
	    {
	         whererjpql = whererjpql + " and o.vtrain > '"
	                 + vtime + "'";
	    }
		if (vgender != null && !vgender.trim().equals(""))
	    {
	         whererjpql = whererjpql + " and o.vgender = '"
	                 + vgender + "'";
	    }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("vtime", "DESC");
	     return this.commondao.getScrollData(Volunteerinfo.class, "vid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	public boolean deleVolunteerinfo(String vnumber) throws Exception {
		List<Volunteerinfo> volList = null;
		try {
			volList = new ArrayList<Volunteerinfo>();
			volList = baseDao.find("from Volunteerinfo ac where ac.vnumber=?", vnumber);
			
			if (volList != null && volList.size() > 0) {
				for (int i=0; i<volList.size(); i++)
				{
					baseDao.delete(volList.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public String modifyvol(String vid, String vnumber, String vtime, String vname, String vage, 
			String vgender, String vphone, String vspecialty, String vcommunitywork, String vstudy,
			String vintention, String vtrain,String vcallno,String vbirthday,String vpriority,String vservewill ) throws ParseException {
		SessionFactory factory = baseDao.getFactory();
        Session s1 = factory.openSession();
        Session s2 = factory.openSession();
        Transaction tx1 = s1.beginTransaction();
        tx1.begin();
        Volunteerinfo vol = new Volunteerinfo();
		List<Volunteerinfo> list = baseDao.find("from Volunteerinfo ai where ai.vid=?", vid);
		//保存活动历史记录
		if (list.size() > 0)
		{
			Volunteerhistory vhis = new Volunteerhistory();
			vhis.setVnumber(list.get(0).getVnumber());
			vhis.setVtime(list.get(0).getVtime());
			vhis.setVname(list.get(0).getVname());
			vhis.setVage(list.get(0).getVage());
			vhis.setVgender(list.get(0).getVgender());
			vhis.setVphone(list.get(0).getVphone());
			vhis.setVspecialty(list.get(0).getVspecialty());
			vhis.setVcommunitywork(list.get(0).getVcommunitywork());
			vhis.setVstudy(list.get(0).getVstudy());
			vhis.setVintention(list.get(0).getVintention());
			vhis.setVtrain(list.get(0).getVtrain());
			
			vhis.setVcallno(list.get(0).getVcallno());
			vhis.setVbirthday(list.get(0).getVbirthday());
			vhis.setVpriority(list.get(0).getVpriority());
			vhis.setVservewill(list.get(0).getVservewill());
			
			
			s1.save(vhis);
			tx1.commit();
			s1.close();
		}
		Transaction tx2 = s2.beginTransaction();
	    tx2.begin();
		{
			try
			{
				vol.setVid(vid);
				vol.setVnumber(vnumber);
				vol.setVtime(vtime);
				vol.setVname(vname);
				vol.setVage(vage);
				vol.setVgender(vgender);
				vol.setVphone(vphone);
				vol.setVspecialty(vspecialty);
				vol.setVcommunitywork(vcommunitywork);
				vol.setVstudy(vstudy);
				vol.setVintention(vintention);
				vol.setVtrain(vtrain);
				vol.setVtotal(list.get(0).getVtotal());
				vol.setServedate(list.get(0).getServedate());
				vol.setServetime(list.get(0).getServetime());
				vol.setA5(list.get(0).getA5());
				vol.setVcallno(vcallno);
				vol.setVbirthday(vbirthday);
				vol.setVpriority(vpriority);
				vol.setVservewill(vservewill);
				//baseDao.update(act);
				s2.update(vol);
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
	
	public Volunteerinfo lookVolunteer(String vid) throws Exception {
		List<Volunteerinfo> volList = null;
		try {
			volList = new ArrayList<Volunteerinfo>();
			volList = baseDao.find("from Volunteerinfo ta where ta.vid=?", vid);
			if (volList.size() > 0) {
				return volList.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public boolean delevolchoose(String vid) throws Exception {
		List<Volunteerinfo> volList = null;
		try {
			volList = new ArrayList<Volunteerinfo>();
			volList = baseDao.find("from Volunteerinfo ps where vid=?", vid);
			if (volList != null && volList.size() > 0) {
				baseDao.delete(volList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public QueryResult<Volunteerhistory> getQueryVolHistoryResult(Integer index,
            Integer maxresult, String vname, String vspecialty,
            String sessionID) throws ParseException {
		String whererjpql = "o.vid in (select max(a.vid) from Volunteerhistory as a group by a.vnumber)";
		List<Object> lst = new ArrayList<Object>();
		if (vname != null && !vname.trim().equals(""))
	    {
	         whererjpql = whererjpql + " and o.vname like '%"
	                 + vname + "%'";
	    }
		if (vspecialty != null && !vspecialty.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.vspecialty like '%"
	                 + vspecialty + "%'";
	     }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("vtime", "DESC");
	     return this.commondao.getScrollData(Volunteerhistory.class, "vid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	public Volunteerhistory lookVolunteerhis(String vid)
			throws Exception {
		List<Volunteerhistory> volhisList = null;
		try {
			volhisList = new ArrayList<Volunteerhistory>();
			volhisList = baseDao.find("from Volunteerhistory ta where ta.vid=?", vid);
			if (volhisList.size() > 0) {
				return volhisList.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String saveVolServTime(Volunteerinfo vol){
		try{
			baseDao.update(vol);
		    return "success";
		}catch(Exception e){
			return "error";
		}
	}
	
	public String[]  getAllBirth()throws Exception{
		String[] allbir = new String[12];
		for(int firindex=0;firindex<12;firindex++){
			allbir[firindex]="";
		}
		List<Volunteerinfo> volList = null;
		try {
			volList = new ArrayList<Volunteerinfo>();
			volList = baseDao.queryHQL("from Volunteerinfo ta order by ta.vbirthday");
			if(volList!=null&&volList.size()>0){
				for(int listindex=0;listindex<volList.size();listindex++){
					String birdate = volList.get(listindex).getVbirthday();
					int birmonth = Integer.parseInt(birdate.substring(5,7));
					if(volList.get(listindex).getVpriority().indexOf("1")!=-1){
						//如果是1星 
						allbir[birmonth-1] += "<span style=\"color: red\">"+volList.get(listindex).getVcallno()+"     "+volList.get(listindex).getVname()+"  "+volList.get(listindex).getVpriority()+"     "+volList.get(listindex).getVbirthday()+"</span><br>";
					}
					if(volList.get(listindex).getVpriority().indexOf("2")!=-1){
						//如果是2星
						allbir[birmonth-1] += "<span style=\"color: green\">"+volList.get(listindex).getVcallno()+"     "+volList.get(listindex).getVname()+"     "+volList.get(listindex).getVpriority()+"     "+volList.get(listindex).getVbirthday()+"</span><br>";
					}
					
					if(volList.get(listindex).getVpriority().indexOf("3")!=-1){
						//如果是3星
						allbir[birmonth-1] += "<span style=\"color: blue\">"+volList.get(listindex).getVcallno()+"     "+volList.get(listindex).getVname()+"     "+volList.get(listindex).getVpriority()+"     "+volList.get(listindex).getVbirthday()+"</span><br>";
					}
				}
					
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return allbir;
	}
}
