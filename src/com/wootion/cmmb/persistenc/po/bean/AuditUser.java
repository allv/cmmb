package com.wootion.cmmb.persistenc.po.bean;

import java.util.Date;

/**
 * 
 * <p>文件名称: AuditPrograms.java</p>
 */
public class AuditUser{
   private Long auditId;        //审核ID
   private Long userId;         //被审核用户ID
   private Long auditUserId;    //审核用户ID
   private boolean whether;     //审核是否通过
   private Date auditTime;      //审核时间
   private String ServiceID;    //审核通过的业务标识
public Long getAuditId()
{
    return auditId;
}
public void setAuditId(Long auditId)
{
    this.auditId = auditId;
}
public Long getUserId()
{
    return userId;
}
public void setUserId(Long userId)
{
    this.userId = userId;
}
public Long getAuditUserId()
{
    return auditUserId;
}
public void setAuditUserId(Long auditUserId)
{
    this.auditUserId = auditUserId;
}
public boolean isWhether()
{
    return whether;
}
public void setWhether(boolean whether)
{
    this.whether = whether;
}
public Date getAuditTime()
{
    return auditTime;
}
public void setAuditTime(Date auditTime)
{
    this.auditTime = auditTime;
}
public String getServiceID()
{
    return ServiceID;
}
public void setServiceID(String serviceID)
{
    ServiceID = serviceID;
}
}
