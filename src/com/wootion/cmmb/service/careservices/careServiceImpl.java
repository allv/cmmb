package com.wootion.cmmb.service.careservices;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.wootion.cimp.idao.BaseDao;
import com.wootion.cimp.vo.data.Member;
import com.wootion.cimp.vo.data.memstatistic;
import com.wootion.cimp.vo.data.workerdata;
import com.wootion.cimp.vo.data.workerstatistic;
import com.wootion.cmmb.common.util.ServletUtil;
import com.wootion.cmmb.persistenc.po.bean.CareAssess;
import com.wootion.cmmb.persistenc.po.bean.Serviceplaninfo;
import com.wootion.cmmb.persistenc.po.bean.evaluationforbusiness;
import com.wootion.idp.common.utils.DomainUtil;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.CommonDao;
import com.wootion.idp.persistence.po.bean.Wtuser;

public class careServiceImpl implements careService{

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
	
	private Member lookMember(String meminfoid)throws Exception{
		Member mem = new Member();
		List<Member> memList = null;
		memList = new ArrayList<Member>();
		memList = baseDao.find("from Member tt where tt.memid=?", meminfoid);
		mem = memList.get(0);
		return mem;
	}
	
	public String saveCareAssessment(CareAssess sinfos) {
		try{
			List<CareAssess> list = baseDao.find("from CareAssess tt where tt.carenumber=?", sinfos.getCarenumber());
		    if (list.size() > 0) {
			   return "duplicated";
		    }
			Member mem = lookMember(sinfos.getMemnumber());
			int isCareEva = Integer.parseInt(mem.getIsCareEva());
			mem.setIsCareEva(String.valueOf((isCareEva+1)));
			//filter and insert all data needed to be counted to workerstatistic 
			saveAllstaData(sinfos);
			baseDao.save(mem);
			baseDao.save(sinfos);
			return "success";
		}catch(Exception e){
			return "error";
		}
	}
	
