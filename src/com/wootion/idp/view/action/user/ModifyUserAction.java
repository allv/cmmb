package com.wootion.idp.view.action.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.user.UserManagerService;
import com.wootion.idp.view.action.BaseAction;

public class ModifyUserAction extends BaseAction
{
    private Long    userID;
    
    /**帐号名*/
    private String  username;
    
    private String  password2;
    
	private String corpName;

	private String corpNote;

	private String corpAdd;

	private Integer corpCode;

	private String corpTel;

	private String corpFax;

	private String corpAP;

	private String openBank;

	private String openName;

	private String bankID;

	private String linkman;

	private String linkmanTel;

	private String linkmanEmail;

	private String linkmanAdd;
	
	private List<String> selectedRoles;
	
	private String department;
    
    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response)
    {
        UserManagerService userService = ServiceFactroy.getUserService();
        Wtuser user = (Wtuser) userService.getObjectByID(Wtuser.class, userID);
        if (user != null)
        {
        	  user.setWtuserLoginname(username);
        	  //user.setWtuserPassword(password2);
              user.setCorpName(corpName);
              user.setCorpNote(corpNote);
              user.setCorpAdd(corpAdd);
              user.setCorpCode(corpCode);
              user.setCorpTel(corpTel);
              user.setCorpFax(corpFax);
              user.setCorpAP(corpAP);
              user.setOpenBank(openBank);
              user.setOpenName(openName);
              user.setBankID(bankID);
              user.setLinkman(linkman);
              user.setLinkmanTel(linkmanTel);
              user.setLinkmanEmail(linkmanEmail);
              user.setLinkmanAdd(linkmanAdd);
              user.setDepartment(department);
//            user.setWtuserIsuseable(wtuserIsuseable);
//            user.setUserMark(userMark);
//            user.setUserExtendMark(userExtendMark);
//            user.setFtpAccount(ftpAccount);
//    		user.setFtppwd(ftppwd);
            userService.modifyUserWithRoles(user, selectedRoles);
            request.setAttribute("msg", "修改用户信息成功！！");
            request.setAttribute("type", "ok");
        }
        else
        {
            request.setAttribute("msg", "修改用户信息失败！");
            request.setAttribute("type", "err");
        }

        request
                .setAttribute("back", request.getContextPath()
                        + "/queryuser.do");

        return SUCESS;
    }

    public Long getUserID()
    {
        return userID;
    }

    public void setUserID(Long userID)
    {
        this.userID = userID;
    }

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public List<String> getSelectedRoles() {
		return selectedRoles;
	}

	public void setSelectedRoles(List<String> selectedRoles) {
		this.selectedRoles = selectedRoles;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

//	public void setFtpAccount(String ftpAccount) {
//		this.ftpAccount = ftpAccount;
//	}
//
//	public String getFtppwd() {
//		return ftppwd;
//	}
//
//	public void setFtppwd(String ftppwd) {
//		this.ftppwd = ftppwd;
//	}
	
}