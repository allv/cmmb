package com.wootion.idp.common.utils;

import com.wootion.cmmb.persistenc.po.bean.Workflow;
import com.wootion.idp.persistence.po.bean.WtUserRoleRelationship;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.persistence.po.bean.Wtuser;

public class DomainUtil {

	public static final String MANAGER_ROLE_ID = "10003";
	public static final String ADMIN_ROLE_ID = "10001";
	public static final String UNAUTHORIZED_PERMISSION = "unauthorized";

	public static boolean isUserDeleted(Wtuser user) {
		return user.getIsDelete().intValue() != 0;
	}

	/**
	 * 用户是否激活
	 * @param user
	 * @return
	 */
	public static boolean isUserActived(Wtuser user) {
		return user.getWtuserIsuseable().equals("1");
	}

	/**
	 * 用户是否有效
	 * @param user
	 * @return
	 */
	public static boolean isUserAvailable(Wtuser user) {
		return !isUserDeleted(user) && isUserActived(user);
	}
	
	/**
	 * 用户是否是管理员
	 * @param user
	 * @return
	 */
	public static boolean isUserAdmin(Wtuser user) { 
		if(user.getWtUserRoleRelationships() != null ) {
			for(WtUserRoleRelationship relateion:user.getWtUserRoleRelationships()) {
				if(isAdminRole(relateion.getWtrole())) {
					return true;
				}
			}
		}
		return false;
	}
	
	/**
	 * 用户是否是经理
	 * @param user
	 * @return
	 */
	public static boolean isUserManager(Wtuser user) { 
		if(user.getWtUserRoleRelationships() != null ) {
			for(WtUserRoleRelationship relateion:user.getWtUserRoleRelationships()) {
				if(isManagerRole(relateion.getWtrole())) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * 是否是经理角色
	 * @param role
	 * @return
	 */
	public static boolean isManagerRole(Wtrole role) {
		return MANAGER_ROLE_ID.equals(role.getParentRole());
	}
	
	/**
	 * 是否是管理员角色
	 * @param role
	 * @return
	 */
	public static boolean isAdminRole(Wtrole role) {
		return ADMIN_ROLE_ID.equals(role.getParentRole());
	}

	/**
	 * 是否是权限组
	 * 
	 * @param role
	 * @return
	 */
	public static boolean isGroupRole(Wtrole role) {
		return role.getParentRole() != null
				&& role.getParentRole().equals(role.getWtroleId().toString());
	}

	public static boolean isWorkflowUseful(Workflow wf) {
		return wf.getUseful() != null
				&& wf.getUseful().equals(Workflow.WORKFLOW_USEFUL);
	}

	public static boolean isWorkflowDeleted(Workflow wf) {
		return wf.getDeleted() != null
				&& wf.getDeleted().equals(Workflow.WORKFLOW_DELETED);
	}

}