	public String saveEvalForBusiness(evaluationforbusiness sinfos) {
		try{
			List<evaluationforbusiness> list = baseDao.find("from evaluationforbusiness tt where tt.evaluationnumber=?", sinfos.getEvaluationnumber());
		    if (list.size() > 0) {
			   return "duplicated";
		    }
			baseDao.save(sinfos);
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}
	
	public String modifyEvalForBusiness(evaluationforbusiness sinfos) {
		try{
			baseDao.update(sinfos);
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}
	
	private void saveAllstaData(CareAssess sinfos){
        try{
        	String memname = sinfos.getMemname();
        	int length = sinfos.getA90().lastIndexOf("#")-1;
        	String[] workernames = sinfos.getA90().split("#",length+1);
        	String[] workerdates = sinfos.getA85().split("#",length+1);
        	String[] durations = sinfos.getA86().split("#",length+1);
        	//時長
        	String[] worktimes = sinfos.getA87().split("#",length+1);
        	String[] workcontents = sinfos.getA89().split("#",length+1);
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
        		//護理部
        		wdata.setDepartment("1");
        		wdata.setWorkcontent(workcontents[i]);
        		wdata.setWorkdate(workerdates[i]);
        		wdata.setWorkername(workernames[i]);
        		wdata.setWorktime(Integer.parseInt(worktimes[i]));
        		wdata.setDuration(durations[i]);
        		wdata.setMembername(memname);
        		wdata.setCarenumber(sinfos.getCarenumber());
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
	
	public CareAssess lookCare(String cid)throws Exception{
		CareAssess ca = new CareAssess();
		List<CareAssess> careList = null;
		careList = new ArrayList<CareAssess>();
		careList = baseDao.find("from CareAssess tt where tt.careid=?", cid);
		ca = careList.get(0);
		return ca;
	}
	
	public evaluationforbusiness lookEvalBusiness(String evalid)throws Exception{
		evaluationforbusiness ca = new evaluationforbusiness();
		List<evaluationforbusiness> careList = null;
		careList = new ArrayList<evaluationforbusiness>();
		careList =  baseDao.find("from evaluationforbusiness tt where tt.evaluationid=?", evalid);
		ca = careList.get(0);
		return ca;
	}
	
	public void saveServiceplan(Serviceplaninfo sinfos) {
		baseDao.save(sinfos);
	}
	
	 public QueryResult<Wtuser> getQueryUserResult(Integer index,
	            Integer maxresult, String workername, String department, 
	            String sessionID)
				throws ParseException{
		 	String whererjpql = "1=1";
			List<Object> lst = new ArrayList<Object>();
			if(department != null && !department.trim().equals(""))
			{
				whererjpql = whererjpql + " and o.department = '"+department+"'";
			}
			if (workername != null && !workername.trim().equals(""))
		    {
		         whererjpql = whererjpql + " and o.corpName like '%"
		                 + workername + "%'";
		    }
		    return this.commondao.getScrollData(Wtuser.class, "wtuserId", index,
		             maxresult, whererjpql, null, null);
	 }
	
	public QueryResult<memstatistic> getQueryMemStatisticResult(Integer firstindex,
			Integer maxresult,String workername,String startDate,String endDate,String careflag) {
		StringBuffer querysql = new StringBuffer();  
		String wheresql = "where 1=1"; 
		Calendar cal = Calendar.getInstance();
		
		int day = cal.get(Calendar.DATE);
		int month = cal.get(Calendar.MONTH) + 1;
		int year = cal.get(Calendar.YEAR);
		cal.add(Calendar.MONTH, -1);
		//当前时间前一个月
		int premonth = cal.get(Calendar.MONTH)+1;
		//当前年份前一年
		int preyear = year-1;
		//如果为护理部会员统计
		
			//护理工作人员统计
				querysql.append("SELECT min(w.workdate) as startservedate ,max(w.workdate)as endservedate,w.workid,w.membername, m.mylandlinenumber,m.myaddress,SUM(w.worktime) as totaltime");
				querysql.append(" FROM workerstatistic w , Member m ");
				querysql.append(wheresql);
				if(careflag!=null&&"true".equals(careflag)){
					querysql.append(" and w.workername<>'#' and w.department='1' and w.workdate<>'#' and w.membername<>'#' and w.membername=m.memname");
				}else{
					querysql.append(" and w.workername<>'#' and w.department='2' and w.workdate<>'#' and w.membername<>'#' and w.membername=m.memname");
				}
				if (workername != null && !workername.trim().equals(""))
		    {
			    querysql.append(" and w.membername = '"+ workername +"'");
		    }
			
			if (startDate != null && !startDate.trim().equals(""))
		    {
				querysql.append(" and w.workdate >= '"+ startDate +"'");
		    }else if(endDate == null || endDate.trim().equals("")){
		    	//当搜索条件同时为空的情况下
		    	//默认开始日期 当前时间的前一个月的27号 如果当前日大于27 则从当前月27号开始
		    	String defaultStartDate = "";
		    	if(day>27){
		    		String monthstr = ""+month;
		    		if(month<10){
		    		    monthstr = "0"+month;
		    		}
		    		defaultStartDate = year+"-"+monthstr+"-"+"27";
		    	}else{
		    		String premonthstr = ""+premonth;
		    		if(premonth<10){
		    			premonthstr = "0"+premonth ;
		    		}
		    		if(premonth==12){
		    			//前一个月是12月份，则年份相应减去
		    			defaultStartDate = preyear+"-"+premonthstr+"-"+"27";
		    		}else{
		    			defaultStartDate = year+"-"+premonthstr+"-"+"27";
		    		}
		    	}
		    	
		    	querysql.append(" and w.workdate >= '"+ defaultStartDate +"'");
		    }
			
			if (endDate != null && !endDate.trim().equals(""))
		    {
				querysql.append(" and w.workdate <= '"+ endDate +"'");
		    }else if(startDate == null || startDate.trim().equals("")){
		    	//当搜索条件同时为空的情况下
		    	//默认结束日期 当前时间 
		    	String monthstr = ""+month;
	    		if(month<10){
	    		    monthstr = "0"+month;
	    		}
		    	endDate = year+"-"+monthstr+"-"+day;
		    	querysql.append(" and w.workdate <= '"+ endDate +"'");
		    }
			//管理员 察看所有经确认的数据 
			if("1".equals(isManager())){
				querysql.append(" and w.a1='1' ");
			}
			//else{
			//	querysql.append(" and w.a1='1' ");
			//}
			querysql.append(" GROUP BY w.membername");
		
		//如果为康复部会员统计
			
		return this.baseDao.getPageData(querysql.toString(),firstindex, maxresult, careflag);
	}
	
	public QueryResult<workerdata> getQueryWorkerStatisticResult(Integer firstindex,
			Integer maxresult,String workername,String startDate,String endDate,String careflag) {
		StringBuffer querysql = new StringBuffer();  
		String wheresql = "where 1=1"; 
		Calendar cal = Calendar.getInstance();
		
		int day = cal.get(Calendar.DATE);
		int month = cal.get(Calendar.MONTH) + 1;
		int year = cal.get(Calendar.YEAR);
		cal.add(Calendar.MONTH, -1);
		//当前时间前一个月
		int premonth = cal.get(Calendar.MONTH)+1;
		//当前年份前一年
		int preyear = year-1;
			
		    querysql.append("SELECT min(w.workdate) as startservedate ,max(w.workdate)as endservedate,w.workid,workername,u.linkman_tel, u.corpAdd,SUM(w.worktime) as totaltime FROM workerstatistic w,wtuser u ");
			querysql.append(wheresql);
			if(careflag!=null&&"false".equals(careflag)){
				//护理工作人员统计
				querysql.append("  and w.workername<>'#' and w.workdate<>'#' and w.membername<>'#' and w.department='1' and w.workername=u.corp_name ");
			}else{
				//康复工作人员
				querysql.append("  and w.workername<>'#' and w.workdate<>'#' and w.membername<>'#' and w.department='2' and w.workername=u.corp_name ");
			}
			if (workername != null && !workername.trim().equals(""))
		    {
			    querysql.append(" and w.workername = '"+ workername +"'");
		    }
			
			if (startDate != null && !startDate.trim().equals(""))
		    {
				querysql.append(" and w.workdate >= '"+ startDate +"'");
		    }else if(endDate == null || endDate.trim().equals("")){
		    	//当搜索条件同时为空的情况下
		    	//默认开始日期 当前时间的前一个月的27号 如果当前日大于27 则从当前月27号开始
		    	String defaultStartDate = "";
		    	if(day>27){
		    		String monthstr = ""+month;
		    		if(month<10){
		    		    monthstr = "0"+month;
		    		}
		    		defaultStartDate = year+"-"+monthstr+"-"+"27";
		    	}else{
		    		String premonthstr = ""+premonth;
		    		if(premonth<10){
		    			premonthstr = "0"+premonth ;
		    		}
		    		if(premonth==12){
		    			//前一个月是12月份，则年份相应减去
		    			defaultStartDate = preyear+"-"+premonthstr+"-"+"27";
		    		}else{
		    			defaultStartDate = year+"-"+premonthstr+"-"+"27";
		    		}
		    	}
		    	
		    	querysql.append(" and w.workdate >= '"+ defaultStartDate +"'");
		    }
			
			if (endDate != null && !endDate.trim().equals(""))
		    {
				querysql.append(" and w.workdate <= '"+ endDate +"'");
		    }else if(startDate == null || startDate.trim().equals("")){
		    	//当搜索条件同时为空的情况下
		    	//默认结束日期 当前时间 
		    	String monthstr = ""+month;
	    		if(month<10){
	    		    monthstr = "0"+month;
	    		}
		    	endDate = year+"-"+monthstr+"-"+day;
		    	querysql.append(" and w.workdate <= '"+ endDate +"'");
		    }
			//管理员 察看所有经确认的数据 
			if("1".equals(isManager())){
				querysql.append(" and w.a2='1' ");
			}
			//else{
			//	querysql.append(" and w.a1='1' ");
			//}
				querysql.append(" GROUP BY w.workername");
		return this.baseDao.getPageData(querysql.toString(),firstindex, maxresult, careflag);
	}
	
	public QueryResult<CareAssess> getQueryCareResult(Integer index,
            Integer maxresult, String assessdate, String memname, String belongproname,
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
		
		if (belongproname != null && !belongproname.trim().equals(""))
	     {
	         whererjpql = whererjpql + " and o.belongproname like '%"
	                 + belongproname + "%'";
	     }
	     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

	     map.put("assesdate", "DESC");
	     return this.commondao.getScrollData(CareAssess.class, "careid", index,
	             maxresult, whererjpql, lst.toArray(), map);
	}
	
	public List<Serviceplaninfo> lookServiceplan(String snumber) throws Exception {
		List<Serviceplaninfo> serList = null;
		try {
			serList = new ArrayList<Serviceplaninfo>();
			serList = baseDao.find("from Serviceplaninfo ta where ta.snumber=?", snumber);
			if (serList.size() > 0) {
				return serList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public String modifycare(String careid, String carenumber, String memnumber,
            String memname,String assesman,String assesdate,String belongproid,String belongproname,String a1,String a2,String a3,String a4,String a5,String a6,String a7
            ,String a8,String a9,String a10,String a11,String a12,String a13,String a14,String a15,String a16,
            String a17,String a18,String a19,String a20,String a21,String a22,String a23,String a24,String a25,String a26,
            String a27,String a28,String a29,String a30,String a31,String a32,String a33,String a34,String a35,String a36,String a37,String a38,
            String a39,String a40,String a41,String a42,String a43,String a44,String a45,String a46,String a47,String a48,String a49,String a50,
            String a51,String a52,String a53,String a54,String a55,String a56,String a57,String a58,String a59,String a60,String a61
            ,String a62,String a63,String a64,String a65,String a66,String a67,String a68,String a69,String a70,String a71,String a72,String a73,String a74
            ,String a75,String a76,String a77,String a78,String a79,String a80,String a81,String a82,String a83,String a84,String a85,String a86,String a87,String a88,String a89,String a90)
			throws ParseException {
		SessionFactory factory = baseDao.getFactory();
        Session s1 = factory.openSession();
        Session s2 = factory.openSession();
        Transaction tx1 = s1.beginTransaction();
        tx1.begin();
        CareAssess careassess = new CareAssess();
		List<CareAssess> list = baseDao.find("from CareAssess bi where bi.careid=?", careid);
		//保存活动历史记录
		if (list.size() > 0)
		{
			tx1.commit();
			s1.close();
		}
		Transaction tx2 = s2.beginTransaction();
	    tx2.begin();
		{
			try
			{
				careassess.setCareid(careid);
				careassess.setMemname(memname);
		    	careassess.setMemnumber(memnumber);
		    	careassess.setAssesdate(assesdate);
		    	careassess.setAssesman(assesman);
		    	careassess.setCarenumber(carenumber);
		    	careassess.setBelongproid(belongproid);
		    	careassess.setBelongproname(belongproname);
		    	careassess.setA1(a1);
		    	careassess.setA2(a2);
		    	careassess.setA3(a3);
		    	careassess.setA4(a4);
		    	careassess.setA5(a5);
		    	careassess.setA6(a6);
		    	careassess.setA7(a7);
		    	careassess.setA8(a8);
		    	careassess.setA9(a9);
		    	careassess.setA10(a10);
		    	careassess.setA11(a11);
		    	careassess.setA12(a12);
		    	careassess.setA13(a13);
		    	careassess.setA14(a14);
		    	careassess.setA15(a15);
		    	careassess.setA16(a16);
		    	careassess.setA17(a17);
		    	careassess.setA18(a18);
		    	careassess.setA19(a19);
		    	careassess.setA20(a20);
		    	careassess.setA21(a21);
		    	careassess.setA22(a22);
		    	careassess.setA23(a23);
		    	careassess.setA24(a24);
		    	careassess.setA25(a25);
		    	careassess.setA26(a26);
		    	careassess.setA27(a27);
		    	careassess.setA28(a28);
		    	careassess.setA29(a29);
		    	careassess.setA30(a30);
		    	careassess.setA31(a31);
		    	careassess.setA32(a32);
		    	careassess.setA33(a33);
		    	careassess.setA34(a34);
		    	careassess.setA35(a35);
		    	careassess.setA36(a36);
		    	careassess.setA37(a37);
		    	careassess.setA38(a38);
		    	careassess.setA39(a39);
		    	careassess.setA40(a40);
		    	careassess.setA41(a41);
		    	careassess.setA42(a42);
		    	careassess.setA43(a43);
		    	careassess.setA44(a44);
		    	careassess.setA45(a45);
		    	careassess.setA46(a46);
		    	careassess.setA47(a47);
		    	careassess.setA48(a48);
		    	careassess.setA49(a49);
		    	careassess.setA50(a50);
		    	careassess.setA51(a51);
		    	careassess.setA52(a52);
		    	careassess.setA53(a53);
		    	careassess.setA54(a54);
		    	careassess.setA55(a55);
		    	careassess.setA56(a56);
		    	careassess.setA57(a57);
		    	careassess.setA58(a58);
		    	careassess.setA59(a59);
		    	careassess.setA60(a60);
		    	careassess.setA61(a61);
		    	careassess.setA62(a62);
		    	careassess.setA63(a63);
		    	careassess.setA64(a64);
		    	careassess.setA65(a65);
		    	careassess.setA66(a66);
		    	careassess.setA67(a67);
		    	careassess.setA68(a68);
		    	careassess.setA69(a69);
		    	careassess.setA70(a70);
		    	careassess.setA71(a71);
		    	careassess.setA72(a72);
		    	careassess.setA73(a73);
		    	careassess.setA74(a74);
		    	careassess.setA75(a75);
		    	careassess.setA76(a76);
		    	careassess.setA77(a77);
		    	careassess.setA78(a78);
		    	careassess.setA79(a79);
		    	careassess.setA80(a80);
		    	careassess.setA82(a82);
		    	careassess.setA81(a81);
		    	careassess.setA83(a83);
		    	careassess.setA84(a84);
		    	
		    	careassess.setA85(a85);
		    	careassess.setA86(a86);
		    	careassess.setA87(a87);
		    	careassess.setA88(a88);
		    	careassess.setA89(a89);
		    	careassess.setA90(a90);
				//baseDao.update(act);
				s2.update(careassess);
				//filter and insert all data needed to be counted to workerstatistic 
				updateAllstaData(careassess);
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
	
	private void updateAllstaData(CareAssess cs){
		List<workerstatistic> serList = null;
		try{
			serList = new ArrayList<workerstatistic>();
			serList = baseDao.find("from workerstatistic ac where ac.carenumber=?", cs.getCarenumber());
			//有新增行 更新已有行 新增多出來的行
			if(serList.size()<=cs.getA90().split("#",300).length-1){
				for(int i=0;i<serList.size();i++){
					updateSingleRecord(cs,serList.get(i),serList.get(i).getLinenumber());
				}
				//保存新增值
				for(int j=serList.size();j<cs.getA90().split("#",300).length-1;j++){
					workerstatistic newinstance = new workerstatistic();
					saveSingleRecord(cs,newinstance,j);
				}
			}
			
			//有刪減行 更新已有行 刪除多余行
			if(serList.size()>cs.getA90().split("#",300).length-1){
				for(int i=0;i<cs.getA90().split("#",300).length;i++){
					updateSingleRecord(cs,serList.get(i),serList.get(i).getLinenumber());
				}
				//刪除多余行
				for(int j=cs.getA90().split("#",300).length-1;j<serList.size();j++){
					deleteSingleRecord(serList.get(j));
				}
			}
		}catch(Exception ee){}
	}
	
	private void deleteSingleRecord(workerstatistic wdata){
		baseDao.delete(wdata);
	}
	
	private void saveSingleRecord(CareAssess sinfos,workerstatistic wdata,int i){
		try{String memname = sinfos.getMemname();
		int len = sinfos.getA90().lastIndexOf("#")-1;
    	String[] workernames = sinfos.getA90().split("#",len+1);
    	String[] workerdates = sinfos.getA85().split("#",len+1);
    	String[] durations = sinfos.getA86().split("#",len+1);
    	//時長
    	String[] worktimes = sinfos.getA87().split("#",len+1);
    	String[] workcontents = sinfos.getA89().split("#",len+1);
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
    		//護理部
    		wdata.setDepartment("1");
    		wdata.setWorkcontent(workcontents[i]);
    		wdata.setWorkdate(workerdates[i]);
    		wdata.setWorkername(workernames[i]);
    		wdata.setWorktime(Integer.parseInt(worktimes[i]));
    		wdata.setDuration(durations[i]);
    		wdata.setMembername(memname);
    		wdata.setCarenumber(sinfos.getCarenumber());
    		wdata.setLinenumber(i);
    		wdata.setA1("0");
    		wdata.setA2("0");
    		//保存護理服務表數據到統計表中
    		baseDao.save(wdata);
    	
    }catch(Exception ee){}	
	}
	
	private void updateSingleRecord(CareAssess sinfos,workerstatistic wdata,int i){
			try{String memname = sinfos.getMemname();
			int len = sinfos.getA90().lastIndexOf("#")-1;
	    	String[] workernames = sinfos.getA90().split("#",len+1);
	    	String[] workerdates = sinfos.getA85().split("#",len+1);
	    	String[] durations = sinfos.getA86().split("#",len+1);
	    	//時長
	    	String[] worktimes = sinfos.getA87().split("#",len+1);
	    	String[] workcontents = sinfos.getA89().split("#",len+1);
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
	    		//護理部
	    		wdata.setDepartment("1");
	    		wdata.setWorkcontent(workcontents[i]);
	    		wdata.setWorkdate(workerdates[i]);
	    		wdata.setWorkername(workernames[i]);
	    		wdata.setWorktime(Integer.parseInt(worktimes[i]));
	    		wdata.setDuration(durations[i]);
	    		wdata.setMembername(memname);
	    		wdata.setCarenumber(sinfos.getCarenumber());
	    		wdata.setLinenumber(i);
	    		wdata.setA1(wdata.getA1());
	    		wdata.setA2(wdata.getA2());
	    		//保存護理服務表數據到統計表中
	    		baseDao.update(wdata);
	    	
	    }catch(Exception ee){}	
	}
	
	public boolean deleServiceplaninfo(String snumber) throws Exception {
		List<Serviceplaninfo> serList = null;
		try {
			serList = new ArrayList<Serviceplaninfo>();
			serList = baseDao.find("from Serviceplaninfo ac where ac.snumber=?", snumber);
			
			if (serList != null && serList.size() > 0) {
				for (int i=0; i<serList.size(); i++)
				{
					baseDao.delete(serList.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean deleCarechoose(String careid) throws Exception {
		List<CareAssess> careList = null;
		try {
			careList = new ArrayList<CareAssess>();
			careList = baseDao.find("from CareAssess ps where careid=?", careid);
			if (careList != null && careList.size() > 0) {
				Member mem = lookMember(careList.get(0).getMemnumber());
				int isCareEva = Integer.parseInt(mem.getIsCareEva());
				mem.setIsCareEva(String.valueOf((isCareEva-1)));
				//mem.setIsRecoverEva(String.valueOf((isR+1)));
				baseDao.save(mem);
				baseDao.delete(careList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean deleEvalBusiness(String careid) throws Exception {
		List<evaluationforbusiness> careList = null;
		try {
			careList = new ArrayList<evaluationforbusiness>();
			careList = baseDao.find("from evaluationforbusiness tt where tt.evaluationid=?", careid);
			if (careList != null && careList.size() > 0) {
				baseDao.delete(careList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public QueryResult<evaluationforbusiness> getQueryEvaluationResult(Integer index,
	            Integer maxresult, String workername,String evaluationnumber,String startDate,String evalenddate)
				throws ParseException{
		String whererjpql = "1=1";
		
		if (workername != null && !workername.trim().equals(""))
	    {
	         whererjpql = whererjpql + " and o.evalname like '%"
	                 + workername + "%'";
	    }
		
		if (evaluationnumber != null && !evaluationnumber.trim().equals(""))
	    {
	         whererjpql = whererjpql + " and o.evaluationnumber like '%"
	                 + evaluationnumber + "%'";
	    }
		
	    Calendar cal = Calendar.getInstance();
		
		int day = cal.get(Calendar.DATE);
		int month = cal.get(Calendar.MONTH) + 1;
		int year = cal.get(Calendar.YEAR);
		cal.add(Calendar.MONTH, -1);
		//当前时间前一个月
		int premonth = cal.get(Calendar.MONTH)+1;
		//当前年份前一年
		int preyear = year-1;
		
		if (startDate != null && !startDate.trim().equals(""))
	    {
			 whererjpql = whererjpql + " and o.evaldate >= '"
             	+ startDate + "'";
	    }else if(evalenddate == null || evalenddate.trim().equals("")){
	    	//当搜索条件同时为空的情况下
	    	//默认开始日期 当前时间的前一个月的27号 如果当前日大于27 则从当前月27号开始
	    	String defaultStartDate = "";
	    	if(day>27){
	    		String monthstr = ""+month;
	    		if(month<10){
	    		    monthstr = "0"+month;
	    		}
	    		defaultStartDate = year+"-"+monthstr+"-"+"27";
	    	}else{
	    		String premonthstr = ""+premonth;
	    		if(premonth<10){
	    			premonthstr = "0"+premonth ;
	    		}
	    		if(premonth==12){
	    			//前一个月是12月份，则年份相应减去
	    			defaultStartDate = preyear+"-"+premonthstr+"-"+"27";
	    		}else{
	    			defaultStartDate = year+"-"+premonthstr+"-"+"27";
	    		}
	    	}
	    	whererjpql = whererjpql + " and o.evaldate >= '"
          		+ defaultStartDate + "'";
	    }
		
		if (evalenddate != null && !evalenddate.trim().equals(""))
	    {
			whererjpql = whererjpql + " and o.evaldate <= '"
				+ evalenddate + "'";
	    }else if(startDate == null || startDate.trim().equals("")){
	    	//当搜索条件同时为空的情况下
	    	//默认结束日期 当前时间 
	    	String monthstr = ""+month;
    		if(month<10){
    		    monthstr = "0"+month;
    		}
    		evalenddate = year+"-"+monthstr+"-"+day;
    		whererjpql = whererjpql + " and o.evaldate <= '"
				+ evalenddate + "'";
	    }
		
	    return this.commondao.getScrollData(evaluationforbusiness.class, "evaluationid", index,
	             maxresult, whererjpql, null, null);
	}

	public String isManager(){
		Long currentUserId = ServletUtil.getCurrentUserId();
		Wtuser currentUser = commondao.getObject(Wtuser.class, currentUserId);
		if(DomainUtil.isUserManager(currentUser)){
			//经理
			return "0";
		}else if(DomainUtil.isUserAdmin(currentUser)){
			//管理员
			return "1";
		}else{
			//普通员工
			return "2";
		}
	}
	
	private List<workerstatistic> lookWorkerData(String sqlCon,String startDate,String endDate,String careflag)throws Exception{
		StringBuffer querysql = new StringBuffer();  
		String wheresql = " 1=1 "; 
		Calendar cal = Calendar.getInstance();
		
		int day = cal.get(Calendar.DATE);
		int month = cal.get(Calendar.MONTH) + 1;
		int year = cal.get(Calendar.YEAR);
		cal.add(Calendar.MONTH, -1);
		//当前时间前一个月
		int premonth = cal.get(Calendar.MONTH)+1;
		//当前年份前一年
		int preyear = year-1;
			
	    querysql.append(wheresql);
	    
		if("worker1".equals(careflag)){
			querysql.append("  and workername in ").append(sqlCon).append(" and department='1'");
		}
				
		if("worker2".equals(careflag)){
			querysql.append("  and workername in ").append(sqlCon).append(" and department='2'");
		}
		
		if("member1".equals(careflag)){
			querysql.append("  and membername in ").append(sqlCon).append(" and department='1'");
		}
		
		if("member2".equals(careflag)){
			querysql.append("  and membername in ").append(sqlCon).append(" and department='2'");
		}
		
		if (startDate != null && !startDate.trim().equals(""))
	    {
			querysql.append(" and workdate >= '"+ startDate +"'");
	    }else if(endDate == null || endDate.trim().equals("")){
	    	//当搜索条件同时为空的情况下
	    	//默认开始日期 当前时间的前一个月的27号 如果当前日大于27 则从当前月27号开始
	    	String defaultStartDate = "";
	    	if(day>27){
	    		String monthstr = ""+month;
	    		if(month<10){
	    		    monthstr = "0"+month;
	    		}
	    		defaultStartDate = year+"-"+monthstr+"-"+"27";
	    	}else{
	    		String premonthstr = ""+premonth;
	    		if(premonth<10){
	    			premonthstr = "0"+premonth ;
	    		}
	    		if(premonth==12){
	    			//前一个月是12月份，则年份相应减去
	    			defaultStartDate = preyear+"-"+premonthstr+"-"+"27";
	    		}else{
	    			defaultStartDate = year+"-"+premonthstr+"-"+"27";
	    		}
	    	}
	    	
	    	querysql.append(" and workdate >= '"+ defaultStartDate +"'");
	    }
		
		if (endDate != null && !endDate.trim().equals(""))
	    {
			querysql.append(" and workdate <= '"+ endDate +"'");
	    }else if(startDate == null || startDate.trim().equals("")){
	    	//当搜索条件同时为空的情况下
	    	//默认结束日期 当前时间 
	    	String monthstr = ""+month;
    		if(month<10){
    		    monthstr = "0"+month;
    		}
	    	endDate = year+"-"+monthstr+"-"+day;
	    	querysql.append(" and workdate <= '"+ endDate +"'");
	    }
		
		return this.commondao.getScrollData(workerstatistic.class, "workid", 1, Integer.MAX_VALUE, querysql.toString(), null, null).getResultlist();
	}
	
	//更新所有提交的统计数据的状态
	public String updateDataState(String names,String sdate,String edate,String careflag,String iscancel)throws Exception{
       	List<workerstatistic> wlist = new ArrayList<workerstatistic>();
       	StringBuffer namesAsSql = new StringBuffer();
       	namesAsSql.append("(");
       	namesAsSql.append(names);
       	namesAsSql.append(")");
       	
        List<workerstatistic> ca = this.lookWorkerData(namesAsSql.toString(),sdate,edate,careflag);
       	for(workerstatistic ws:ca){
       		
       		if("member1".equals(careflag)||"member2".equals(careflag)){
       			if("true".equals(iscancel)){
       				ws.setA1("0");
           		}else{
           			ws.setA1("1");
           		}
       		}
       		if("worker1".equals(careflag)||"worker2".equals(careflag)){
       			if("true".equals(iscancel)){
       				ws.setA2("0");
           		}else{
           			ws.setA2("1");
           		}
       		}
       	}
       		//加入所有collection
       		wlist.addAll(ca);
       	
       	if(wlist!=null&&wlist.size()>0){
   			baseDao.saveOrUpdateAll(wlist);
   		}
       	return "success";
	}
}
