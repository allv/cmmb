package com.wootion.cimp.services.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;


import com.wootion.cimp.idao.BaseDao;
import com.wootion.cimp.services.memberHealthService;
import com.wootion.cimp.vo.data.Member;
import com.wootion.cimp.vo.data.healtheval;
import com.wootion.cimp.vo.data.healthpsyeval;
import com.wootion.cmmb.persistenc.po.bean.CareAssess;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.CommonDao;

public class memberHealthServiceImpl implements memberHealthService {
	
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
	
	
	
	public QueryResult<healtheval> getQueryHealthResult(Integer index,
            Integer maxresult, String assesdate, String memname,
            String applyreason, String healthnumber,String sessionID)
			throws ParseException{
		
     String whererjpql = " 1=1 ";
     List<Object> lst = new ArrayList<Object>();
    
     if (assesdate != null && !assesdate.trim().equals(""))
     {
         whererjpql = whererjpql + " and o.assesdate <= ?";
         lst.add(assesdate);
     }
     
     if (memname != null && !memname.trim().equals(""))
     {
         whererjpql = whererjpql + " and o.memname like '%"
                 + memname + "%'";
     }
     if (applyreason != null && !applyreason.trim().equals(""))
     {
         whererjpql = whererjpql + " and o.applyreason = '"
                 + applyreason + "'";
     }
     
     if (healthnumber != null && !healthnumber.trim().equals(""))
     {
         whererjpql = whererjpql + " and o.healthnumber  like '%"
                 + healthnumber + "%'";
     }
     
     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

     map.put("assesdate", "DESC");

     return this.commondao.getScrollData(healtheval.class, "healthid", index,
             maxresult, whererjpql, lst.toArray(), map);
	}
	
    public healtheval lookHealthEval(String healthid){
    	healtheval ht = new healtheval();
		List<healtheval> healthList = null;
		healthList = new ArrayList<healtheval>();
		healthList = baseDao.find("from healtheval tt where tt.healthid=?", healthid);
		if(healthList.size()>0)
		  ht = healthList.get(0);
		return ht;
    }
	
    public healthpsyeval lookHealthPsyEval(String healthid){
    	healthpsyeval ht = new healthpsyeval();
		List<healthpsyeval> healthList = null;
		healthList = new ArrayList<healthpsyeval>();
		healthList = baseDao.find("from healthpsyeval tt where tt.healthinfoid=?", healthid);
		if(healthList.size()>0)
		  ht = healthList.get(0);
		return ht;
    }
    
	public String saveHealthEval(healtheval heal){
		try{
			Member mem = lookMember(heal.getMemnumber());
			int isCareEva = Integer.parseInt(mem.getIsHealthEva());
			mem.setIsHealthEva(String.valueOf((isCareEva+1)));
			baseDao.save(mem);
			baseDao.save(heal);
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
		return "success";
	} 
	
	public String saveHealthPsyEval(healthpsyeval heal){
		try{
			healtheval health = lookHealthEval(heal.getHealthinfoid());
			health.setA7(heal.getA21());
			
			Member mem = lookMember(heal.getMemnumber());
			int isPsyEva = Integer.parseInt(mem.getIsHealthPsyEva());
			mem.setIsHealthPsyEva(String.valueOf((isPsyEva+1)));
			baseDao.save(mem);
			baseDao.save(heal);
			baseDao.update(health);
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
		return "success";
	} 
	
	
	
	public String modifyHealthEval(healtheval heal){
		try{
			baseDao.update(heal);
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	
	public String modifyHealthPsyEval(healthpsyeval heal){
		healtheval health = lookHealthEval(heal.getHealthinfoid());
		health.setA7(heal.getA21());
		try{
			baseDao.update(heal);
			baseDao.update(health);
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	
	private Member lookMember(String meminfoid)throws Exception{
		Member mem = new Member();
		List<Member> memList = null;
		memList = new ArrayList<Member>();
		memList = baseDao.find("from Member tt where tt.memid=?", meminfoid);
		mem = memList.get(0);
		return mem;
	}
	
	public boolean deleHealth(String healthid){
		List<healtheval> healthList = null;
		healthList = new ArrayList<healtheval>();
		healthList = baseDao.find("from healtheval tt where tt.healthid=?", healthid);
		//删除附带的心理评估表
		List<healthpsyeval> healthpsyList = null;
		healthpsyList = new ArrayList<healthpsyeval>();
		healthpsyList = baseDao.find("from healthpsyeval tt where tt.healthinfoid=?", healthid);
		try{
			Member mem = lookMember(healthList.get(0).getMemnumber());
			int isHealth = Integer.parseInt(mem.getIsHealthEva());
			mem.setIsHealthEva(String.valueOf((isHealth-1)));
			baseDao.save(mem);
			baseDao.delete(healthList.get(0));
			baseDao.delete(healthpsyList.get(0));
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
