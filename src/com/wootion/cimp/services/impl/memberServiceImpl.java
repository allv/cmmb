package com.wootion.cimp.services.impl;

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
import com.wootion.cimp.services.memberService;
import com.wootion.cimp.vo.data.Member;
import com.wootion.cimp.vo.data.Memberhistory;
import com.wootion.cimp.vo.data.healtheval;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.CommonDao;

public class memberServiceImpl implements memberService {
	
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
	
	public QueryResult<Member> getQueryProResult(Integer index,
            Integer maxresult, String enterdate, String memname,
            String memid, String sessionID,String chooseflag)
			throws ParseException{
		
     String whererjpql = " 1=1 ";
     List<Object> lst = new ArrayList<Object>();
    
     if (enterdate != null && !enterdate.trim().equals(""))
     {
         whererjpql = whererjpql + " and o.enterdate <= ?";
         lst.add(enterdate);
     }
     
     if (memname != null && !memname.trim().equals(""))
     {
         whererjpql = whererjpql + " and o.memname like '%"
                 + memname + "%'";
     }
     if (memid != null && !memid.trim().equals(""))
     {
         whererjpql = whererjpql + " and o.memid = '"
                 + memid + "'";
     }
     if(chooseflag!=null&&chooseflag.trim().equals("careserve")){
    	 whererjpql = whererjpql + " and o.isCareEva <> '0'";
     }
     
     if(chooseflag!=null&&chooseflag.trim().equals("recoveryserve")){
    	 whererjpql = whererjpql + " and o.isRecoverEva <> '0'";
     }
     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

     map.put("enterdate", "DESC");

     return this.commondao.getScrollData(Member.class, "meminfoid", index,
             maxresult, whererjpql, lst.toArray(), map);
	}
	
	
	public QueryResult<Memberhistory> getQueryMemhisResult(Integer index,
            Integer maxresult, String submitdate, String memname,
            String memid, String sessionID)
			throws ParseException{
		
     String whererjpql = " 1=1 ";
     List<Object> lst = new ArrayList<Object>();
     if (submitdate != null && !submitdate.trim().equals(""))
     {
         whererjpql = whererjpql + " and o.submitdate <= ?";
         lst.add(submitdate);
     }
     
     if (memname != null && !memname.trim().equals(""))
     {
         whererjpql = whererjpql + " and o.memname like '%"
                 + memname + "%'";
     }
     if (memid != null && !memid.trim().equals(""))
     {
         whererjpql = whererjpql + " and o.memid = '"
                 + memid + "'";
     }
     
     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

     map.put("submitdate", "DESC");

     return this.commondao.getScrollData(Memberhistory.class, "meminfoid", index,
             maxresult, whererjpql, lst.toArray(), map);
	}
	
	public String saveMem(String memname, String memid,
            String memsex,String creditid,String birthday,String culture,String professor,String financial,String marry,String kids,String ways,String enterdate,String reside,String fees,
            String mycellnumber,String mylandlinenumber,String myaddress,String mycounty,String mystreet,String mycity,String myemail,String mynation,String coname,
            String relationship,String concellnumber,String connumber,String conaddress,String concity,String conpost,String concountry,String assessment,String asesdate)throws Exception{
		Member member = new Member();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String timestamp = sdf.format(new Date());
	    List<Member> list = baseDao.find("from Member tt where tt.memid=?", memid);
		if (list.size() > 0) {
			return "sameid";
		}else{
			try {
				member.setTimestamp(timestamp);
				member.setBirthday(birthday);
				member.setAssessment(assessment);
				member.setAsesdate(asesdate);
				member.setConaddress(conaddress);
				member.setConame(coname);
				member.setConcellnumber(concellnumber);
				member.setConcity(concity);
				member.setConcountry(concountry);
				member.setConnumber(connumber);
				member.setConpost(conpost);
				member.setCreditid(creditid);
				member.setCulture(culture);
				member.setEnterdate(enterdate);
				member.setFees(fees);
				member.setFinancial(financial);
				member.setKids(kids);
				member.setMarry(marry);
				member.setMemid(memid);
				member.setMemname(memname);
				member.setMemsex(memsex);
				member.setMyaddress(myaddress);
				member.setMycellnumber(mycellnumber);
				member.setMycity(mycity);
				member.setMycounty(mycounty);
				member.setMyemail(myemail);
				member.setMylandlinenumber(mylandlinenumber);
				member.setMynation(mynation);
				member.setMystreet(mystreet);
				member.setProfessor(professor);
				member.setRelationship(relationship);
				member.setReside(reside);
				member.setWays(ways);
				
				member.setIsCareEva("0");
				member.setIsRecoverEva("0");
				member.setIsHealthEva("0");
				member.setIsHealthPsyEva("0");
				baseDao.save(member);
			} catch (Exception e) {
				e.printStackTrace();
				return "error";
			}
		}
		return "success";
	}
	
