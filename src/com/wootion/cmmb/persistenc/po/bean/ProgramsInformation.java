package com.wootion.cmmb.persistenc.po.bean;

import java.io.Serializable;
import java.util.Date;
/**
 * 
 * <p>文件名称: ProgramsInformation.java</p>
 */
public class ProgramsInformation implements Serializable{
    /*节目ID*/
    private Long proId;
    /*节目名*/
    private String proName;
    /*上传人*/
    private String proUploadName;
    /*上传时间*/
    private Date proUploadTime;
    /*审核人*/
    private String auditName;
    /*审核状态*/
    private String auditType;
    /*审核时间*/
    private Date auditTime;
    /*播放状态*/
    private String broadcastType;
    /*播放开始时间*/
    private Date broadcastStartTime;
    /*播放结束时间*/
    private Date broadcastOverTime;
    /*播放URL地址*/
    private String proUrl;
    /*节目业务标识*/
    private String businessLogo;
    /*描述*/
    private String prodesc;
    /*节目顺序*/
    private Integer sporder;
    /*节目单ID*/
    private Long proItemId;
    public Long getProItemId()
    {
        return proItemId;
    }
    public void setProItemId(Long proItemId)
    {
        this.proItemId = proItemId;
    }
    public Integer getSporder()
    {
        return sporder;
    }
    public void setSporder(Integer sporder)
    {
        this.sporder = sporder;
    }
    public String getProdesc()
    {
        return prodesc;
    }
    public void setProdesc(String prodesc)
    {
        this.prodesc = prodesc;
    }
    public Long getProId()
    {
        return proId;
    }
    public void setProId(Long proId)
    {
        this.proId = proId;
    }
    public String getProName()
    {
        return proName;
    }
    public void setProName(String proName)
    {
        this.proName = proName;
    }
    public String getProUploadName()
    {
        return proUploadName;
    }
    public void setProUploadName(String proUploadName)
    {
        this.proUploadName = proUploadName;
    }
    public String getAuditName()
    {
        return auditName;
    }
    public void setAuditName(String auditName)
    {
        this.auditName = auditName;
    }
    public String getAuditType()
    {
        return auditType;
    }
    public void setAuditType(String auditType)
    {
        this.auditType = auditType;
    }
    public Date getAuditTime()
    {
        return auditTime;
    }
    public void setAuditTime(Date auditTime)
    {
        this.auditTime = auditTime;
    }
    public String getBroadcastType()
    {
        return broadcastType;
    }
    public void setBroadcastType(String broadcastType)
    {
        this.broadcastType = broadcastType;
    }
    public Date getBroadcastStartTime()
    {
        return broadcastStartTime;
    }
    public void setBroadcastStartTime(Date broadcastStartTime)
    {
        this.broadcastStartTime = broadcastStartTime;
    }
    public Date getBroadcastOverTime()
    {
        return broadcastOverTime;
    }
    public void setBroadcastOverTime(Date broadcastOverTime)
    {
        this.broadcastOverTime = broadcastOverTime;
    }
    public String getProUrl()
    {
        return proUrl;
    }
    public void setProUrl(String proUrl)
    {
        this.proUrl = proUrl;
    }
    public String getBusinessLogo()
    {
        return businessLogo;
    }
    public void setBusinessLogo(String businessLogo)
    {
        this.businessLogo = businessLogo;
    }
    public Date getProUploadTime()
    {
        return proUploadTime;
    }
    public void setProUploadTime(Date proUploadTime)
    {
        this.proUploadTime = proUploadTime;
    }
}
