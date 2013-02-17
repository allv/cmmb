package com.wootion.idp.view.action.user;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.common.collections.PermissionCollection;
import com.wootion.idp.common.utils.EntityIDFactory;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.view.action.BaseAction;

public class AddUserAction extends BaseAction {
	private String username;

	private String password;
	/** 角色选择 */
	private String userRole;

	/** 大客户 */
    private String bigclient ;
    
    /** 子客户 */
    private String subclient ;
    
    /** 帐号类型 */
    private String type ;
    
    /** 公司全称 */
	private String corpName;

	/** 公司简介 */
	private String corpNote;

	/** 公司地址 */
	private String corpAdd;

	/** 邮编 */
	private Integer corpCode;

	/** 电话 */
	private String corpTel;

	/** 传真 */
	private String corpFax;

	/** 性别 */
	private String corpAP;

	/** 开户行 */
	private String openBank;

	/** 开户名 */
	private String openName;

	/** 银行账号 */
	private String bankID;

	/** 联系人姓名 */
	private String linkman;

	/** 联系人电话 */
	private String linkmanTel;

	/** 联系人email */
	private String linkmanEmail;

	/** 联系人地址 */
	private String linkmanAdd;
	
	
	
	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		if (ServiceFactroy.getUserService().isHaveUserName(username)) {
			request.setAttribute("msg", "账号名已存在！");
			return FAILURE;
		}

		try
        {
            Wtuser user = new Wtuser();
         
            String sessionID = request.getSession().getId();
            Long loginUserID = PermissionCollection.getInstance().getUserCache(
                    sessionID).getUserID();
            Wtuser loginUser = (Wtuser) ServiceFactroy.getUserService()
                    .getObjectByID(Wtuser.class, loginUserID);
            /*user.setUserrelate新帐号的父帐号
            {
                user.setUserrelate(loginUserID.toString());
            }else{
            	if(bigclient!=null&&!"undefined".equals(bigclient)&&!"-1".equals(bigclient)){
            		List<Wtuser> ulist = clientservice.getUserBelongToClient(bigclient);
            		if(ulist==null){
            			user.setUserrelate(loginUserID.toString());
            		}else{
            			user.setUserrelate(ulist.get(0).getWtuserId().toString());
            		}
            	}else{
            		if("a".equals(type))
            			user.setUserrelate("0");
            		if("f".equals(type))
            			user.setUserrelate(loginUserID.toString());
            	}
            }
               user.setPid(0L);
               //user.setUserrelate("0");
            }
            else{
               user.setPid(10001L);
            }*/
            user.setWtuserIsuseable("1");
            user.setIsCheck(1);
            user.setWtuserCreatetime(new Date());
            user.setWtuserId(EntityIDFactory.getBeanID());
            user.setWtuserLoginname(username);
            user.setWtuserPassword(password);
            user.setWtuserLastlogintime(new Date());
            user.setIsDelete(0);
            user.setCorpName(corpName);
            
            user.setBankID(bankID);
            user.setCorpAP(corpAP);
            user.setCorpCode(corpCode);
            user.setCorpFax(corpFax);
            user.setCorpNote(corpNote);
            user.setCorpTel(corpTel);
            user.setLinkman(linkman);
            user.setLinkmanAdd(linkmanAdd);
            user.setLinkmanEmail(linkmanEmail);
            user.setLinkmanTel(linkmanTel);
            user.setOpenBank(openBank);
            user.setOpenName(openName);
            user.setCorpAdd(corpAdd);
            //10001:管理员角色  10002：行政人员 10003：护理人员 10004：康复人员
            userRole="10002";
//            if(null!=type){
//            	if("x".equals(type)){
//            		userRole="10002";
//            	}else if("h".equals(type)){
//            		userRole="10003";
//            	}else if("k".equals(type)){
//            		userRole="10004";
//            	}
//            }
            
            /*
            if(null==type||"undefined".equals(type)){
            	userRole="10003";
        		Wtclient c = new Wtclient();
        		c.setWtclientId(subclient);
        		user.setWtclient(c);
            }else{
	            if("a".equals(type)){
	            	userRole="10001";
	            	Wtclient c = new Wtclient();
	            	Random r = new Random();
	            	String cid = String.valueOf(r.nextLong());
	            	c.setClientname("superAdmin");
	    			c.setWtclientId(cid);
	    			c.setWtuserCreatetime(new Date());
	    			c.setParentid("0001");
	    			c.setClientfeature("1");
	    			clientservice.saveObject(c);
	            	user.setWtclient(c);
	            }else if("g".equals(type)){
		            if(bigclient!=null&&!"-1".equals(bigclient)){
		            	if(subclient!=null&&!"-1".equals(subclient)){
		            		userRole="10003";
		            		Wtclient c = new Wtclient();
		            		c.setWtclientId(subclient);
		            		user.setWtclient(c);
		            	}else{
		            		Wtclient c = new Wtclient();
		            		c.setWtclientId(bigclient);
		            		user.setWtclient(c);
		            		userRole="10002";
		            	}
		            }else{
		            	Wtclient c = new Wtclient();
		        		c.setWtclientId(subclient);
		        		userRole="10003";
		        		user.setWtclient(c);
		            }
	            }else if("f".equals(type)){
	            	userRole="10004";
	            	Wtclient c = new Wtclient();
	//            	Random r = new Random();
	//            	String cid = String.valueOf(r.nextLong());
	            	c.setWtclientId("1000002");
	            	user.setWtclient(c);
	            }
            }
//            RoleManagerService roleService = ServiceFactroy.getRoleService();
//            List<Wtrole> roleList = roleService.getRecords();
//            Wtrole wr = new Wtrole();
//            for(int i=0;i<roleList.size();i++){
//            	String rid = String.valueOf(roleList.get(i).getWtroleId());
//            	if(rid.equals(userRole)){
//            		 wr = roleList.get(i);
//            	}
//            }*/
            //ServiceFactroy.getUserService().addObject(user);
            ServiceFactroy.getUserService().saveUserandRole(user, userRole);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            request.setAttribute("back", request.getContextPath()
                    + "/queryuser.do");
                request.setAttribute("msg", "新增用户失败!");
                request.setAttribute("type", "error");
                return SUCESS;
        }
        request.setAttribute("back", request.getContextPath()
						+ "/queryuser.do");
		request.setAttribute("msg", "新增用户成功!");
		request.setAttribute("type", "ok");
		return SUCESS;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

