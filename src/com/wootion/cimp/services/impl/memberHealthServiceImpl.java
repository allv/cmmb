package com.wootion.cimp.services.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.poi.util.StringUtil;

import com.wootion.cimp.idao.BaseDao;
import com.wootion.cimp.services.memberHealthService;
import com.wootion.cimp.vo.data.Member;
import com.wootion.cimp.vo.data.healtheval;
import com.wootion.cimp.vo.data.healthpsyeval;
import com.wootion.cmmb.persistenc.po.bean.Activityhouse;
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
	
	public String saveActivityHouse(Activityhouse ahouse){
		try{
			baseDao.save(ahouse);
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	
	public String saveActivityCounter(Activityhouse ahouse){
		try{
			baseDao.update(ahouse);
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	
	public boolean deleActivityHouse(String ahid){
		Activityhouse activityhouse = lookActivityHouse(ahid);
		try{
			baseDao.delete(activityhouse);
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public Activityhouse lookActivityHouse(String ahouseid){
		Activityhouse ht = new Activityhouse();
		List<Activityhouse> activityhouseList = null;
		activityhouseList = new ArrayList<Activityhouse>();
		activityhouseList = baseDao.find("from Activityhouse tt where tt.ahid=?", ahouseid);
		if(activityhouseList.size()>0)
		  ht = activityhouseList.get(0);
		return ht;
	}
	
	
	public String modifyActivityHouse(Activityhouse heal){
		try{
			baseDao.update(heal);
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	
	@SuppressWarnings("unchecked")
	public String filterMemberNumbers(String adlmarks,String adlmarks2,String listen,String view,String smoke,String drink)throws Exception{
		String whererjpql = " and 1=1 ";
		//0：不吸烟不喝酒 1：吸烟不喝酒 2：喝酒不吸烟 3.吸烟又喝酒 4:不管是否吸烟喝酒 5：不管是否喝酒 过滤吸烟
		if(smoke!=null&&smoke.equals("-1")){
			if(drink!=null&&drink.equals("-1")){
				//nothing to do
			}
			if(drink!=null&&drink.equals("0")){
				 whererjpql = whererjpql + " and (a1.a138 = 'true' or a1.a139='true')";
			}
			if(drink!=null&&drink.equals("1")){
				 whererjpql = whererjpql + " and (a1.a138 = 'false' and a1.a139='false')";
			}
		}else if(smoke!=null&&smoke.equals("0")){
			if(drink!=null&&drink.equals("-1")){
				whererjpql = whererjpql + " and a1.a140 = 'true'";
			}
			if(drink!=null&&drink.equals("0")){
				whererjpql = whererjpql + " and a1.a140 = 'true' and (a1.a138 = 'true' or a1.a139='true')";
			}
			if(drink!=null&&drink.equals("1")){
				whererjpql = whererjpql + " and a1.a140 = 'true' and (a1.a138 = 'false' and a1.a139='false')";
			}
		}else if(smoke!=null&&smoke.equals("1")){
			if(drink!=null&&drink.equals("-1")){
				whererjpql = whererjpql + " and a1.a140 = 'false'";
			}
			if(drink!=null&&drink.equals("0")){
				whererjpql = whererjpql + " and a1.a140 = 'false' and (a1.a138 = 'true' or a1.a139='true')";
			}
			if(drink!=null&&drink.equals("1")){
				whererjpql = whererjpql + " and a1.a137 = 'true'";
			}
		}
		
		if(listen!=null&&!listen.equals("-1")){
		   whererjpql = whererjpql + " and a1.a8 = '"
            + listen + "'";
		}
		
		if(view!=null&&!view.equals("-1")){
			   whererjpql = whererjpql + " and a1.a11 = '"
	            + view + "'";
	    }
		
		if(adlmarks!=null&&!adlmarks.equals("")){
			   whererjpql = whererjpql + " and a1.a45 >= "
	            + adlmarks + "";
	    }
		if(adlmarks2!=null&&!adlmarks2.equals("")){
			   whererjpql = whererjpql + " and a1.a45 <= "
	            + adlmarks2 + "";
	    }
		
		StringBuffer sbsql = new StringBuffer();
		sbsql.append("select a1.* from healtheval a1 inner join  ");
		sbsql.append(" (select a.memnumber,a.assesdate from healtheval a left join healtheval b ");
		sbsql.append(" on a.memnumber=b.memnumber and a.assesdate<=b.assesdate   ");
		sbsql.append(" group by a.memnumber,a.assesdate  having count(b.assesdate)<=1)b1 ");
		sbsql.append(" on a1.memnumber=b1.memnumber and a1.assesdate=b1.assesdate ");
		sbsql.append(whererjpql);
		sbsql.append(" order by a1.memnumber,a1.assesdate desc  ");
		List<healtheval> healthevallist = (List<healtheval>)baseDao.queryNQLForHealtheval(sbsql.toString());
		//QueryResult<healtheval> healthresult= this.commondao.getScrollData(healtheval.class, "healthid", 1,
	    //         10, whererjpql, lst.toArray(), map);
		//System.out.println("end searching healthresult    "+healthresult.getTotalrecord());
		if(healthevallist.size()==0){
		    return "noresults";
		}else{
			//得到每个会员最新日期的健康评估结果
			//filterDuplicatedhealthevaL(healthevallist);
			StringBuffer sb = new StringBuffer();
			sb.append("(");
			for(int firindex=0;firindex<healthevallist.size();firindex++){
				if(firindex==healthevallist.size()-1){
					sb.append("'"+healthevallist.get(firindex).getMemnumber()+"'");
				}else{
					sb.append("'"+healthevallist.get(firindex).getMemnumber()+"'"+",");
				}
			}
			sb.append(")");
			//System.out.println("sbresult:   "+sb.toString());
			return sb.toString();
		}
	}
	
	public QueryResult<Activityhouse> getQueryActivityHouseResult(Integer index,
            Integer maxresult,  String ahnum, String ahtotalpeo,
            String ahtotalnum, String ahmanager,String sessionID)
			throws ParseException{
		
     String whererjpql = " 1=1 ";
     List<Object> lst = new ArrayList<Object>();
    
     if (ahnum != null && !ahnum.trim().equals(""))
     {
         whererjpql = whererjpql + " and o.ahnum like '%"
                 + ahnum + "%'";
     }
     
     if (ahtotalpeo != null && !ahtotalpeo.trim().equals(""))
     {
         whererjpql = whererjpql + " and o.ahtotalpeo >= "
                 + Integer.parseInt(ahtotalpeo);
     }
     if (ahtotalnum != null && !ahtotalnum.trim().equals(""))
     {
         whererjpql = whererjpql + " and o.ahtotalnum >= "
                 + Integer.parseInt(ahtotalnum);
     }
     
     if (ahmanager != null && !ahmanager.trim().equals(""))
     {
         whererjpql = whererjpql + " and o.ahmanager  like '%"
                 + ahmanager + "%'";
     }
     
     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

     return this.commondao.getScrollData(Activityhouse.class, "ahid", index,
             maxresult, whererjpql, lst.toArray(), map);
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
