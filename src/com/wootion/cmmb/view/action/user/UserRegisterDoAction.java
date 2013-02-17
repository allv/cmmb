package com.wootion.cmmb.view.action.user;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.common.utils.EntityIDFactory;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.view.action.BaseAction;

/**
 * <p>文件名称: UserRegisterDoAction.java</p>
 * <p>文件描述: 本类描述:</p>
 * <p>版权所有: 版权所有(C)2001-2006</p>
 * <p>公   司: 华通科技有限公司</p>
 * <p>内容摘要: </p>
 * <p>其他说明: </p>
 * <p>完成日期：Aug 12, 2010</p>
 * <p>修改记录0：无</p>
 * @version 1.0
 * @author Deng Honghong
 */
public class UserRegisterDoAction extends BaseAction
{
    private String  username;

    private String  password;

    /**公司全称*/
    private String  corpName;

    /**公司简介*/
    private String  corpNote;

    /**公司地址*/
    private String  corpAdd;

    /**邮编*/
    private Integer corpCode;

    /**电话*/
    private String  corpTel;

    /**传真*/
    private String  corpFax;

    /**法人代表*/
    private String  corpAP;

    /**开户行*/
    private String  openBank;

    /**开户名*/
    private String  openName;

    /**银行账号*/
    private String  bankID;

    /**联系人姓名*/
    private String  linkman;

    /**联系人电话*/
    private String  linkmanTel;

    /**联系人email*/
    private String  linkmanEmail;

    /**联系人地址*/
    private String  linkmanAdd;

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse arg1)
    {
        if (ServiceFactroy.getUserService().isHaveUserName(username))
        {
            request.setAttribute("msg", "账号名已存在！");
            return FAILURE;
        }

        Wtuser user = new Wtuser();
        user.setWtuserCreatetime(new Date());
        user.setWtuserId(EntityIDFactory.getBeanID());
        user.setWtuserLoginname(username);
        user.setWtuserPassword(password);
//        user.setWtuserName(corpName);
//        user.setCorpNote(corpNote);
//        user.setWtuserAddress(corpAdd);
//        user.setCorpCode(corpCode);
//        user.setCorpTel(corpTel);
//        user.setCorpFax(corpFax);
//        user.setCorpAP(corpAP);
//        user.setOpenBank(openBank);
//        user.setOpenName(openName);
//        user.setBankID(bankID);
//        user.setLinkman(linkman);
//        user.setLinkmanTel(linkmanTel);
//        user.setLinkmanEmail(linkmanEmail);
//        user.setLinkmanAdd(linkmanAdd);
        user.setIsCheck(0);
        user.setWtuserIsuseable("0");
        ServiceFactroy.getUserService().addObject(user);

        request.setAttribute("back", request.getContextPath());
        request.setAttribute("msg", "注册成功！<br>待管理员审核后方可接入系统。");
        request.setAttribute("type", "ok");
        return SUCESS;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getCorpNote()
    {
        return corpNote;
    }

    public void setCorpNote(String corpNote)
    {
        this.corpNote = corpNote;
    }

    public Integer getCorpCode()
    {
        return corpCode;
    }

    public void setCorpCode(Integer corpCode)
    {
        this.corpCode = corpCode;
    }

    public String getCorpTel()
    {
        return corpTel;
    }

    public void setCorpTel(String corpTel)
    {
        this.corpTel = corpTel;
    }

    public String getCorpFax()
    {
        return corpFax;
    }

    public void setCorpFax(String corpFax)
    {
        this.corpFax = corpFax;
    }

    public String getCorpAP()
    {
        return corpAP;
    }

    public void setCorpAP(String corpAP)
    {
        this.corpAP = corpAP;
    }

    public String getOpenBank()
    {
        return openBank;
    }

    public void setOpenBank(String openBank)
    {
        this.openBank = openBank;
    }

    public String getOpenName()
    {
        return openName;
    }

    public void setOpenName(String openName)
    {
        this.openName = openName;
    }

    public String getBankID()
    {
        return bankID;
    }

    public void setBankID(String bankID)
    {
        this.bankID = bankID;
    }

    public String getLinkman()
    {
        return linkman;
    }

    public void setLinkman(String linkman)
    {
        this.linkman = linkman;
    }

    public String getLinkmanTel()
    {
        return linkmanTel;
    }

    public void setLinkmanTel(String linkmanTel)
    {
        this.linkmanTel = linkmanTel;
    }

    public String getLinkmanEmail()
    {
        return linkmanEmail;
    }

    public void setLinkmanEmail(String linkmanEmail)
    {
        this.linkmanEmail = linkmanEmail;
    }

    public String getLinkmanAdd()
    {
        return linkmanAdd;
    }

    public void setLinkmanAdd(String linkmanAdd)
    {
        this.linkmanAdd = linkmanAdd;
    }

    public String getCorpName()
    {
        return corpName;
    }

    public void setCorpName(String corpName)
    {
        this.corpName = corpName;
    }

    public String getCorpAdd()
    {
        return corpAdd;
    }

    public void setCorpAdd(String corpAdd)
    {
        this.corpAdd = corpAdd;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

}