    public String getUserRole()
    {
        return userRole;
    }

    public void setUserRole(String userRole)
    {
        this.userRole = userRole;
    }

	public String getBigclient() {
		return bigclient;
	}

	public void setBigclient(String bigclient) {
		this.bigclient = bigclient;
	}

	public String getSubclient() {
		return subclient;
	}

	public void setSubclient(String subclient) {
		this.subclient = subclient;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCorpName() {
		return corpName;
	}

	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}

	public String getCorpNote() {
		return corpNote;
	}

	public void setCorpNote(String corpNote) {
		this.corpNote = corpNote;
	}

	public String getCorpAdd() {
		return corpAdd;
	}

	public void setCorpAdd(String corpAdd) {
		this.corpAdd = corpAdd;
	}

	public Integer getCorpCode() {
		return corpCode;
	}

	public void setCorpCode(Integer corpCode) {
		this.corpCode = corpCode;
	}

	public String getCorpTel() {
		return corpTel;
	}

	public void setCorpTel(String corpTel) {
		this.corpTel = corpTel;
	}

	public String getCorpFax() {
		return corpFax;
	}

	public void setCorpFax(String corpFax) {
		this.corpFax = corpFax;
	}

	public String getCorpAP() {
		return corpAP;
	}

	public void setCorpAP(String corpAP) {
		this.corpAP = corpAP;
	}

	public String getOpenBank() {
		return openBank;
	}

	public void setOpenBank(String openBank) {
		this.openBank = openBank;
	}

	public String getOpenName() {
		return openName;
	}

	public void setOpenName(String openName) {
		this.openName = openName;
	}

	public String getBankID() {
		return bankID;
	}

	public void setBankID(String bankID) {
		this.bankID = bankID;
	}

	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getLinkmanTel() {
		return linkmanTel;
	}

	public void setLinkmanTel(String linkmanTel) {
		this.linkmanTel = linkmanTel;
	}

	public String getLinkmanEmail() {
		return linkmanEmail;
	}

	public void setLinkmanEmail(String linkmanEmail) {
		this.linkmanEmail = linkmanEmail;
	}

	public String getLinkmanAdd() {
		return linkmanAdd;
	}

	public void setLinkmanAdd(String linkmanAdd) {
		this.linkmanAdd = linkmanAdd;
	}

	
}