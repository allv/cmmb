package com.wootion.cmmb.view.action.volunteer;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.Volunteerhistory;
import com.wootion.cmmb.persistenc.po.bean.Volunteerinfo;
import com.wootion.cmmb.service.volunteer.VolunteerService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class volunteerAction extends BaseAction
{
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
    private String vid;
	private String vnumber;
	private String vtime;
	private String vname;
	private String vage;
	private String vgender;
	private String vphone;
	private String vspecialty;
	private String vcommunitywork;
	private String vstudy;
	private String vintention;
	private String vtrain;
	
	private QueryResult<Volunteerinfo> result;
	public VolunteerService volunteerservice;
	volunteerAction() {
		volunteerservice = IMPServiceFactory.getVolunteerService();
	}
	public String add() 
	{
		return "addlist";
	}

	public String saveVolunteer() throws Exception
	{
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = response.getWriter();
		try
		{
			Volunteerinfo vinfos = new Volunteerinfo();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
			String timestamp = sdf.format(new Date());
			String dtal = request.getParameter("detail");
			String pstrs[] = dtal.split("\\|");
			for (int k=0; k<pstrs.length; k++)
			{
				if (k == 0)
				{
					vname = pstrs[k];
				}
				else if (k == 1)
				{
					vage = pstrs[k];
				}
				else if (k == 2)
				{
					vgender = pstrs[k];
				}
				else if (k == 3)
				{
					vphone = pstrs[k];
				}
				else if (k == 4)
				{
					vspecialty = pstrs[k];
				}
				else if (k == 5)
				{
					vcommunitywork = pstrs[k];
				}
				else if (k == 6)
				{
					vstudy = pstrs[k];
				}
				else if (k == 7)
				{
					vintention = pstrs[k];
				}
				else if (k == 8)
				{
					vtrain = pstrs[k];
				}
			}
			vinfos.setVnumber(timestamp);
			vinfos.setVtime(vtime);
			vinfos.setVname(vname);
			vinfos.setVage(vage);
			vinfos.setVgender(vgender);
			vinfos.setVphone(vphone);
			vinfos.setVspecialty(vspecialty);
			vinfos.setVcommunitywork(vcommunitywork);
			vinfos.setVstudy(vstudy);
			vinfos.setVintention(vintention);
			vinfos.setVtrain(vtrain);
			volunteerservice.saveVolunteer(vinfos);
			out.print("success");
		}catch(Exception e)
		{
			e.printStackTrace();
			out.print("error");
		}
		return null;
	}

	public String deletevol() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String vnumber = request.getParameter("vnumber");// 活动id
			out = response.getWriter();
			flag = volunteerservice.deleVolunteerinfo(vnumber);
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
	
	public String delchoosevol() throws Exception {
		HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String vid = request.getParameter("vid");// 活动id
			out = response.getWriter();
			flag = volunteerservice.delevolchoose(vid);
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
	
	public String volmodify() throws Exception{
		HttpServletRequest request = getRequest();
		String vid = request.getParameter("vid");
		Volunteerinfo vol = new Volunteerinfo();

		try {
			vol = volunteerservice.lookVolunteer(vid);// 获取活动信息
			if (vol!=null) {
				request.setAttribute("result", vol);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("voledit");
	}
	
	public String volview() throws Exception{
		HttpServletRequest request = getRequest();
		String vid = request.getParameter("vid");
		Volunteerinfo vol = new Volunteerinfo();

		try {
			vol = volunteerservice.lookVolunteer(vid);// 获取活动信息
			if (vol!=null) {
				request.setAttribute("result", vol);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("volview");
	}
	
	public String modifyvol() throws Exception
	{
		HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	String flag = "";
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String vnumber = sdf.format(new Date());
		String dtal = request.getParameter("detail");
		String pstrs[] = dtal.split("\\|");
		for (int k=0; k<pstrs.length; k++)
		{
			if (k == 0)
			{
				vid = pstrs[k];
			}
			else if (k == 1)
			{
				vname = pstrs[k];
			}
			else if (k == 2)
			{
				vage = pstrs[k];
			}
			else if (k == 3)
			{
				vgender = pstrs[k];
			}
			else if (k == 4)
			{
				vphone = pstrs[k];
			}
			else if (k == 5)
			{
				vspecialty = pstrs[k];
			}
			else if (k == 6)
			{
				vcommunitywork = pstrs[k];
			}
			else if (k == 7)
			{
				vstudy = pstrs[k];
			}
			else if (k == 8)
			{
				vintention = pstrs[k];
			}
			else if (k == 9)
			{
				vtrain = pstrs[k];
			}
		}
    	flag = volunteerservice.modifyvol(vid, vnumber, vtime, vname, vage, vgender, vphone, vspecialty, vcommunitywork, vstudy, vintention, vtrain);
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
			result = volunteerservice.getQueryVolResult(firstindex, maxresult, 
					vname, vspecialty, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "volunteermange";
	}
	
	public String viewacthistory() throws Exception{
		HttpServletRequest request = getRequest();
		String vid = request.getParameter("vid");
		Volunteerhistory vol = new Volunteerhistory();

		try {
			vol = volunteerservice.lookVolunteerhis(vid);// 获取活动信息
			if (vol!=null) {
				request.setAttribute("result", vol);
			} else {
				return ("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ("error");
		}
		return ("viewacthis");
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
	public String getVid() {
		return vid;
	}
	public void setVid(String vid) {
		this.vid = vid;
	}
	public String getVnumber() {
		return vnumber;
	}
	public void setVnumber(String vnumber) {
		this.vnumber = vnumber;
	}
	public String getVtime() {
		return vtime;
	}
	public void setVtime(String vtime) {
		this.vtime = vtime;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getVage() {
		return vage;
	}
	public void setVage(String vage) {
		this.vage = vage;
	}
	public String getVgender() {
		return vgender;
	}
	public void setVgender(String vgender) {
		this.vgender = vgender;
	}
	public String getVphone() {
		return vphone;
	}
	public void setVphone(String vphone) {
		this.vphone = vphone;
	}
	public String getVspecialty() {
		return vspecialty;
	}
	public void setVspecialty(String vspecialty) {
		this.vspecialty = vspecialty;
	}
	public String getVcommunitywork() {
		return vcommunitywork;
	}
	public void setVcommunitywork(String vcommunitywork) {
		this.vcommunitywork = vcommunitywork;
	}
	public String getVstudy() {
		return vstudy;
	}
	public void setVstudy(String vstudy) {
		this.vstudy = vstudy;
	}
	public String getVintention() {
		return vintention;
	}
	public void setVintention(String vintention) {
		this.vintention = vintention;
	}
	public String getVtrain() {
		return vtrain;
	}
	public void setVtrain(String vtrain) {
		this.vtrain = vtrain;
	}
	public QueryResult<Volunteerinfo> getResult() {
		return result;
	}
	public void setResult(QueryResult<Volunteerinfo> result) {
		this.result = result;
	}
    
}
