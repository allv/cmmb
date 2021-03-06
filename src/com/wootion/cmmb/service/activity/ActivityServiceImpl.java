package com.wootion.cmmb.service.activity;


import java.text.ParseException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.wootion.cimp.idao.BaseDao;
import com.wootion.cimp.vo.data.workerstatistic;
import com.wootion.cmmb.persistenc.po.bean.Activityinfo;
import com.wootion.cmmb.persistenc.po.bean.activityhistory;
import com.wootion.cmmb.persistenc.po.bean.recoveryAssess;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.CommonDao;

public class ActivityServiceImpl implements ActivityService
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
	
	public void saveActivity(Activityinfo ainfos)
	{
		baseDao.save(ainfos);
	}
	
	public QueryResult<Activityinfo> getQueryActResult(Integer index,
			Integer maxresult, String atime, String aname,
			String sessionID) throws ParseException {
		String whererjpql = "o.aid in (select max(a.aid) from Activityinfo as a group by a.atime)";
		List<Object> lst = new ArrayList<Object>();
		if(atime != null && !atime.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.atime <= ?";
	         lst.add(atime);
		}
		if (aname != null && !aname.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.aname like '%"
	                 + aname + "%'";
	     }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("stime", "DESC");
	     return this.commondao.getScrollData(Activityinfo.class, "aid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	
	
	public QueryResult<recoveryAssess> getQueryRecoveryResult(Integer index,
            Integer maxresult, String assessdate, String memname, String a1,
            String sessionID)
			throws ParseException {
		String whererjpql = "1=1";
		List<Object> lst = new ArrayList<Object>();
		if(assessdate != null && !assessdate.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.assesdate <= ?";
	        lst.add(assessdate);
		}
		if (memname != null && !memname.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.memname like '%"
	                 + memname + "%'";
	     }
		
		if (a1 != null && !a1.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.a1 = '"
	                 + a1 + "'";
	     }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("assesdate", "DESC");
	     return this.commondao.getScrollData(recoveryAssess.class, "recoveryid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	
	
	
	
	private void saveAllstaData(recoveryAssess sinfos){
        try{
        	String memname = sinfos.getMemname();
        	int length = sinfos.getA303().lastIndexOf("#")-1;
        	String[] workernames = sinfos.getA303().split("#",length+1);
        	String[] workerdates = sinfos.getA296().split("#",length+1);
        	//String[] durations = sinfos.getA299().split("#",length+1);
        	//時長
        	String[] worktimes = sinfos.getA299().split("#",length+1);
        	String[] workcontents = sinfos.getA301().split("#",length+1);
        	for(int i=0;i<worktimes.length-1;i++){
        		if(workernames[i]==null||"".equals(workernames[i])){
        			workernames[i]="#";
        		}if(workerdates[i]==null||"".equals(workerdates[i])){
        			workerdates[i]="#";
        		}
        	    if(worktimes[i]==null||"".equals(worktimes[i])){
        	    	worktimes[i]="0";		
        		}
                if(memname==null||"".equals(memname)){
                	memname="#";
        		}
        		workerstatistic wdata = new workerstatistic();
        		//康复部
        		wdata.setDepartment("2");
        		wdata.setWorkcontent(workcontents[i]);
        		wdata.setWorkdate(workerdates[i]);
        		wdata.setWorkername(workernames[i]);
        		wdata.setWorktime(Integer.parseInt(worktimes[i]));
        		wdata.setDuration("");
        		wdata.setMembername(memname);
        		wdata.setCarenumber(sinfos.getRecoverynumber());
        		wdata.setLinenumber(i);
        		//未经确认
        		wdata.setA1("0");
        		wdata.setA2("0");
        		//保存護理服務表數據到統計表中
        		baseDao.save(wdata);
        	}
        	
        }catch(Exception ee){
        	ee.printStackTrace();
        }	
	}
	
	public String saveRecoveryAssessment(recoveryAssess sinfos) {
		try{
			//康复评估 没有关联会员信息,直接保存
			saveAllstaData(sinfos);
			baseDao.save(sinfos);
			return "success";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return "error";
		}
	}
	
	public recoveryAssess lookRecovery(String rid)throws Exception{
		List<recoveryAssess> recoveryList = null;
		try {
			recoveryList = new ArrayList<recoveryAssess>();
			recoveryList = baseDao.find("from recoveryAssess ta where ta.recoveryid=?", rid);
			if (recoveryList.size() > 0) {
				return recoveryList.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String deleRecovery(String rid)throws Exception{
		List<recoveryAssess> careList = null;
		try {
			careList = new ArrayList<recoveryAssess>();
			careList = baseDao.find("from recoveryAssess ps where recoveryid=?", rid);
			if (careList != null && careList.size() > 0) {
				baseDao.delete(careList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "success";
	}
	
	public String modifyRecoveryAssessment(recoveryAssess sinfos)throws Exception{
		try{
			   //filter and insert all data needed to be counted to workerstatistic 
			    updateAllstaData(sinfos);
				baseDao.update(sinfos);
			} catch (Exception e) {
				e.printStackTrace();
				return "error";
			}
    	return "success";
	}
	
	private void updateAllstaData(recoveryAssess cs){
		List<workerstatistic> serList = null;
		try{
			serList = new ArrayList<workerstatistic>();
			serList = baseDao.find("from workerstatistic ac where ac.carenumber=?", cs.getRecoverynumber());
			//有新增行 更新已有行 新增多出來的行
			if(serList.size()<=cs.getA303().split("#",300).length-1){
				for(int i=0;i<serList.size();i++){
					updateSingleRecord(cs,serList.get(i),serList.get(i).getLinenumber());
				}
				//保存新增值
				for(int j=serList.size();j<cs.getA303().split("#",300).length-1;j++){
					workerstatistic newinstance = new workerstatistic();
					saveSingleRecord(cs,newinstance,j);
				}
			}
			
			//有刪減行 更新已有行 刪除多余行
			if(serList.size()>cs.getA303().split("#",300).length-1){
				for(int i=0;i<cs.getA303().split("#",300).length;i++){
					updateSingleRecord(cs,serList.get(i),serList.get(i).getLinenumber());
				}
				//刪除多余行
				for(int j=cs.getA303().split("#",300).length-1;j<serList.size();j++){
					deleteSingleRecord(serList.get(j));
				}
			}
		}catch(Exception ee){}
	}
	
	private void deleteSingleRecord(workerstatistic wdata){
		baseDao.delete(wdata);
	}
	
	private void saveSingleRecord(recoveryAssess sinfos,workerstatistic wdata,int i){
		try{String memname = sinfos.getMemname();
		int len = sinfos.getA303().lastIndexOf("#")-1;
    	String[] workernames = sinfos.getA303().split("#",len+1);
    	String[] workerdates = sinfos.getA296().split("#",len+1);
    	//String[] durations = sinfos.getA86().split("#",len+1);
    	//時長
    	String[] worktimes = sinfos.getA299().split("#",len+1);
    	String[] workcontents = sinfos.getA301().split("#",len+1);
    		if(workernames[i]==null||"".equals(workernames[i])){
    			workernames[i]="#";
    		}if(workerdates[i]==null||"".equals(workerdates[i])){
    			workerdates[i]="#";
    		}
    	    if(worktimes[i]==null||"".equals(worktimes[i])){
    	    	worktimes[i]="0";		
    		}
            if(memname==null||"".equals(memname)){
            	memname="#";
    		}
    		//康复部
    		wdata.setDepartment("2");
    		wdata.setWorkcontent(workcontents[i]);
    		wdata.setWorkdate(workerdates[i]);
    		wdata.setWorkername(workernames[i]);
    		wdata.setWorktime(Integer.parseInt(worktimes[i]));
    		wdata.setDuration("");
    		wdata.setMembername(memname);
    		wdata.setCarenumber(sinfos.getRecoverynumber());
    		wdata.setLinenumber(i);
    		wdata.setA1("0");
    		wdata.setA2("0");
    		//保存護理服務表數據到統計表中
    		baseDao.save(wdata);
    	
    }catch(Exception ee){}	
	}
	
	private void updateSingleRecord(recoveryAssess sinfos,workerstatistic wdata,int i){
			try{String memname = sinfos.getMemname();
			int len = sinfos.getA303().lastIndexOf("#")-1;
	    	String[] workernames = sinfos.getA303().split("#",len+1);
	    	String[] workerdates = sinfos.getA296().split("#",len+1);
	    	//String[] durations = sinfos.getA86().split("#",len+1);
	    	//時長
	    	String[] worktimes = sinfos.getA299().split("#",len+1);
	    	String[] workcontents = sinfos.getA301().split("#",len+1);
	    		if(workernames[i]==null||"".equals(workernames[i])){
	    			workernames[i]="#";
	    		}if(workerdates[i]==null||"".equals(workerdates[i])){
	    			workerdates[i]="#";
	    		}
	    	    if(worktimes[i]==null||"".equals(worktimes[i])){
	    	    	worktimes[i]="0";		
	    		}
	            if(memname==null||"".equals(memname)){
	            	memname="#";
	    		}
	    		//康复部
	    		wdata.setDepartment("2");
	    		wdata.setWorkcontent(workcontents[i]);
	    		wdata.setWorkdate(workerdates[i]);
	    		wdata.setWorkername(workernames[i]);
	    		wdata.setWorktime(Integer.parseInt(worktimes[i]));
	    		wdata.setDuration("");
	    		wdata.setMembername(memname);
	    		wdata.setCarenumber(sinfos.getRecoverynumber());
	    		wdata.setLinenumber(i);
	    		wdata.setA1(wdata.getA1());
	    		wdata.setA2(wdata.getA2());
	    		//保存護理服務表數據到統計表中
	    		baseDao.update(wdata);
	    	
	    }catch(Exception ee){}	
	}
	
	public boolean deleActivityinfo(String anumber) throws Exception {
		List<Activityinfo> actList = null;
		try {
			actList = new ArrayList<Activityinfo>();
			actList = baseDao.find("from Activityinfo ac where ac.anumber=?", anumber);
			
			if (actList != null && actList.size() > 0) {
				for (int i=0; i<actList.size(); i++)
				{
					baseDao.delete(actList.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public String modifyact(String aid, String anumber, String atime, String aname, String apeoplenum, 
			String stime, String aplace, String ainfo, String abelongpro) throws ParseException {
		SessionFactory factory = baseDao.getFactory();
        Session s1 = factory.openSession();
        Session s2 = factory.openSession();
        Transaction tx1 = s1.beginTransaction();
        tx1.begin();
		Activityinfo act = new Activityinfo();
		List<Activityinfo> list = baseDao.find("from Activityinfo ai where ai.aid=?", aid);
		//保存活动历史记录
		if (list.size() > 0)
		{
			activityhistory ahis = new activityhistory();
			ahis.setAnumber(list.get(0).getAnumber());
			ahis.setAtime(atime);
			ahis.setAname(list.get(0).getAname());
			ahis.setApeoplenum(list.get(0).getApeoplenum());
			ahis.setStime(list.get(0).getStime());
			ahis.setAplace(list.get(0).getAplace());
			ahis.setAinfo(list.get(0).getAinfo());
			ahis.setAbelongpro(list.get(0).getAbelongpro());
			
			s1.save(ahis);
			tx1.commit();
			s1.close();
		}
		Transaction tx2 = s2.beginTransaction();
	    tx2.begin();
		{
			try
			{
				act.setAid(aid);
				act.setAnumber(anumber);
				act.setAtime(atime);
				act.setAname(aname);
				act.setApeoplenum(apeoplenum);
				act.setStime(stime);
				act.setAplace(aplace);
				act.setAinfo(ainfo);
				act.setAbelongpro(abelongpro);
				//baseDao.update(act);
				s2.update(act);
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
	
	public List<Activityinfo> lookActivity(String anumber) throws Exception {
		List<Activityinfo> actList = null;
		try {
			actList = new ArrayList<Activityinfo>();
			actList = baseDao.find("from Activityinfo ta where ta.anumber=?", anumber);
			if (actList.size() > 0) {
				return actList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public boolean deleactchoose(String aid) throws Exception {
		List<Activityinfo> actList = null;
		try {
			actList = new ArrayList<Activityinfo>();
			actList = baseDao.find("from Activityinfo ps where aid=?", aid);
			if (actList != null && actList.size() > 0) {
				baseDao.delete(actList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public QueryResult<activityhistory> getQueryActHistoryResult(Integer index,
			Integer maxresult, String atime, String aname, String sessionID)
			throws ParseException {
		String whererjpql = "o.aid in (select max(a.aid) from activityhistory as a group by a.atime)";
		List<Object> lst = new ArrayList<Object>();
		if(atime != null && !atime.trim().equals(""))
		{
			whererjpql = whererjpql + " and o.atime <= ?";
	         lst.add(atime);
		}
		if (aname != null && !aname.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.aname like '%"
	                 + aname + "%'";
	     }
		
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("stime", "DESC");
	     return this.commondao.getScrollData(activityhistory.class, "aid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	public List<activityhistory> lookActivityhis(String anumber)
			throws Exception {
		List<activityhistory> acthisList = null;
		try {
			acthisList = new ArrayList<activityhistory>();
			acthisList = baseDao.find("from activityhistory ta where ta.anumber=?", anumber);
			if (acthisList.size() > 0) {
				return acthisList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
