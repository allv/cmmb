package com.wootion.idp.service.user;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.wootion.cmmb.common.util.DateUtil;
import com.wootion.idp.common.collections.PermissionCollection;
import com.wootion.idp.common.collections.UserCacheBean;
import com.wootion.idp.common.utils.DomainUtil;
import com.wootion.idp.common.utils.EntityIDFactory;
import com.wootion.idp.common.utils.ExcelOperate;
import com.wootion.idp.common.utils.FordGlobal;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.user.UserManagerDAO;
import com.wootion.idp.persistence.po.bean.WtUserRoleRelationship;
import com.wootion.idp.persistence.po.bean.Wtorganization;
import com.wootion.idp.persistence.po.bean.Wtpermission;
import com.wootion.idp.persistence.po.bean.Wtresource;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.BaseServiceImpl;

public class UserManagerServiceImpl extends BaseServiceImpl implements
		UserManagerService {
	private UserManagerDAO managerDAO;

	public Long getUserID(String username) {
		Wtuser user = managerDAO.getUserByUserName(username);
		return user.getWtuserId();
	}

	public Wtuser getUserByName(String userName) {
		return managerDAO.getUserByUserName(userName);
	}

	public boolean isHaveUserName(String username) {
		Wtuser user = managerDAO.getUserByUserName(username);
		if (user != null) // 存在用户信息
			return true;
		return false;
	}
	
	@Override
	public void modifyUserWithRoles(Wtuser user,List<String> roles) {
		super.modifyObject(user);
		Set<WtUserRoleRelationship> wtUserRoleRelationships = new HashSet<WtUserRoleRelationship>();
		if(roles != null ) { 
			for(String roleid:roles) { 
				Wtrole role = (Wtrole) commonDao.getObject(Wtrole.class, Long.parseLong(roleid));
				WtUserRoleRelationship e = new WtUserRoleRelationship();
				e.setWtrole(role);
				e.setWtuser(user);
				e.setWturId(EntityIDFactory.getBeanID());
				wtUserRoleRelationships.add(e);
			}
		}
		managerDAO.deleteUserRole(user.getWtuserId());
		commonDao.saveOrUpdateAll(wtUserRoleRelationships);
	}

	public Integer userLogin(String userName, String userPwd, String sessionID) {
		Wtuser user = managerDAO.getUserByUserName(userName);
		if (user != null) {// 含有用户信息
			if (user.getWtuserPassword().equals(userPwd)) {// 用户密码也相同

				/* 如果用户未审核 */
				if (0 == user.getIsCheck())
					return FordGlobal.USERUNUSEABLE;

				/* 如果用户审核未通过 */
				if (2 == user.getIsCheck())
					return FordGlobal.USERUNCHECK;

				/* 如果用户未激活或停用 */
				if ("0".equals(user.getWtuserIsuseable()))
					return FordGlobal.USERUNACTIVE;

				/* 判断所属大客户是否被停用 
				if (user.getPid() > 0) {
					Wtuser pUser = commonDao.getObject(Wtuser.class, user.getPid());
					if ("0".equals(pUser.getWtuserIsuseable()))
						return FordGlobal.PUSERUNACTIVE;
				}*/

				UserCacheBean uc = PermissionCollection.getInstance()
						.getUserCacheUName(userName);
				//防止浏览器异常崩溃，sessionListener类方法destroy 未执行
				UserCacheBean uc1 = PermissionCollection.getInstance().getUserCache(sessionID);
				if (uc != null&&uc1!=null) {// 说明用户已经登陆
					return FordGlobal.LOGINSUCESS;
				} else {
					uc = new UserCacheBean();
					uc.setSessionID(sessionID);
					uc.setUserID(user.getWtuserId());
					uc.setUserName(user.getWtuserLoginname());

					List<String> lst = new ArrayList<String>();
					List<Long> lstRoles = new ArrayList<Long>();
					uc.setLstRes(lst);
					uc.setLstRoles(lstRoles);
					PermissionCollection.getInstance().addSessionUserCache(
							sessionID, uc);
					PermissionCollection.getInstance().addUNameUserCache(
							userName, uc);
					Set<WtUserRoleRelationship> setUR = user
							.getWtUserRoleRelationships();
					Iterator<WtUserRoleRelationship> itUR = setUR.iterator();
					while (itUR.hasNext()) {
						WtUserRoleRelationship urs = itUR.next();
						Wtrole role = urs.getWtrole();
						lstRoles.add(role.getWtroleId());
						Set<Wtpermission> setPer = role.getWtpermissions();
						Iterator<Wtpermission> itRP = setPer.iterator();
						while (itRP.hasNext()) {
							Wtpermission per = itRP.next();
							Wtresource res = per.getWtresource();
							lst.add(res.getWtresCode());
						}
					}

					return FordGlobal.LOGINSUCESS;
				}
			}
		}

		return FordGlobal.ERRORPASSWORD;
	}

	public Integer userLogOut(String sessionID) {

		UserCacheBean uc = PermissionCollection.getInstance().getUserCache(
				sessionID);
		if (uc != null) {
			String userName = uc.getUserName();
			PermissionCollection.getInstance()
					.removeSessionUserCache(sessionID);
			PermissionCollection.getInstance().removeUNameUserCache(userName);
			uc = null;
		}
		return 0;
	}

	public QueryResult<Wtuser> getQueryResult(Integer firstindex,
			Integer maxresult) {
		String wherejpql = " o.wtuserLoginname != 'admindmin'";
		return this.commonDao.getScrollData(Wtuser.class, "wtuserId",
				firstindex, maxresult, wherejpql, null, null);
	}

	public QueryResult<Wtuser> getQueryUserResult(Integer index,
			Integer maxresult, String startDate, String endDate,
			String username, String wtuserIsuseable, Integer isCheck, String sessionID,int clienttype) {
		List<Object> lst = new ArrayList<Object>();
		String whererjpql = " o.wtuserLoginname != 'admin'";
		if (startDate != null && !startDate.trim().equals("")) {
			whererjpql = whererjpql + " and o.wtuserCreatetime >= ?";
			lst.add(DateUtil.getNormalDate(startDate));
		}
		if (endDate != null && !endDate.trim().equals("")) {
			whererjpql = whererjpql + " and o.wtuserCreatetime <= ?";
			lst.add(DateUtil.getNormalDate(endDate));
		}
		if (username != null && !username.trim().equals("")) {
			whererjpql = whererjpql + " and o.wtuserLoginname like '%"
					+ username + "%'";
		}
		if (wtuserIsuseable != null && !wtuserIsuseable.trim().equals("")
				&& !"-1".equals(wtuserIsuseable.trim())) {
			whererjpql = whererjpql + " and o.wtuserIsuseable = '"
					+ wtuserIsuseable + "'";
		}
		if (isCheck != null && isCheck != -1) {
			whererjpql = whererjpql + " and o.isCheck = " + isCheck;
		}
		whererjpql = whererjpql + " and o.isDelete = 0 ";
	
		/*
		if(clienttype==1){
		    List<Wtuser> userlist = ServiceFactroy.getUserService().getSubUserId(userid);
		    if(userlist!=null&&userlist.size()>0){
		    	for(int i=0;i<userlist.size();i++){
		    		if(i==0)
		    			whererjpql = whererjpql+" and (o.userrelate = '"+userlist.get(i).getWtuserId()+"'";
		    		else
		    			whererjpql = whererjpql + " or o.userrelate = '"+userlist.get(i).getWtuserId()+"'";	
		    	}
		    	whererjpql = whererjpql + " or o.wtuserId ="+userID+" or o.userrelate = '"+userid+"')";
		    }else{
				whererjpql = whererjpql + " and (o.userrelate = '" + userid+"' or o.wtuserId ="+userID+") " ;
			}
		}else{
			whererjpql = whererjpql + " and o.userrelate = '" + userid+"'";
		}*/
		return this.commonDao.getScrollData(Wtuser.class, "wtuserId", index,
				maxresult, whererjpql, lst.toArray(), null);
	}
	
	 /*
	 public String getParentUser(Long userID){
		  Wtuser user = (Wtuser) ServiceFactroy.getUserService().getObjectByID(
					Wtuser.class, userID);
		  return user.getUserrelate();
	 }*/
	
	public List<Wtrole> getUserRole(Long userID) {
		List<Wtrole> lstRoles = managerDAO.getUserRoles(userID);
		String parentrole = "10002";
		//if(clienttype==2){
		//	parentrole = "10002";
		//}
		List<Wtrole> roles = new ArrayList<Wtrole>();
		List<Wtrole> alst = managerDAO.getParentRoles(parentrole);
		for (int i = 0; i < alst.size(); i++) {
			Wtrole role = alst.get(i);
			if (lstRoles.contains(role)) {
				role.setHaveIt("yes");
			} else {
				role.setHaveIt("no");
			}
			if (role.getIsDelete() == 0) {
				roles.add(role);
			}
		}
       
		return roles;
	}
	
	private HttpServletRequest getRequest() {
		ActionContext ctx = ActionContext.getContext();
		return (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
    }
  
	public void saveUserRole(Long userID, String roles) {
		// 先删除角色对应的关系
		managerDAO.deleteUserRole(userID);

		Wtuser wtuser = new Wtuser();
		wtuser.setWtuserId(userID);
		Set<WtUserRoleRelationship> lstRF = new HashSet<WtUserRoleRelationship>();
		
		String[] tempRole = roles.split(",");
		for (int i = 0; i < tempRole.length; i++) {
			if(StringUtils.isNotBlank(tempRole[i])){
				WtUserRoleRelationship ur = new WtUserRoleRelationship();
				ur.setWturId(EntityIDFactory.getBeanID());
				ur.setWtuser(wtuser);
				
				Wtrole role = new Wtrole();
				role.setWtroleId(Long.parseLong(tempRole[i]));
				ur.setWtrole(role);
				lstRF.add(ur);
			}
		}
		wtuser.setWtUserRoleRelationships(lstRF);
		wtuser.getWtUserRoleRelationships();
		commonDao.saveOrUpdateAll(lstRF);
	}

	
	public void saveUserRole1(Wtuser user, Wtrole wr) {
		// 先删除角色对应的关系
		//managerDAO.deleteUserRole(userID);

		List<WtUserRoleRelationship> lstRF = new ArrayList<WtUserRoleRelationship>();
		{
			WtUserRoleRelationship ur = new WtUserRoleRelationship();
			ur.setWturId(EntityIDFactory.getBeanID());
			ur.setWtuser(user);
			ur.setWtrole(wr);
			lstRF.add(ur);
		}
		commonDao.saveOrUpdateAll(lstRF);
	}
	public List<Wtuser> getUsersPage(int currentPage, int recordsPerPage) {
		return null;
	}

	public boolean userLogin(Wtuser wtuser, String basePath) {

		return managerDAO.userLogin(wtuser, basePath);
	}

	public UserManagerDAO getManagerDAO() {
		return managerDAO;
	}

	public void setManagerDAO(UserManagerDAO managerDAO) {
		this.managerDAO = managerDAO;
	}

	public String deleteUser(Serializable pk) {
		// String whereStr = "wtuser.wtuserId";
		// // 用户和角色关联
		// boolean userRole = this.isDelValidat(WtUserRoleRelationship.class,
		// "wturId", whereStr, pk);
		// if (userRole)
		// {
		// this.getBaseDao().removeObject(Wtuser.class, pk);
		// return "删除用户成功";
		// }
		// else
		// {
		// return ExceptionUtils.USER_DelRef_ROLE;
		// }
		return null;
	}

	public boolean isHasSameLoginName(String loginName, String action,
			String wtUserId) {
		List list = managerDAO.findUserByLoginName(loginName);
		if (list == null || list.size() < 1) {
			return true;
		} else {
			if (list.size() == 1 && action.equals("update")
					&& ((Wtuser) list.get(0)).getWtuserId().equals(wtUserId)) {// 当修改的时候名称一致但是id不一致则不能修改
				return true;
			}
		}
		return false;
	}

	public String addUsersByExcel(String file, String isRollBack) {
		// 存放错误的数据
		List<String> errorRowNumList = new ArrayList<String>();
		// 存放组织
		List orgList = this.getAllObject(Wtorganization.class);
		// 存放合法用户
		List<Wtuser> userList = new ArrayList<Wtuser>();
		Wtuser user = null;
		// 读取Excel数据,然后删除
		String[][] sheetValues = ExcelOperate.readExcel(file, true);
		for (int i = 0; i < sheetValues.length; i++)// 列
		{
			user = new Wtuser();
			String[] strings = sheetValues[i];
			if (this.setValue(strings, user, errorRowNumList, i + 2, orgList,
					userList))// 第一行为标题并且Excel默认计数从1开始所以要i+ 2
			{
				this.setUserOtherValue(user);// 设置其他非空字段
				user.setWtuserId(EntityIDFactory.getBeanID());// 设置关键字id
				userList.add(user);// 添加合法用户
			}
		}

		/*
		 * 当userList的size等于sheetValues的列时说明全部用户合法, 若不等则说明有非法数据
		 * 或者通过errorRowNumList判断
		 */
		if ("true".equals(isRollBack))// 回滚
		{
			if (errorRowNumList.isEmpty())// 无错误数据
			{// 批量保存用户
				// this.getBaseDao().saveOrUpdateAll(userList);
			} else {
				// 生成错误记录Excel文件
				Map<String, String> paramsMap = this.createErrorRecordExcel(
						sheetValues, errorRowNumList);
				paramsMap.put("file", this.changeFileName(file));
				ExcelOperate.exportExcel(paramsMap);
				// 返回错误信息
				return this.errorRowNumListToString(errorRowNumList)
						+ "执行回滚操作，没有插入任何记录！";
			}
		} else
		// 不回滚
		{// 批量保存用户，然后若有错误返回错误
			// this.getBaseDao().saveOrUpdateAll(userList);
			if (!errorRowNumList.isEmpty()) {
				// 生成错误记录Excel文件
				Map<String, String> paramsMap = this.createErrorRecordExcel(
						sheetValues, errorRowNumList);
				paramsMap.put("file", this.changeFileName(file));
				ExcelOperate.exportExcel(paramsMap);
				// 返回错误信息
				return this.errorRowNumListToString(errorRowNumList) + "插入正确记录"
						+ userList.size() + "条！";
			}
		}
		return "ok";
	}

	/**
	 * 修改文件名称
	 * 
	 * @param file
	 * @return
	 */
	private String changeFileName(String file) {
		String newFile = file.substring(0, file.lastIndexOf('\\') + 1);
		return newFile + "ErrorRecords.xls";
	}

	/**
	 * list to string
	 * 
	 * @param errorRowNumList
	 * @return
	 */
	private String errorRowNumListToString(List<String> errorRowNumList) {
		StringBuffer sb = new StringBuffer("检测到以下数据为错误数据：");
		for (String string : errorRowNumList) {
			sb.append(string);
		}
		if (sb.length() > 160) {
			return sb.substring(0, 130) + "...!<br/>";
		}
		sb.append("!<br/>");
		return sb.toString();
	}

	/**
	 * 检测行数据的合法性，若合法则组装为Wtuser对象
	 * 
	 * @param strings
	 *            行
	 * @param user
	 * @param errorRowNumList
	 *            存放错误行数和列数的list 形式为(2,3)
	 * @param row
	 *            行数
	 * @return 数据是否合法
	 */
	private boolean setValue(String[] strings, Wtuser user,
			List<String> errorRowNumList, int row,
			List<Wtorganization> orgList, List<Wtuser> userList) {
		Wtorganization orgObj = null;
		int dataValidate = 0; // 当循环1次行后的值等于列的个数值的时候说明该行的数据全部合法
		for (int j = 0; j < strings.length; j++)// 行
		{
			String string = strings[j];
			int length = string.length();
			switch (j) {
			case 0:
				if (length > 0 && length < 20) {
					//user.getClient().setClientname(string);// 用户名
					dataValidate++;
				}
				break;
			case 1:
				if (length > 0 && length < 20 && // 检测登录名是否重复，true为可以添加
						this.canAddUser(string, userList)) {
					user.setWtuserLoginname(string);// 登录名
					dataValidate++;
				}
				break;
			case 2:
				if (length > 0 && length < 20) {
					user.setWtuserPassword(string);// 密码
					dataValidate++;
				}
				break;
			case 3:
				if ("男".equals(string)) {
					//user.getClient().setWtuserSex("1");// 性别
					dataValidate++;
				} else if ("女".equals(string)) {
					//user.getClient().setWtuserSex("2");// 性别
					dataValidate++;
				}
				break;
			case 4:
				if (string.length() > 0) {
					orgObj = this.setUserOrg(orgList, string);
					if (orgObj != null) {
						//user.getClient().setWtorganization(orgObj);
						dataValidate++;
					}
				}
				break;
			case 5:
				if (string.length() <= 18) {
					//user.getClient().setWtuserCard(string);// 身份证号
					dataValidate++;
				}
				break;
			case 6:
				if (string.length() <= 50) {
					//user.getClient().setWtuserEmail(string);// E-mail
					dataValidate++;
				}
				break;
			case 7:
				// user.setwtu(string);// 家庭住址
				dataValidate++;
				break;
			}
			if (dataValidate != j + 1)// 说明数据不合法，跳出循环
			{
				errorRowNumList.add("(" + row + "," + j + ")");// 添加错误数据的行数和列数
				break;
			}
		}

		if (dataValidate == strings.length) {
			return true;
		}
		return false;
	}

	/**
	 * 根据个数判断能否添加
	 * 
	 * @param string
	 * @return
	 */
	private boolean canAddUser(String string, List<Wtuser> userList) {
		int num = managerDAO.sameLoginNameNum(string);
		// 此时还要检测userList
		for (Wtuser wtuser : userList) {
			if (wtuser.getWtuserLoginname().equals(string)) {
				return false;
			}
		}
		if (num == 0) {
			return true;
		}
		return false;
	}

	private void setUserOtherValue(Wtuser user) {
		user.setWtuserIsuseable("1");
		user.setWtuserCreatetime(new Date());
		user.setWtuserLoginnumber(0);
	}

	/**
	 * 生成记录错误数据的Excel
	 * 
	 * @param sheetValues
	 * @param errorRowNumList
	 * @return
	 */
	private Map<String, String> createErrorRecordExcel(String[][] sheetValues,
			List<String> errorRowNumList) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("colNames", "用户名,登录名,密码,性别（男 女 ）,组织名称,身份证号,电子邮箱,家庭住址");
		// 获取数据
		StringBuffer dataSb = new StringBuffer();
		for (String string : errorRowNumList) {
			String[] pos = string.substring(1, string.length() - 1).split(",");
			int row = Integer.parseInt(pos[0]) - 2;// 上面添加的时候为row + 2,所以这里为-2
			for (int i = 0; i < sheetValues[row].length; i++) {
				dataSb.append("," + sheetValues[row][i]);
			}

		}
		paramMap.put("datas", dataSb.substring(1));
		return paramMap;
	}

	/**
	 * 返回用户对于的组织对象
	 * 
	 * @param orgList
	 *            所有组织list
	 * @param orgName
	 * @return
	 */
	private Wtorganization setUserOrg(List<Wtorganization> orgList,
			String orgName) {
		for (Wtorganization wtorganization : orgList) {
			if (wtorganization.getWtorgName().equals(orgName)) {
				return wtorganization;
			}
		}
		return null;
	}

	/**
	 * 保存用户和角色信息
	 * 
	 * @param user
	 * @param roles
	 */
	public void saveUserandRole(Wtuser user, String roles) {
		try {
			commonDao.saveObject(user);
			if (!"-1".equals(roles)) {
				Long userid = user.getWtuserId();
				saveUserRole(userid, roles);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 保存用户和角色信息
	 * 
	 * @param user
	 * @param roles
	 */
	public void saveUserandRole1(Wtuser user, Wtrole roles) {
		try {
			commonDao.saveObject(user);
			 
		    saveUserRole1(user, roles);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<Wtuser> getAllUsersWithUsable() {
	    List<Object> allObject = this.getAllObject(Wtuser.class);
	    List<Wtuser> result = new ArrayList<Wtuser>();
	    if(allObject != null ) {
		for(Object obj:allObject) {
		    Wtuser user = (Wtuser) obj;
		    if(!DomainUtil.isUserDeleted(user)) {
			result.add(user);
		    }
		}
	    }
	    return result;
	}

	
	/**
	 * 得到父Id
	 * @param user
	 * @param roles
	 */
	/*
	public String getParentUserId(String userid) {
		try {
			return managerDAO.getPid(userid);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
        
	}*/
   /*
	public List<Wtuser> getSubUserId(String userid) {
		try {
			return managerDAO.getSubid(userid);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
        
	}*/
}