	public String modifyMem(String meminfoid,String memname, String memid,
            String memsex,String creditid,String birthday,String culture,String professor,String financial,String marry,String kids,String ways,String enterdate,String reside,String fees,
            String mycellnumber,String mylandlinenumber,String myaddress,String mycounty,String mystreet,String mycity,String myemail,String mynation,String coname,
            String relationship,String concellnumber,String connumber,String conaddress,String concity,String conpost,String concountry,String assessment,String asesdate)throws Exception{
        SessionFactory factory = baseDao.getFactory();
        Session s1 = factory.openSession();
        Session s2 = factory.openSession();
        Transaction tx1 = s1.beginTransaction();
        tx1.begin();
		Member member = new Member();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String timestamp = sdf.format(new Date());
		List<Member> list = baseDao.find("from Member tt where tt.meminfoid=?", meminfoid);
		if (list.size() > 0) {
			
		}
		Transaction tx2 = s2.beginTransaction();
	    tx2.begin();
	    
	    {
			try {
				//最新更新时间戳
				member.setAsesdate(asesdate);
				member.setAssessment(assessment);
				member.setTimestamp(timestamp);
				member.setMeminfoid(meminfoid) ;
				member.setBirthday(birthday);
				member.setConaddress(conaddress);
				member.setConame(coname);
				member.setConcellnumber(concellnumber);
				member.setConcity(concity);
				member.setConcountry(concountry);
				member.setConnumber(connumber);
				member.setConpost(conpost);
				member.setCreditid(creditid);
				member.setCulture(culture);
				member.setEnterdate(enterdate);
				member.setFees(fees);
				member.setFinancial(financial);
				member.setKids(kids);
				member.setMarry(marry);
				member.setMemid(memid);
				member.setMemname(memname);
				member.setMemsex(memsex);
				member.setMyaddress(myaddress);
				member.setMycellnumber(mycellnumber);
				member.setMycity(mycity);
				member.setMycounty(mycounty);
				member.setMyemail(myemail);
				member.setMylandlinenumber(mylandlinenumber);
				member.setMynation(mynation);
				member.setMystreet(mystreet);
				member.setProfessor(professor);
				member.setRelationship(relationship);
				member.setReside(reside);
				member.setWays(ways);
				
				member.setIsCareEva(list.get(0).getIsCareEva());
				member.setIsRecoverEva(list.get(0).getIsRecoverEva());
				member.setIsHealthEva(list.get(0).getIsHealthEva());
				member.setIsHealthPsyEva(list.get(0).getIsHealthPsyEva());
				//baseDao.update(member);
				s2.update(member);
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
	
	
	public boolean deleMember(String memid)throws Exception{
		List<Member> memList = null;
		try {
			memList = new ArrayList<Member>();
			memList = baseDao.find("from Member tt where tt.meminfoid=?", memid);
			if (memList!=null&&memList.size() > 0) {
				baseDao.delete(memList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public Member lookMember(String meminfoid)throws Exception{
		Member mem = new Member();
		List<Member> memList = null;
		memList = new ArrayList<Member>();
		memList = baseDao.find("from Member tt where tt.meminfoid=?", meminfoid);
		mem = memList.get(0);
		return mem;
	}
	
	public Memberhistory lookMemberhis(String meminfoid)throws Exception{
		Memberhistory mem = new Memberhistory();
		List<Memberhistory> memList = null;
		memList = new ArrayList<Memberhistory>();
		memList = baseDao.find("from Memberhistory tt where tt.meminfoid=?", meminfoid);
		mem = memList.get(0);
		return mem;
	}
	
	public List<String> getCaremark(String memid)throws Exception{
		List<healtheval> careList = new ArrayList<healtheval>();
		List<String> alldata = new ArrayList<String>();
		//IADL评估分数1
		String marks1 = "";
		//ADL评估分数2
		String marks2 = "";
		//血糖
		String marks3="0";
		//评估日期
		String mdate = "";
		//项目名称
		String mprojs = "";
		
		careList = baseDao.find("from healtheval tt where tt.memnumber=? order by assesdate", memid);
		if(careList.size()>0){
			for(int i=0;i<careList.size();i++){
				if(i!=careList.size()-1){
					marks1+=careList.get(i).getA369()+",";
					marks2+=careList.get(i).getA45()+",";
					marks3+=careList.get(i).getA110()+",";
					mdate+=careList.get(i).getAssesdate()+",";
					mprojs+=careList.get(i).getBelongproname()+",";
				}
				else{
					marks1+=careList.get(i).getA369();
					marks2+=careList.get(i).getA45();
					marks3+=careList.get(i).getA110();
					mdate+=careList.get(i).getAssesdate();
					mprojs+=careList.get(i).getBelongproname();
				}
			}
		}
		alldata.add(marks1+","+marks2+","+marks3);
		alldata.add(mdate);
		alldata.add(mprojs);
		
		return alldata;
	}
}
