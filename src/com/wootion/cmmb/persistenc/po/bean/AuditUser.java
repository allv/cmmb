package com.wootion.cmmb.persistenc.po.bean;

import java.util.Date;

/**
 * 
 * <p>文件名称: AuditPrograms.java</p>
 * <p>文件描述: 节目审核列表信息</p>
 * <p>版权所有: 版权所有(C)2001-2006</p>
 * <p>公   司: 华通科技有限公司</p>
 * <p>内容摘要: </p>
 * <p>其他说明: </p>
 * <p>完成日期：2010-8-12</p>
 * <p>修改记录0：无</p>
 * @version 1.0
 * @author  伍超
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
