package com.wootion.idp.persistence.po.bean;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Wtrole entity. @author MyEclipse Persistence Tools
 * 用户角色实体类
 */

public class Wtrole implements java.io.Serializable
{

    // Fields    

    private Long wtroleId;                //角色id

    private String wtroleName;              //角色名称

    private String wtroleType;              //角色类型

    private Date   wtroleCreatetime;        //创建时间

    private String wtroleDescription;       //角色描述
    
    private String parentRole;       //角色权限组

    private String wtroleIsuseable="1";         //角色是否有效 1有效，0无效

    private Set<WtUserRoleRelationship>    wtUserRoleRelationships   = new LinkedHashSet<WtUserRoleRelationship>(0);   //用户与角色关联集合
    
    private Set<Wtrolefunrelationship>    wtrolefunrelationships   = new LinkedHashSet<Wtrolefunrelationship>(0);   //角色菜单关联集合

    private Set<Wtpermission>    wtpermissions            = new LinkedHashSet<Wtpermission>(0);   //角色资源关联集合
    
    /** 是否删除 */
    private Integer isDelete = 0;
    //在为用户分配角色时有用。
    private String haveIt;
    
    // Constructors

    public Set<WtUserRoleRelationship> getWtUserRoleRelationships()
    {
        return wtUserRoleRelationships;
    }

    public void setWtUserRoleRelationships(
            Set<WtUserRoleRelationship> wtUserRoleRelationships)
    {
        this.wtUserRoleRelationships = wtUserRoleRelationships;
    }

    public Set<Wtrolefunrelationship> getWtrolefunrelationships()
    {
        return wtrolefunrelationships;
    }

    public void setWtrolefunrelationships(
            Set<Wtrolefunrelationship> wtrolefunrelationships)
    {
        this.wtrolefunrelationships = wtrolefunrelationships;
    }

    public Set<Wtpermission> getWtpermissions()
    {
        return wtpermissions;
    }

    public void setWtpermissions(Set<Wtpermission> wtpermissions)
    {
        this.wtpermissions = wtpermissions;
    }

    /** default constructor */
    public Wtrole()
    {
    }

    /** minimal constructor */
    public Wtrole(String wtroleName, String wtroleType, Date wtroleCreatetime,
            String wtroleIsuseable)
    {
        this.wtroleName = wtroleName;
        this.wtroleType = wtroleType;
        this.wtroleCreatetime = wtroleCreatetime;
        this.wtroleIsuseable = wtroleIsuseable;
    }

    // Property accessors

    public Long getWtroleId()
    {
        return this.wtroleId;
    }

    public void setWtroleId(Long wtroleId)
    {
        this.wtroleId = wtroleId;
    }

    public String getWtroleName()
    {
        return this.wtroleName;
    }

    public void setWtroleName(String wtroleName)
    {
        this.wtroleName = wtroleName;
    }

    public String getWtroleType()
    {
        return this.wtroleType;
    }

    public void setWtroleType(String wtroleType)
    {
        this.wtroleType = wtroleType;
    }

    public Date getWtroleCreatetime()
    {
        return this.wtroleCreatetime;
    }

    public void setWtroleCreatetime(Date wtroleCreatetime)
    {
        this.wtroleCreatetime = wtroleCreatetime;
    }

    public String getWtroleDescription()
    {
        return this.wtroleDescription;
    }

    public void setWtroleDescription(String wtroleDescription)
    {
        this.wtroleDescription = wtroleDescription;
    }

    public String getWtroleIsuseable()
    {
        return this.wtroleIsuseable;
    }

    public void setWtroleIsuseable(String wtroleIsuseable)
    {
        this.wtroleIsuseable = wtroleIsuseable;
    }

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((wtroleId == null) ? 0 : wtroleId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		final Wtrole other = (Wtrole) obj;
		if (wtroleId == null) {
			if (other.wtroleId != null)
				return false;
		} else if (!wtroleId.equals(other.wtroleId))
			return false;
		return true;
	}

	public String getHaveIt() {
		return haveIt;
	}

	public void setHaveIt(String haveIt) {
		this.haveIt = haveIt;
	}

    public Integer getIsDelete()
    {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete)
    {
        this.isDelete = isDelete;
    }

	public String getParentRole() {
		return parentRole;
	}

	public void setParentRole(String parentRole) {
		this.parentRole = parentRole;
	}


}