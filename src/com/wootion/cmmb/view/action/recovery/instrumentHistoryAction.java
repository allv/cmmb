package com.wootion.cmmb.view.action.recovery;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.Instrumenthistory;
import com.wootion.cmmb.service.activity.InstrumentService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class instrumentHistoryAction extends BaseAction
{
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
    private String mentid;
	private String mdate;
	private String mnumber;
	private String mname;
	private String mchair;
	private String mjoint;
	private String mbelt;
	private String mdumbbell;
	private String mrecorder;
	private String msupervisor;
	private String mtotaltime;
	private String mchairchoo;
	private String mjointchoo;
	private String mbeltchoo;
	private String mdumbbellchoo;
	private String mbelongpro;
	
	private QueryResult<Instrumenthistory> result;
	public InstrumentService instrumentservice;
	instrumentHistoryAction() {
		instrumentservice = IMPServiceFactory.getInstrumentService();
	}
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		Integer firstindex = 1;//当前页数
        Integer maxresult = 10;//每页显示数
        if (nowpage != null && !nowpage.trim().equals(""))
        {
            firstindex = Integer.parseInt(nowpage.trim());
            if (firstindex == 0)
            {
                firstindex = 1;
            }
        }
        if (maxpage != null && !maxpage.trim().equals(""))
        {
        	maxresult = Integer.parseInt(maxpage.trim());
        }
        
        try {
			result = instrumentservice.getQueryMentHistoryResult(firstindex, maxresult, 
					mdate, mname, mrecorder, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "instrumenthistory";
	}
	
	public String getNowpage() {
		return nowpage;
	}

	public void setNowpage(String nowpage) {
		this.nowpage = nowpage;
	}

	public String getMaxpage() {
		return maxpage;
	}

	public void setMaxpage(String maxpage) {
		this.maxpage = maxpage;
	}

	public String getPerPageNumber() {
		return perPageNumber;
	}

	public void setPerPageNumber(String perPageNumber) {
		this.perPageNumber = perPageNumber;
	}
	public String getMentid() {
		return mentid;
	}
	public void setMentid(String mentid) {
		this.mentid = mentid;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String getMnumber() {
		return mnumber;
	}
	public void setMnumber(String mnumber) {
		this.mnumber = mnumber;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMchair() {
		return mchair;
	}
	public void setMchair(String mchair) {
		this.mchair = mchair;
	}
	public String getMjoint() {
		return mjoint;
	}
	public void setMjoint(String mjoint) {
		this.mjoint = mjoint;
	}
	public String getMbelt() {
		return mbelt;
	}
	public void setMbelt(String mbelt) {
		this.mbelt = mbelt;
	}
	public String getMdumbbell() {
		return mdumbbell;
	}
	public void setMdumbbell(String mdumbbell) {
		this.mdumbbell = mdumbbell;
	}
	public String getMrecorder() {
		return mrecorder;
	}
	public void setMrecorder(String mrecorder) {
		this.mrecorder = mrecorder;
	}
	public String getMsupervisor() {
		return msupervisor;
	}
	public void setMsupervisor(String msupervisor) {
		this.msupervisor = msupervisor;
	}
	public String getMtotaltime() {
		return mtotaltime;
	}
	public void setMtotaltime(String mtotaltime) {
		this.mtotaltime = mtotaltime;
	}
	public String getMchairchoo() {
		return mchairchoo;
	}
	public void setMchairchoo(String mchairchoo) {
		this.mchairchoo = mchairchoo;
	}
	public String getMjointchoo() {
		return mjointchoo;
	}
	public void setMjointchoo(String mjointchoo) {
		this.mjointchoo = mjointchoo;
	}
	public String getMbeltchoo() {
		return mbeltchoo;
	}
	public void setMbeltchoo(String mbeltchoo) {
		this.mbeltchoo = mbeltchoo;
	}
	public String getMdumbbellchoo() {
		return mdumbbellchoo;
	}
	public void setMdumbbellchoo(String mdumbbellchoo) {
		this.mdumbbellchoo = mdumbbellchoo;
	}
	public String getMbelongpro() {
		return mbelongpro;
	}
	public void setMbelongpro(String mbelongpro) {
		this.mbelongpro = mbelongpro;
	}
	public QueryResult<Instrumenthistory> getResult() {
		return result;
	}
	public void setResult(QueryResult<Instrumenthistory> result) {
		this.result = result;
	}
    
}
