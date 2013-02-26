package com.wootion.cmmb.view.action.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.user.UserManagerService;
import com.wootion.idp.view.action.BaseAction;

/**
 * <p>文件名称: UnRegisterDoAction.java</p>
 */
public class UnRegisterDoAction extends BaseAction
{
    private Long    userID;

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

    public String execute(HttpServletRequest request,
            HttpServletResponse response)
    {
        UserManagerService userService = ServiceFactroy.getUserService();
        Wtuser user = (Wtuser) userService.getObjectByID(Wtuser.class, userID);
        if (user != null)
        {
//            user.setWtuserName(corpName);
//            user.setCorpNote(corpNote);
//            user.setWtuserAddress(corpAdd);
//            user.setCorpCode(corpCode);
//            user.setCorpTel(corpTel);
//            user.setCorpFax(corpFax);
//            user.setCorpAP(corpAP);
//            user.setOpenBank(openBank);
//            user.setOpenName(openName);
//            user.setBankID(bankID);
//            user.setLinkman(linkman);
//            user.setLinkmanTel(linkmanTel);
//            user.setLinkmanEmail(linkmanEmail);
//            user.setLinkmanAdd(linkmanAdd);
            user.setIsCheck(0); // 将审核状态置为"待审核"
            userService.modifyObject(user);

            request.setAttribute("msg", "个人资料修改成功！！");
            request.setAttribute("type", "ok");
        }
        else
        {
            request.setAttribute("msg", "个人资料修改失败！");
            request.setAttribute("type", "err");
        }

        request.setAttribute("back", request.getContextPath());

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

    public String getCorpName()
    {
        return corpName;
    }

    public void setCorpName(String corpName)
    {
        this.corpName = corpName;
    }

    public String getCorpNote()
    {
        return corpNote;
    }

    public void setCorpNote(String corpNote)
    {
        this.corpNote = corpNote;
    }

    public String getCorpAdd()
    {
        return corpAdd;
    }

    public void setCorpAdd(String corpAdd)
    {
        this.corpAdd = corpAdd;
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
}
