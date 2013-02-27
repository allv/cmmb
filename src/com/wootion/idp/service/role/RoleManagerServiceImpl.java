package com.wootion.idp.service.role;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;

import com.wootion.cmmb.persistenc.po.bean.Form;
import com.wootion.idp.common.collections.PermissionCollection;
import com.wootion.idp.common.utils.DomainUtil;
import com.wootion.idp.common.utils.EntityIDFactory;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.role.RoleDAO;
import com.wootion.idp.persistence.dao.role.RoleManagerDAO;
import com.wootion.idp.persistence.dao.user.UserManagerDAO;
import com.wootion.idp.persistence.po.bean.WtUserRoleRelationship;
import com.wootion.idp.persistence.po.bean.Wtfunction;
import com.wootion.idp.persistence.po.bean.Wtpermission;
import com.wootion.idp.persistence.po.bean.Wtresource;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.persistence.po.bean.Wtrolefunrelationship;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.BaseServiceImpl;
import com.wootion.idp.view.vo.FordNagativation;

public class RoleManagerServiceImpl extends BaseServiceImpl implements
		RoleManagerService {
	RoleManagerDAO managerDAO;
	UserManagerDAO userDAO;
	RoleDAO roleDAO;

	public RoleDAO getRoleDAO() {
		return roleDAO;
	}

	public void setRoleDAO(RoleDAO roleDAO) {
		this.roleDAO = roleDAO;
	}

	public List<Wtpermission> getAllRolePermission() {
		return commonDao.getObjects(Wtpermission.class, null, null);
	}

	public QueryResult<Wtrole> getQueryUserResult(Integer index,
			Integer maxresult, String startDate, String endDate, String username) {
		String whererjpql = " o.wtroleIsuseable = '1'";
		if (startDate != null && !startDate.trim().equals("")) {
			whererjpql = whererjpql + " and o.wtroleCreatetime >= '"
					+ startDate + "'";
		}
		if (endDate != null && !endDate.trim().equals("")) {
			whererjpql = whererjpql + " and o.wtroleCreatetime <= '" + endDate
					+ "'";
		}
		if (username != null && !username.trim().equals("")) {
			whererjpql = whererjpql + " and o.wtroleName like '%" + username
					+ "%'";
		}
		whererjpql = whererjpql + " and o.isDelete=0 ";
		return this.commonDao.getScrollData(Wtrole.class, "wtroleId", index,
				maxresult, whererjpql, null, null);
	}

	public List<FordNagativation> getRoleNagativation(Long roleID) {

		List<FordNagativation> lst = new ArrayList<FordNagativation>();

		Wtrole role = (Wtrole) commonDao.getObject(Wtrole.class, roleID);
		if (role == null) {
			return lst;
		}
		// 循环一级菜单，判断权限
		List<Wtfunction> lstFirstFun = PermissionCollection.getInstance()
				.getFirstFunctions();
		if (lstFirstFun == null) {
			return lst;
		}
		for (int i = 0; i < lstFirstFun.size(); i++) {
			Wtfunction fun = lstFirstFun.get(i);
			if (fun.getWtfunParentid() == null) {
				continue;
			}
			List<Long> lstRoles = PermissionCollection.getInstance().getFRoles(
					fun.getWtfunctionId());

			FordNagativation na = new FordNagativation();
			na.setNagativeID(fun.getWtfunctionId().toString());
			na.setNagativeName(fun.getWtfunName());
			na.setParentID("0");
			na.setHaveIt("no");
			if (lstRoles != null && lstRoles.contains(roleID)) {
				na.setHaveIt("yes");
			}
			lst.add(na);

			// 找寻其对应的二级菜单
			List<Wtfunction> lstSecFun = PermissionCollection.getInstance()
					.getFSecFun(fun.getWtfunctionId());
			if (lstSecFun == null) {
				continue;
			}

			List<FordNagativation> lstSec = new ArrayList<FordNagativation>();
			na.setLst(lstSec);
			for (int k = 0; k < lstSecFun.size(); k++) {
				FordNagativation naSec = new FordNagativation();
				Wtfunction funSec = lstSecFun.get(k);
				List<Long> lstSecRoles = PermissionCollection.getInstance()
						.getFRoles(funSec.getWtfunctionId());

				naSec.setNagativeID(funSec.getWtfunctionId().toString());
				naSec.setNagativeName(funSec.getWtfunName());
				naSec.setParentID(funSec.getWtfunParentid().toString());
				naSec.setHaveIt("no");
				if (lstSecRoles != null) {
					if (lstSecRoles.contains(roleID)) {
						naSec.setHaveIt("yes");
					}
				}

				List<Wtresource> lstResource = PermissionCollection
						.getInstance().getResource(funSec.getWtfunctionId());
				if (lstResource != null) {
					List<FordNagativation> lstFR = new ArrayList<FordNagativation>();
					for (int j = 0; j < lstResource.size(); j++) {
						Wtresource res = lstResource.get(j);
						FordNagativation fnr = new FordNagativation();
						fnr.setNagativeID(res.getWtresourceId().toString());
						fnr.setNagativeName(res.getWtresName());
						fnr.setParentID(funSec.getWtfunctionId().toString());
						fnr.setHaveIt("no");

						List<Wtrole> lstRR = PermissionCollection.getInstance()
								.getRRoles(res.getWtresourceId());

						if (lstRR != null) {
							for (int l = 0; l < lstRR.size(); l++) {
								Wtrole rrole = lstRR.get(l);
								if (rrole.getWtroleId().equals(roleID)) {
									fnr.setHaveIt("yes");
									break;
								}
							}
						}

						lstFR.add(fnr);
					}

					naSec.setLstResource(lstFR);
				}

				lstSec.add(naSec);
			}
		}

		return lst;
	}

	public void saveFPermission(Long roleID, String funs, String ress) {
		// 先删除角色对应的关系
		managerDAO.deleteAllRFRR(roleID);

		Wtrole wtrole = (Wtrole) commonDao.getObject(Wtrole.class, roleID);

		List<Wtrolefunrelationship> lstRF = new ArrayList<Wtrolefunrelationship>();
		String[] tempFun = funs.split(",");
		for (int i = 0; i < tempFun.length; i++) {
			Wtrolefunrelationship rf = new Wtrolefunrelationship();
			rf.setWtrolefunId(EntityIDFactory.getBeanID());
			rf.setWtrole(wtrole);

			Wtfunction fun = new Wtfunction();
			fun.setWtfunctionId(Long.parseLong(tempFun[i]));
			rf.setWtfunction(fun);
			lstRF.add(rf);
		}

		List<Wtpermission> lstPer = new ArrayList<Wtpermission>();
		String[] temp = ress.split(",");
		for (int i = 0; i < temp.length; i++) {
			Wtpermission per = new Wtpermission();
			per.setWtfrId(EntityIDFactory.getBeanID());
			per.setWtrole(wtrole);
			Wtresource resource = new Wtresource();
			if (StringUtils.isNotBlank(temp[i])) {
				resource.setWtresourceId(Long.parseLong(temp[i]));
				per.setWtresource(resource);
				lstPer.add(per);
			}
		}
		// 保存新关系
		managerDAO.addRFRR(roleID, lstRF, lstPer);

		// 删除缓存
		PermissionCollection.getInstance().removeFRole();
		PermissionCollection.getInstance().removeRRole();

		// 重新加载缓存
		List<Wtpermission> lstPerC = commonDao.getObjects(Wtpermission.class,
				null, null);
		for (int i = 0; i < lstPerC.size(); i++) {
			Wtpermission per = lstPerC.get(i);
			Wtrole role = per.getWtrole();
			Wtresource res = per.getWtresource();
			PermissionCollection.getInstance().addRRole(res.getWtresourceId(),
					role);
		}

		List<Wtrolefunrelationship> lstRFc = commonDao.getObjects(
				Wtrolefunrelationship.class, null, null);
		for (int i = 0; i < lstRFc.size(); i++) {
			Wtrolefunrelationship role = lstRFc.get(i);
			PermissionCollection.getInstance().addFunctionRole(
					role.getWtfunction().getWtfunctionId(),
					role.getWtrole().getWtroleId());
		}

	}

	// //////////////////////////////////////////////////////

	public void addRoleResource(Long roleid, Long resid) {
		managerDAO.addRoleResource(roleid, resid);
	}

	public void addRoleResources(Long roleid, List<Long> liResid) {
		managerDAO.addRoleResources(roleid, liResid);
	}

	public RoleManagerDAO getManagerDAO() {
		return managerDAO;
	}

	public void setManagerDAO(RoleManagerDAO managerDAO) {
		this.managerDAO = managerDAO;
	}

	public UserManagerDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserManagerDAO userDAO) {
		this.userDAO = userDAO;
	}

	public List getRecordsByPage(int currentPage, int recordsPerPage) {
		String hql = "from Wtrole w";
		// return this.getBaseDao().getListObjForPage(hql, currentPage,
		// recordsPerPage);
		return null;
	}

	public String deleteRole(Serializable pk) {
		// String whereStr = "wtrole.wtroleId";
		// boolean roleMenu = this.isDelValidat(Wtrolefunrelationship.class,
		// "wtrolefunId", whereStr, pk);
		// if (roleMenu)
		// {
		// boolean roleRes = this.isDelValidat(Wtpermission.class, "wtfrId",
		// whereStr, pk);
		// if (roleRes)
		// {
		// // 判断 组型 判断单型
		// Wtrole wtrole = (Wtrole)this.getBaseDao().getObject(Wtrole.class,
		// pk);
		// if (wtrole.getWtroleType().equals("single"))// 单型关联用户
		// {
		// boolean roleUser = this.isDelValidat(WtUserRoleRelationship.class,
		// "wturId", whereStr, pk);
		// if (roleUser)
		// {
		// this.getBaseDao().deleteObject(wtrole);
		// return "删除角色成功！";
		// }
		// else
		// {
		// return ExceptionUtils.ROLE_DelRef_USER;
		// }
		// }
		// else// 组型关联角色组
		// {
		// this.getBaseDao().deleteObject(wtrole);
		// return "删除角色成功！";
		// }
		// }
		// else
		// {
		// return ExceptionUtils.ROLE_DelRef_RESOURCE;
		// }
		// }
		// else
		// {
		// return ExceptionUtils.ROLE_DelRef_MENU;
		// }
		return null;
	}

	public static void main(String[] args) {
		Long longa = 1280718537671100L;
		Long longb = 1280718537671100L;
		if (longa.equals(longb)) {
			System.out.println("ok");
		} else {
			System.out.println("no");
		}

	}

	public List<Wtrole> getRecords() {
		List<Wtrole> list = new ArrayList<Wtrole>();
		String hql = " isDelete=0";
		list = commonDao.getQueryObjects(Wtrole.class, hql, null, null);
		return list;
	}

	@Override
	public List<Wtuser> getRoleUsers(Long roleid) {
		List<Wtuser> result = new ArrayList<Wtuser>();
		Wtrole role = (Wtrole) commonDao.getObject(Wtrole.class, roleid);
		if (role == null)
			return result;
		Set<WtUserRoleRelationship> wtUserRoleRelationships = role
				.getWtUserRoleRelationships();
		for (WtUserRoleRelationship relation : wtUserRoleRelationships) {
			if (!DomainUtil.isUserDeleted(relation.getWtuser())) {
				result.add(relation.getWtuser());
			}
		}
		return result;
	}

	public boolean addRoleUsers(Long roleid, List<String> userids) {
		Wtrole role = (Wtrole) commonDao.getObject(Wtrole.class, roleid);
		if (role == null)
			return false;
		Set<WtUserRoleRelationship> currentUserRoleRelationships = role
				.getWtUserRoleRelationships();
		commonDao.deleteAll(currentUserRoleRelationships);
		Set<WtUserRoleRelationship> newWtUserRoleRelationships = new HashSet<WtUserRoleRelationship>();
		for (String userid : userids) {
			if (StringUtils.isNotBlank(userid)) {
				Wtuser user = new Wtuser();
				user.setWtuserId(Long.valueOf(userid));
				WtUserRoleRelationship relation = new WtUserRoleRelationship();
				relation.setWtrole(role);
				relation.setWtuser(user);
				relation.setWturId(EntityIDFactory.getBeanID());
				newWtUserRoleRelationships.add(relation);
			}
		}
		commonDao.saveOrUpdateAll(newWtUserRoleRelationships);
		return true;
	}

	@Override
	public boolean saveRoleForms(long roleid, List<String> selecteForms) {
		Wtrole role = (Wtrole) this.getObjectByID(Wtrole.class, roleid);
		if (role == null)
			return false;
		if (selecteForms != null) {
			role.getForms().clear();
			for (String formid : selecteForms) {
				Form form = (Form) this.getObjectByID(Form.class,
						Long.parseLong(formid));
				role.getForms().add(form);
			}
			commonDao.updateObject(role);
		}
		return true;
	}

}
