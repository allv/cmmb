package com.wootion.cmmb.view.action.membermanage;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cimp.services.memberService;
import com.wootion.cimp.util.PageBasicInfo;
import com.wootion.cimp.vo.data.Member;
import com.wootion.cimp.vo.data.Memberhistory;
import com.wootion.cmmb.common.workflow.WorkflowHandle;
import com.wootion.idp.common.utils.QueryResult;

public class MemActionImpl implements MemAction ,WorkflowHandle
{
	private PageBasicInfo pageObj = null;
	public memberService memservice;  
	
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

	private String              perPageNumber = null;
	
	//文件名参数变量  
    private String fileName;  
  
    /* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#getFileName()
	 */
    @Override
	public String getFileName() {  
        return fileName;  
    }  
  
    /* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#setFileName(java.lang.String)
	 */
    @Override
	public void setFileName(String fileName) {  
        this.fileName = fileName;  
    }  
	
	//会员姓名
    private String memname;
    //会员编号
    private String memid;
    //修改日期
    private String submitdate;
	
	private QueryResult<Memberhistory> result;
	
	
    /* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#addmem()
	 */
    @Override
	public String addmem() throws Exception 
    {
    	HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	String flag = "";
		String memname = request.getParameter("memname").trim();
		String memid = request.getParameter("memid").trim();
		String memsex = request.getParameter("memsex").trim();
		String creditid = request.getParameter("creditid").trim();
		String birthday = request.getParameter("birthday").trim();
		String culture = request.getParameter("culture").trim();
		String professor = request.getParameter("professor").trim();
		String financial = request.getParameter("financial").trim();
		String marry = request.getParameter("marry").trim();
		String kids = request.getParameter("kids").trim();
		String ways = request.getParameter("ways").trim();
		String enterdate = request.getParameter("enterdate").trim();
		String reside = request.getParameter("reside").trim();
		String fees = request.getParameter("fees").trim();
		
		String mycellnumber = request.getParameter("mycellnumber").trim();
		String mylandlinenumber = request.getParameter("mylandlinenumber").trim();
		String myaddress = request.getParameter("myaddress").trim();
		String mycounty = request.getParameter("mycounty").trim();
		String mystreet = request.getParameter("mystreet").trim();
		String mycity = request.getParameter("mycity").trim();
		String myemail = request.getParameter("myemail").trim();
		String mynation = request.getParameter("mynation").trim();
		String coname = request.getParameter("coname").trim();
		String relationship = request.getParameter("relationship").trim();
		String concellnumber = request.getParameter("concellnumber").trim();
		String connumber = request.getParameter("connumber").trim();
		String conaddress = request.getParameter("conaddress").trim();
		String concity = request.getParameter("concity").trim();
		String conpost = request.getParameter("conpost").trim();
		String concountry = request.getParameter("concountry").trim();
		
		String assessment = request.getParameter("assessment").trim();
		String asesdate = request.getParameter("asesdate").trim();
		String beizhu = request.getParameter("beizhu").trim();
		
		//UserCacheBean uc = PermissionCollection.getInstance().getUserCache(
		//		request.getSession().getId());
		//Long userIdt = uc.getUserID();
		
	    flag = memservice.saveMem(memname,  memid,
	             memsex, creditid, birthday, culture, professor, financial, marry, kids, ways, enterdate, reside, fees,
	              mycellnumber, mylandlinenumber, myaddress, mycounty, mystreet, mycity, myemail, mynation, coname,
	              relationship, concellnumber, connumber, conaddress, concity, conpost, concountry,assessment,asesdate,beizhu);
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
    
    /* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#premodify()
	 */
    @Override
	public String premodify() throws Exception{
    	HttpServletRequest request = getRequest();
		String meminfoid = request.getParameter("meminfoid");
		Member member = new Member();
		
		try {
			member = memservice.lookMember(meminfoid);// 获取会员信息
	    if (member!=null) {
	        request.setAttribute("mem", member);
	    } else {
	        return ("error");
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    return ("error");
	}
		return ("memedit");
    }
    
    /* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#modifymem()
	 */
    @Override
	public String modifymem() throws Exception 
    {
    	HttpServletRequest request = getRequest();
    	HttpServletResponse response = getResponse();
    	String flag = "";
    	String memname = request.getParameter("memname").trim();
		String memid = request.getParameter("memid").trim();
		String memsex = request.getParameter("memsex").trim();
		String creditid = request.getParameter("creditid").trim();
		String birthday = request.getParameter("birthday").trim();
		String culture = request.getParameter("culture").trim();
		String professor = request.getParameter("professor").trim();
		String financial = request.getParameter("financial").trim();
		String marry = request.getParameter("marry").trim();
		String kids = request.getParameter("kids").trim();
		String ways = request.getParameter("ways").trim();
		String enterdate = request.getParameter("enterdate").trim();
		String reside = request.getParameter("reside").trim();
		String fees = request.getParameter("fees").trim();
		
		String mycellnumber = request.getParameter("mycellnumber").trim();
		String mylandlinenumber = request.getParameter("mylandlinenumber").trim();
		String myaddress = request.getParameter("myaddress").trim();
		String mycounty = request.getParameter("mycounty").trim();
		String mystreet = request.getParameter("mystreet").trim();
		String mycity = request.getParameter("mycity").trim();
		String myemail = request.getParameter("myemail").trim();
		String mynation = request.getParameter("mynation").trim();
		String coname = request.getParameter("coname").trim();
		String relationship = request.getParameter("relationship").trim();
		String concellnumber = request.getParameter("concellnumber").trim();
		String connumber = request.getParameter("connumber").trim();
		String conaddress = request.getParameter("conaddress").trim();
		String concity = request.getParameter("concity").trim();
		String conpost = request.getParameter("conpost").trim();
		String concountry = request.getParameter("concountry").trim();
		
		String assessment = request.getParameter("assessment").trim();
		String asesdate = request.getParameter("asesdate").trim();
		String beizhu = request.getParameter("beizhu").trim();
		String meminfoid = request.getParameter("meminfoid").trim();
		//UserCacheBean uc = PermissionCollection.getInstance().getUserCache(
		//		request.getSession().getId());
		//Long userIdt = uc.getUserID();  
		  
	    flag = memservice.modifyMem(meminfoid,memname,  memid,
	             memsex, creditid, birthday, culture, professor, financial, marry, kids, ways, enterdate, reside, fees,
	              mycellnumber, mylandlinenumber, myaddress, mycounty, mystreet, mycity, myemail, mynation, coname,
	              relationship, concellnumber, connumber, conaddress, concity, conpost, concountry,assessment,asesdate,beizhu);
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
    
    /* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#hislist()
	 */
    @Override
	public String hislist()throws Exception{
    	HttpServletRequest request = getRequest();
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
        
        memberService memService = IMPServiceFactory.getMemberService();
        try {
			result = memService.getQueryMemhisResult(firstindex, maxresult,
					submitdate, memname, memid,
			         request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "memhislist";
    }
    
    /* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#statistics()
	 */
    @Override
	public String statistics()throws Exception{
    	HttpServletRequest request = getRequest();
    	//会员编号
    	String memid = (String)request.getParameter("meminfoid");
    	//此处找出所有跟该会员相关的记录血压 脉搏 评估分数
    	List<String> marks = memservice.getCaremark(memid);
    	request.setAttribute("data", marks);
    	return "memstatic";
    }
    
    /* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#deleteFile()
	 */
    @Override
	public void deleteFile()throws Exception{
    	//删除服务器上的图片文件
    	HttpServletRequest request = getRequest();
		String filename = request.getParameter("filename");//文件名
		String serverpath = request.getSession().getServletContext().getRealPath("/")+"temp/"; 
		
		File file=new File(serverpath+filename);
		if(file.exists())
		   file.delete();
    }
    
    /* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#GetFile()
	 */
    @Override
	public void GetFile()throws Exception{
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		//PrintWriter out = null;
		String filename = request.getParameter("filename");//文件名
		String serverpath = request.getSession().getServletContext().getRealPath("/")+"temp/"; 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	    String sdate = sdf.format(new Date());
	    //设置客户端文件名
	    String clientfilename = sdate+".png";
		//OutputStream myout = new FileOutputStream(new File(serverpath+clientfilename));
	    OutputStream myout = null;
		FileInputStream fis=null;
		try{
			File file=new File(serverpath+filename);
			
			//设置response的编码方式
	        response.setContentType("application/x-msdownload");
	
	        //写明要下载的文件的大小
	        response.setContentLength((int)file.length());
	       
	        //解决中文乱码
	        response.setHeader("Content-Disposition","attachment;filename="+filename);       
	        
	        //读出文件到i/o流
	        fis=new FileInputStream(file);
	        //从response对象中得到输出流,准备下载
	        myout=response.getOutputStream();
	        
	        byte [] b=new byte[1024];//相当于我们的缓存
	
	        int len = 0;//该值用于计算当前实际下载了多少字节
	        //开始循环下载
            while((len = fis.read(b))!=-1){
            	myout.write(b, 0, len);
            }
	
	        //将写入到客户端的内存的数据,刷新到磁盘
	        myout.flush();
	         //out.print("success");
		 }catch(Exception e){
			 System.out.println(e.getMessage());
			 // out.print("error");
	     }finally{
	    	 fis.close();
	    	 myout.close();
	     }
    }
    
    /* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#deletemem()
	 */
    @Override
	public String deletemem() throws Exception {
    	HttpServletRequest request = getRequest();
		HttpServletResponse response = getResponse();
		PrintWriter out = null;
		boolean flag = false;
		try {
			String memid = request.getParameter("meminfoid");// 会员ID
			out = response.getWriter();
			flag = memservice.deleMember(memid);
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
    
    /* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#viewmem()
	 */
    @Override
	public String viewmem()throws Exception{
    	HttpServletRequest request = getRequest();
		String meminfoid = request.getParameter("meminfoid");
		Member mem = new Member();
		
		try {
			mem = memservice.lookMember(meminfoid);// 获取会员信息
	    if (mem!=null) {
	        request.setAttribute("mem", mem);
	    } else {
	        return ("error");
	    }
		} catch (Exception e) {
		    e.printStackTrace();
		    return ("error");
		}
			return ("memdetail");
    }
    
    
    /* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#viewmemhis()
	 */
    @Override
	public String viewmemhis()throws Exception{
    	HttpServletRequest request = getRequest();
		String meminfoid = request.getParameter("meminfoid");
		Memberhistory mem = new Memberhistory();
		
		try {
			mem = memservice.lookMemberhis(meminfoid);// 获取历史记录
	    if (mem!=null) {
	        request.setAttribute("mem", mem);
	    } else {
	        return ("error");
	    }
		} catch (Exception e) {
		    e.printStackTrace();
		    return ("error");
		}
			return ("memhisdetail");
    }
    /* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#page(javax.servlet.http.HttpServletRequest, com.wootion.cimp.util.PageBasicInfo)
	 */

	@Override
	public void page(HttpServletRequest request, PageBasicInfo pageObj) {
		// 获得要查询的页数
		String pageStr = request.getParameter("currentPage") == null ? ""
				: request.getParameter("currentPage");

		// 获得每页最多显示多少条记录
		if (request.getParameter("maxRecords") != null) {
			int maxRecords = Integer.parseInt((String) request
					.getParameter("maxRecords"));
			pageObj.setMaxRecords(maxRecords);
		}

		if (!pageStr.equals(""))// 空说明，为默认的第一页
		{
			int currentPage = Integer.parseInt(pageStr);
			pageObj.setCurrentPage(currentPage);
		}
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

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#getPageObj()
	 */
	@Override
	public PageBasicInfo getPageObj() {
		return pageObj;
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#setPageObj(com.wootion.cimp.util.PageBasicInfo)
	 */
	@Override
	public void setPageObj(PageBasicInfo pageObj) {
		this.pageObj = pageObj;
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#getNowpage()
	 */
	@Override
	public String getNowpage() {
		return nowpage;
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#setNowpage(java.lang.String)
	 */
	@Override
	public void setNowpage(String nowpage) {
		this.nowpage = nowpage;
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#getMaxpage()
	 */
	@Override
	public String getMaxpage() {
		return maxpage;
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#setMaxpage(java.lang.String)
	 */
	@Override
	public void setMaxpage(String maxpage) {
		this.maxpage = maxpage;
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#getPerPageNumber()
	 */
	@Override
	public String getPerPageNumber() {
		return perPageNumber;
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#setPerPageNumber(java.lang.String)
	 */
	@Override
	public void setPerPageNumber(String perPageNumber) {
		this.perPageNumber = perPageNumber;
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#getResult()
	 */
	@Override
	public QueryResult<Memberhistory> getResult() {
		return result;
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#setResult(com.wootion.idp.common.utils.QueryResult)
	 */
	@Override
	public void setResult(QueryResult<Memberhistory> result) {
		this.result = result;
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#getMemname()
	 */
	@Override
	public String getMemname() {
		return memname;
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#setMemname(java.lang.String)
	 */
	@Override
	public void setMemname(String memname) {
		this.memname = memname;
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#getMemid()
	 */
	@Override
	public String getMemid() {
		return memid;
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#setMemid(java.lang.String)
	 */
	@Override
	public void setMemid(String memid) {
		this.memid = memid;
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#getSubmitdate()
	 */
	@Override
	public String getSubmitdate() {
		return submitdate;
	}

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.view.action.membermanage.MemAction#setSubmitdate(java.lang.String)
	 */
	@Override
	public void setSubmitdate(String submitdate) {
		this.submitdate = submitdate;
	}

	@Override
	public String getBillid() {
		return getRequest().getParameter("meminfoid");
	}

	@Override
	public Long getFormid() {
		return 100002L;
	}

	public memberService getMemservice() {
		return memservice;
	}

	public void setMemservice(memberService memservice) {
		this.memservice = memservice;
	}
	
}