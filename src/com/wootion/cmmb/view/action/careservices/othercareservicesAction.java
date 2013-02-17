package com.wootion.cmmb.view.action.careservices;

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
import com.wootion.cmmb.persistenc.po.bean.Activityinfo;
import com.wootion.cmmb.persistenc.po.bean.Othercareserviceshistory;
import com.wootion.cmmb.persistenc.po.bean.Othercareservicesinfo;
import com.wootion.cmmb.persistenc.po.bean.bathrecordinfo;
import com.wootion.cmmb.service.careservices.BathrecordService;
import com.wootion.cmmb.service.careservices.OthercareservicesService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class othercareservicesAction extends BaseAction{

	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
    private String oid;
    private String onumber;
    private String odate;
    private String oname;
    private String ocontent;
    private String ostarttime;
    private String oendtime;
    private String opeople;
    private String oevaluation;
    private String oinfo;
    private String obelongpro;
    
    private QueryResult<Othercareservicesinfo> result;
    public OthercareservicesService othercareservicesservice;
    othercareservicesAction()
    {
    	othercareservicesservice = IMPServiceFactory.getOthercareservicesService();
    }
    
    public String add() 
	{
		return "addlist";
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
			result = othercareservicesservice.getQueryCarResult(firstindex, maxresult, 
					odate, oname, opeople, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "othercareservicesmange";
	}
	
	public String saveOthercareservices() throws Exception
	{
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = response.getWriter();
		try
		{
			Othercareservicesinfo oinfos = new Othercareservicesinfo();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
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
						odate = pstrs[k];
					}
					else if (k == 1)
					{
						oname = pstrs[k];
					}
					else if (k == 2)
					{
						ocontent = pstrs[k];
					}
					else if (k == 3)
					{
						ostarttime = pstrs[k];
					}
					else if (k == 4)
					{
						oendtime = pstrs[k];
					}
					else if (k == 5)
					{
						opeople = pstrs[k];
					}
					else if (k == 6)
					{
						oevaluation = pstrs[k];
					}
					else if (k == 7)
					{
						oinfo = pstrs[k];
					}
					else if (k == 8)
					{
						obelongpro = pstrs[k];
					}
				}
				oinfos.setOdate(odate);
				oinfos.setOnumber(timestamp);
				oinfos.setOname(oname);
				oinfos.setOcontent(ocontent);
				oinfos.setOstarttime(ostarttime);
				oinfos.setOendtime(oendtime);
				oinfos.setOpeople(opeople);
				oinfos.setOevaluation(oevaluation);
				oinfos.setOinfo(oinfo);
				oinfos.setObelongpro(obelongpro);
				
				othercareservicesservice.saveOthercareservices(oinfos);
				
			}
			out.print("success");
		}catch(Exception e)
		{
			e.printStackTrace();
			out.print("error");
		}
		
		return null;
	}
	
	public String carmodify() throws Exception{
		HttpServletRequest request = getRequest();
		String onumber = request.getParameter("onumber");
		List<Othercareservicesinfo> car = new ArrayList<Othercareservicesinfo>();

		try {
			car = othercareservicesservice.lookOthercareservices(onumber);// 获取活动信息
			if (car!=null) {
				request.setAttribute("result", car);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("caredit");
	}
	
	public String carview() throws Exception{
		HttpServletRequest request = getRequest();
		String onumber = request.getParameter("onumber");
		List<Othercareservicesinfo> car = new ArrayList<Othercareservicesinfo>();

		try {
			car = othercareservicesservice.lookOthercareservices(onumber);// 获取活动信息
			if (car!=null) {
				request.setAttribute("result", car);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("carview");
	}
	
	public String modifycar() throws Exception
	{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	String flag = "";
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String onumber = sdf.format(new Date());
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
					oid = pstrs[k];
				}
				else if (k == 1)
				{
					odate = pstrs[k];
				}
				else if (k == 2)
				{
					oname = pstrs[k];
				}
				else if (k == 3)
				{
					ocontent = pstrs[k];
				}
				else if (k == 4)
				{
					ostarttime = pstrs[k];
				}
				else if (k == 5)
				{
					oendtime = pstrs[k];
				}
				else if (k == 6)
				{
					opeople = pstrs[k];
				}
				else if (k == 7)
				{
					oevaluation = pstrs[k];
				}
				else if (k == 8)
				{
					oinfo = pstrs[k];
				}
				else if (k == 9)
				{
					obelongpro = pstrs[k];
				}
			}
			
    	flag = othercareservicesservice.modifycar(oid, odate, onumber, oname, ocontent, ostarttime, oendtime, opeople, oevaluation, oinfo, obelongpro);
		
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
	
	public String deletecar() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String onumber = request.getParameter("onumber");// 活动id
			out = response.getWriter();
			flag = othercareservicesservice.deleOthercareservicesinfo(onumber);
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
	
	public String delchoosecar() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String aidstr = request.getParameter("oid");// 活动id
			String strs[] = aidstr.split("\\|");
			for (int i=0; i<strs.length; i++)
			{
				out = response.getWriter();
				flag = othercareservicesservice.delecarchoose(strs[i]);
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
	
	public String viewacthistory() throws Exception{
		HttpServletRequest request = getRequest();
		String onumber = request.getParameter("onumber");
		List<Othercareserviceshistory> carhis = new ArrayList<Othercareserviceshistory>();

		try {
			carhis = othercareservicesservice.lookOthercareserviceshis(onumber);// 获取活动信息
			if (carhis!=null) {
				request.setAttribute("result", carhis);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("viewacthis");
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

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getOnumber() {
		return onumber;
	}

	public void setOnumber(String onumber) {
		this.onumber = onumber;
	}

	public String getOdate() {
		return odate;
	}

	public void setOdate(String odate) {
		this.odate = odate;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getOcontent() {
		return ocontent;
	}

	public void setOcontent(String ocontent) {
		this.ocontent = ocontent;
	}

	public String getOstarttime() {
		return ostarttime;
	}

	public void setOstarttime(String ostarttime) {
		this.ostarttime = ostarttime;
	}

	public String getOendtime() {
		return oendtime;
	}

	public void setOendtime(String oendtime) {
		this.oendtime = oendtime;
	}

	public String getOpeople() {
		return opeople;
	}

	public void setOpeople(String opeople) {
		this.opeople = opeople;
	}

	public String getOevaluation() {
		return oevaluation;
	}

	public void setOevaluation(String oevaluation) {
		this.oevaluation = oevaluation;
	}

	public String getOinfo() {
		return oinfo;
	}

	public void setOinfo(String oinfo) {
		this.oinfo = oinfo;
	}

	public String getObelongpro() {
		return obelongpro;
	}

	public void setObelongpro(String obelongpro) {
		this.obelongpro = obelongpro;
	}

	public QueryResult<Othercareservicesinfo> getResult() {
		return result;
	}

	public void setResult(QueryResult<Othercareservicesinfo> result) {
		this.result = result;
	}
	
}
