package com.wootion.cmmb.view.action.recovery;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.Instrumenthistory;
import com.wootion.cmmb.persistenc.po.bean.Instrumentinfo;
import com.wootion.cmmb.service.activity.InstrumentService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class instrumentAction extends BaseAction
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
	
	private QueryResult<Instrumentinfo> result;
	public InstrumentService instrumentservice;
	instrumentAction() {
		instrumentservice = IMPServiceFactory.getInstrumentService();
	}
	public String add() 
	{
		return "addlist";
	}

	public String saveInstrument() throws Exception
	{
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = response.getWriter();
		try
		{
			Instrumentinfo iinfos = new Instrumentinfo();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			String timestamp = sdf.format(new Date());
			String dtal = request.getParameter("detail");
			String strs[] = dtal.split("\\|");
			for (int i=0; i<strs.length; i++)
			{
				String pdetails = strs[i];
				String pstrs[] = pdetails.split("\\^");
				for (int k=0; k<pstrs.length; k++)
				{
					if (k == 0)
					{
						mdate = pstrs[k];
					}
					else if (k == 1)
					{
						mname = pstrs[k];
					}
					else if (k == 2)
					{
						mchair = pstrs[k];
					}
					else if (k == 3)
					{
						mjoint = pstrs[k];
					}
					else if (k == 4)
					{
						mbelt = pstrs[k];
					}
					else if (k == 5)
					{
						mdumbbell = pstrs[k];
					}
					else if (k == 6)
					{
						mrecorder = pstrs[k];
					}
					else if (k == 7)
					{
						msupervisor = pstrs[k];
					}
					else if (k == 8)
					{
						mbelongpro = pstrs[k];
					}
					else if (k == 9)
					{
						mtotaltime = pstrs[k];
					}
					else if (k == 10)
					{
						mchairchoo = pstrs[k];
					}
					else if (k == 11)
					{
						mjointchoo = pstrs[k];
					}
					else if (k == 12)
					{
						mbeltchoo = pstrs[k];
					}
					else if (k == 13)
					{
						mdumbbellchoo = pstrs[k];
					}
				}
				iinfos.setMdate(mdate);
				iinfos.setMnumber(timestamp);
				iinfos.setMname(mname);
				iinfos.setMchair(mchair);
				iinfos.setMjoint(mjoint);
				iinfos.setMbelt(mbelt);
				iinfos.setMdumbbell(mdumbbell);
				iinfos.setMrecorder(mrecorder);
				iinfos.setMsupervisor(msupervisor);
				iinfos.setMtotaltime(mtotaltime);
				iinfos.setMchairchoo(mchairchoo);
				iinfos.setMjointchoo(mjointchoo);
				iinfos.setMbeltchoo(mbeltchoo);
				iinfos.setMdumbbellchoo(mdumbbellchoo);
				iinfos.setMbelongpro(mbelongpro);
				instrumentservice.saveInstrument(iinfos);
			}
			out.print("success");
		}catch(Exception e)
		{
			e.printStackTrace();
			out.print("error");
		}
		return null;
	}

	public String deletement() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String mnumber = request.getParameter("mnumber");// 活动id
			out = response.getWriter();
			flag = instrumentservice.deleInstrumentinfo(mnumber);
			if (flag) {
				out.print("success");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("删除失败！");
		} finally {
			out.flush();
			out.close();
		}
		return null;
    }
	
	public String delchoosement() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String aidstr = request.getParameter("mentid");// 活动id
			String strs[] = aidstr.split("\\|");
			for (int i=0; i<strs.length; i++)
			{
				out = response.getWriter();
				flag = instrumentservice.delementchoose(strs[i]);
			}
			if (flag) {
				out.print("success");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("删除失败！");
		} finally {
			out.flush();
			out.close();
		}
		return null;
    }
	
	public String mentmodify() throws Exception{
		HttpServletRequest request = getRequest();
		String mnumber = request.getParameter("mnumber");
		List<Instrumentinfo> ment = new ArrayList<Instrumentinfo>();

		try {
			ment = instrumentservice.lookInstrument(mnumber); // 获取活动信息
			if (ment!=null) {
				request.setAttribute("result", ment);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("mentedit");
	}
	
	public String mentview() throws Exception{
		HttpServletRequest request = getRequest();
		String mnumber = request.getParameter("mnumber");
		List<Instrumentinfo> ment = new ArrayList<Instrumentinfo>();

		try {
			ment = instrumentservice.lookInstrument(mnumber); // 获取活动信息
			if (ment!=null) {
				request.setAttribute("result", ment);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("mentview");
	}
	
	public String modifyment() throws Exception
	{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	String flag = "";
    	//SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		//String mnumber = sdf.format(new Date());
		String dtal = request.getParameter("detail");
		String strs[] = dtal.split("\\|");
		for (int i=0; i<strs.length; i++)
		{
			String pdetails = strs[i];
			String pstrs[] = pdetails.split("\\^");
			for (int k=0; k<pstrs.length; k++)
			{
				if (k == 0)
				{
					mentid = pstrs[k];
				}
				else if (k == 1)
				{
					mdate = pstrs[k];
				}
				else if (k == 2)
				{
					mname = pstrs[k];
				}
				else if (k == 3)
				{
					mchair = pstrs[k];
				}
				else if (k == 4)
				{
					mjoint = pstrs[k];
				}
				else if (k == 5)
				{
					mbelt = pstrs[k];
				}
				else if (k == 6)
				{
					mdumbbell = pstrs[k];
				}
				else if (k == 7)
				{
					mrecorder = pstrs[k];
				}
				else if (k == 8)
				{
					msupervisor = pstrs[k];
				}
				else if (k == 9)
				{
					mbelongpro = pstrs[k];
				}
				else if (k == 10)
				{
					mtotaltime = pstrs[k];
				}
				else if (k == 11)
				{
					mchairchoo = pstrs[k];
				}
				else if (k == 12)
				{
					mjointchoo = pstrs[k];
				}
				else if (k == 13)
				{
					mbeltchoo = pstrs[k];
				}
				else if (k == 14)
				{
					mdumbbellchoo = pstrs[k];
				}
				else if (k == 15)
				{
					mnumber = pstrs[k];
				}
			}
    	flag = instrumentservice.modifyment(mentid, mdate, mnumber, mname, mchair, mjoint, mbelt, mdumbbell, mrecorder, msupervisor, mtotaltime, mchairchoo, mjointchoo, mbeltchoo, mdumbbellchoo, mbelongpro);
		}
    	PrintWriter out = null;
    	try {
			out = response.getWriter();
			out.print(flag);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("error");
		} finally {
			out.flush();
			out.close();
		}
		return null;
	}
	
	private HttpServletRequest getRequest() {
		ActionContext ctx = ActionContext.getContext();
		return (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	}

	private HttpServletResponse getResponse() {
		ActionContext ctx = ActionContext.getContext();
		return (HttpServletResponse) ctx
				.get(ServletActionContext.HTTP_RESPONSE);
	}
	
	@Override
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
			result = instrumentservice.getQueryMentResult(firstindex, maxresult, 
					mdate, mname, mrecorder, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "instrumentmange";
	}
	
	public String viewacthistory() throws Exception{
		HttpServletRequest request = getRequest();
		String mnumber = request.getParameter("mnumber");
		List<Instrumenthistory> menthis = new ArrayList<Instrumenthistory>();

		try {
			menthis = instrumentservice.lookInstrumenthis(mnumber); // 获取活动信息
			if (menthis!=null) {
				request.setAttribute("result", menthis);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("viewmenthis");
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
	public QueryResult<Instrumentinfo> getResult() {
		return result;
	}
	public void setResult(QueryResult<Instrumentinfo> result) {
		this.result = result;
	}
    
}
