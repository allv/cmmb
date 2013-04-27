package com.wootion.cmmb.view.action.membermanage;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cimp.services.memberHealthService;
import com.wootion.cimp.services.memberService;
import com.wootion.cimp.vo.data.Member;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class memlistAction extends BaseAction
{
    private String              nowpage       = null; // 页码

    private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;

    //会员主鍵
    private String meminfoid;
    //会员姓名
    private String memname;
    //会员编号
    private String memid;
    //性别
    private String memsex;
    //身份证号码
    private String  creditid;
    //出生年月
    private String birthday;
    //文化程度
    private String culture;
    //曾从事职业
    private String professor;
    //经济情况
    private String financial;
    //婚姻情况
    private String marry;
    //生育情况
    private String kids;
    //入会方式
    private String ways;
    //入会时间
    private String enterdate;
    //居住情况
    private String reside;
    //付费情况
    private String fees;
    
    //家庭地址
    private String myaddress;

    private String r2;
    
    private String r3;

    private QueryResult<Member> result;
    
    private String isHaveData ;

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) 
    {
        Integer firstindex = 1;//当前页数
        Integer maxresult = 10;//每页显示数
        String chooseflag = (String)request.getParameter("chooseflag");
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
        
        memberService memService = IMPServiceFactory.getMemberService();
        memberHealthService hevalservice = IMPServiceFactory.getMemberHealthService();
        String adlmarks = (String)request.getParameter("adlmarks");
        String adlmarks2 = (String)request.getParameter("adlmarks2");
        String listen = (String)request.getParameter("listen");
        String view = (String)request.getParameter("view");
        String smoke = (String)request.getParameter("smoke");
        String drink = (String)request.getParameter("drink");
        String mycity = (String)request.getParameter("mycity");
        
        //月收入
        String swage = (String)request.getParameter("swage");
        String ewage = (String)request.getParameter("ewage");
        
        String memname = (String)request.getParameter("memname");
        String memid = (String)request.getParameter("memid");
        String memsex = (String)request.getParameter("memsex");
        String culture = (String)request.getParameter("culture");
        String reside = (String)request.getParameter("reside");
        String financial = (String)request.getParameter("financial");
        String myaddress = (String)request.getParameter("myaddress");
        //取出所有符合条件的memnumber 从healthinfo表中
        try {
        	String allmemnumbers = "";
        	if(adlmarks!=null&&adlmarks2!=null&&listen!=null&&view!=null&&smoke!=null&&drink!=null){
        		if(!adlmarks.trim().equals("")||!adlmarks2.trim().equals("")||!listen.trim().equals("-1")||!view.trim().equals("-1")
        				||!smoke.trim().equals("-1")||!drink.trim().equals("-1")){
        		   allmemnumbers = hevalservice.filterMemberNumbers(adlmarks,adlmarks2,listen,view,smoke,drink);
        		}
        	}
			result = memService.getQueryProResult(firstindex, maxresult,
					enterdate, memname, swage,ewage,memid,memsex,culture,reside,financial,myaddress,allmemnumbers,mycity,
			         request.getSession().getId(),chooseflag);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch(Exception ee){
			ee.printStackTrace();
		}
		if(chooseflag==null||chooseflag==""){
			return SUCESS;
		}else{
			return "choosemem";
		}
    }

    public QueryResult<Member> getResult()
    {
        return result;
    }

    public void setResult(QueryResult<Member> result)
    {
        this.result = result;
    }

    public String getNowpage()
    {
        return nowpage;
    }

    public void setNowpage(String nowpage)
    {
        this.nowpage = nowpage;
    }

    public String getMaxpage()
    {
        return maxpage;
    }

    public void setMaxpage(String maxpage)
    {
        this.maxpage = maxpage;
    }

   
    public String getPerPageNumber()
    {
        return perPageNumber;
    }

    public void setPerPageNumber(String perPageNumber)
    {
        this.perPageNumber = perPageNumber;
    }

	public String getMeminfoid() {
		return meminfoid;
	}

	public void setMeminfoid(String meminfoid) {
		this.meminfoid = meminfoid;
	}

	public String getMemname() {
		return memname;
	}

	public void setMemname(String memname) {
		this.memname = memname;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

	public String getMemsex() {
		return memsex;
	}

	public void setMemsex(String memsex) {
		this.memsex = memsex;
	}

	public String getCreditid() {
		return creditid;
	}

	public void setCreditid(String creditid) {
		this.creditid = creditid;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getCulture() {
		return culture;
	}

	public void setCulture(String culture) {
		this.culture = culture;
	}

	public String getProfessor() {
		return professor;
	}

	public void setProfessor(String professor) {
		this.professor = professor;
	}

	public String getFinancial() {
		return financial;
	}

	public void setFinancial(String financial) {
		this.financial = financial;
	}

	public String getMarry() {
		return marry;
	}

	public void setMarry(String marry) {
		this.marry = marry;
	}

	public String getKids() {
		return kids;
	}

	public void setKids(String kids) {
		this.kids = kids;
	}

	public String getWays() {
		return ways;
	}

	public void setWays(String ways) {
		this.ways = ways;
	}

	public String getEnterdate() {
		return enterdate;
	}

	public void setEnterdate(String enterdate) {
		this.enterdate = enterdate;
	}

	public String getReside() {
		return reside;
	}

	public void setReside(String reside) {
		this.reside = reside;
	}

	public String getFees() {
		return fees;
	}

	public void setFees(String fees) {
		this.fees = fees;
	}

	public String getR2() {
		return r2;
	}

	public void setR2(String r2) {
		this.r2 = r2;
	}

	public String getR3() {
		return r3;
	}

	public void setR3(String r3) {
		this.r3 = r3;
	}

	public String getIsHaveData() {
		return isHaveData;
	}

	public void setIsHaveData(String isHaveData) {
		this.isHaveData = isHaveData;
	}

	public String getMyaddress() {
		return myaddress;
	}

	public void setMyaddress(String myaddress) {
		this.myaddress = myaddress;
	}

}