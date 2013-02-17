package com.wootion.cimp.services.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.wootion.cimp.idao.BaseDao;
import com.wootion.cimp.services.projectService;
import com.wootion.cimp.vo.data.Project;
import com.wootion.cmmb.persistenc.po.bean.Projecttracing;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.CommonDao;

public class projectServiceImpl implements projectService {
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
	
	public String saveProjectTrack(String proid,String trackid,String proname,String pagedata) throws Exception{
		try{
			Projecttracing protrace = new Projecttracing();
				//数据库存在，则更新之
			    if(trackid!=null&&trackid!="")
			    	protrace.setTrackid(trackid);
				protrace.setProid(proid);
				protrace.setProname(proname);
				protrace.setPagedata(pagedata);
				baseDao.saveOrUpdate(protrace);
		}catch(Exception ee){
			ee.printStackTrace();
			return "error";
		}
		return "success";
	}
	
	public QueryResult<Project> getQueryProResult(Integer index,
            Integer maxresult, String prostartdate, String prostate,
            String proname, String proidentity, String sessionID)
			throws ParseException{
		
     String whererjpql = " 1=1 ";
     List<Object> lst = new ArrayList<Object>();
     if (prostartdate != null && !prostartdate.trim().equals(""))
     {
    	 //得到晚于开始日期的项目
         whererjpql = whererjpql + " and o.prostartdate >= ?";
         lst.add(prostartdate);
     }
     
     if (prostate != null && !prostate.trim().equals(""))
     {
         whererjpql = whererjpql + " and o.prostate = ?";
         lst.add(prostate);
     }
     //if (proenddate != null && !proenddate.trim().equals(""))
     //{
     //    whererjpql = whererjpql + " and o.proenddate >= ?";
     //    lst.add(proenddate);
     //}
     if (proname != null && !proname.trim().equals(""))
     {
         whererjpql = whererjpql + " and o.proname =?";
         lst.add(proname);
     }
     if (proidentity != null && !proidentity.trim().equals(""))
     {
         whererjpql = whererjpql + " and o.proidentity like '%"
                 + proidentity + "%'";
     }
     
     LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

     map.put("prostartdate", "DESC");

     return this.commondao.getScrollData(Project.class, "proid", index,
             maxresult, whererjpql, lst.toArray(), map);
	}
	
	public String saveProject(String proname, String prostate, String proresponsor, String proagency, String proauthority, String proresult,
			String procontract, String prostartdate, String proenddate, String probudget, String protimes, String prodesc, String proidentity,String trdata,String tddata) throws ParseException {
	    Project project = new Project();
	    List<Project> list = baseDao.find("from Project tt where tt.proidentity=?", proidentity);
		if (list.size() > 0) {
			return "sameid";
		}else{
			try {
					project.setProagency(proagency);
					project.setProauthority(proauthority);
					project.setProbudget(probudget);
					project.setProcontract(procontract);
					project.setProdesc(prodesc);
					project.setProenddate(proenddate);
					project.setProidentity(proidentity);
					project.setProname(proname);
					project.setProresponsor(proresponsor);
					project.setProresult(proresult);
					project.setProstartdate(prostartdate);
					project.setProstate(prostate);
					project.setProtimes(protimes);
					project.setTrdata(trdata);
					project.setTddata(tddata);
				    baseDao.save(project);
				    //initProjectTrack(project.getProid(),prostartdate,proenddate);
			} catch (Exception e) {
				e.printStackTrace();
				return "error";
			}
		}
		return "success";
	}
	
	
	public String modifyProject(String pid,String proname, String prostate,
			String proresponsor,String proagency,String proauthority,String proresult,String procontract,String prostartdate,String proenddate,String probudget,String protimes,String prodesc, String proidentity,String trdata,String tddata) throws ParseException {
	    	Project project = new Project();
	    	Project prepro = new Project();
	    	
	    	SessionFactory factory = baseDao.getFactory();
	        Session s2 = factory.openSession();
	        
	        List<Project> proList = null;
				proList = new ArrayList<Project>();
				proList = baseDao.find("from Project tp where tp.proid=?", pid);
				if (proList.size() > 0) {
					prepro = proList.get(0);
				}
	    	
	    	Transaction tx2 = s2.beginTransaction();
		    tx2.begin();
	    	{
	    	try {
				    project.setProid(pid);
					project.setProagency(proagency);
					project.setProauthority(proauthority);
					project.setProbudget(probudget);
					project.setProcontract(procontract);
					project.setProdesc(prodesc);
					project.setProenddate(proenddate);
					project.setProidentity(proidentity);
					project.setProname(proname);
					project.setProresponsor(proresponsor);
					project.setProresult(proresult);
					project.setProstartdate(prostartdate);
					project.setProstate(prostate);
					project.setProtimes(protimes);
					project.setTrdata(trdata);
					project.setTddata(tddata);
				    s2.update(project);
				    
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
	
	
	public boolean deleProject(String pid) throws Exception{
		List<Project> proList = null;
		try {
			proList = new ArrayList<Project>();
			proList = baseDao.find("from Project tt where tt.proid=?", pid);
			//删除项目进度信息
			if (proList!=null&&proList.size() > 0) {
				baseDao.delete(proList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public Project lookProject(String pid)throws Exception{
		List<Project> proList = null;
		try {
			proList = new ArrayList<Project>();
			proList = baseDao.find("from Project tp where tp.proid=?", pid);
			if (proList.size() > 0) {
				return proList.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Projecttracing> lookProjectTrace(String ptid)throws Exception{
		List<Projecttracing> protraceList = null;
		try {
			protraceList = new ArrayList<Projecttracing>();
			protraceList = baseDao.find("from Projecttracing tp where tp.proid=?", ptid);
			if (protraceList.size() > 0) {
				return protraceList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
