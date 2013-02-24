package com.wootion.idp.persistence.dao.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.wootion.idp.common.utils.RoleUtil;
import com.wootion.idp.persistence.po.bean.WtUserRoleRelationship;
import com.wootion.idp.persistence.po.bean.Wtfunction;
import com.wootion.idp.persistence.po.bean.Wtpermission;
import com.wootion.idp.persistence.po.bean.Wtresource;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.persistence.po.bean.Wtrolefunrelationship;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.view.vo.LeftMenu;

public class UserManagerDAOHibernate extends HibernateDaoSupport implements
		UserManagerDAO {
    
    @SuppressWarnings("unchecked")
    public List<Wtuser> getUsers(Wtuser queryObject) {
	return (List<Wtuser>)getHibernateTemplate().findByExample(queryObject);
    }
    
    public Wtuser findUserById(Long userid) { 
	DetachedCriteria criteria=DetachedCriteria.forClass(Wtuser.class);
	criteria.add(Restrictions.eq("wtuserId", userid));
	List<Wtuser> result = getHibernateTemplate().findByCriteria(criteria);
	if(result.size() == 1){
	    return result.get(0);
	}
	return null;
    }

	public void deleteUserRole(Long userID) {
		Object[] objsz = new Object[] { userID };
		String delFun = "delete WtUserRoleRelationship o where o.wtuser.wtuserId = ? ";
		getHibernateTemplate().bulkUpdate(delFun, objsz);
	}

	public List<Wtrole> getUserRoles(Long userID) {
		Object[] objsz = new Object[] { userID };
		String queryString = "select o.wtrole from WtUserRoleRelationship o where o.wtuser.wtuserId = ? ";
		List<Wtrole> lst = getHibernateTemplate().find(queryString, objsz);
		return lst;
	}

	public List<Wtrole> getParentRoles(String parentrole) {
		Object[] objsz = new Object[] { parentrole };
		String queryString = "from Wtrole o where o.parentRole = ? ";
		List<Wtrole> lst = getHibernateTemplate().find(queryString, objsz);
		return lst;
	}
	public Wtuser getUserByUserName(String userName) {
		String hsql = "from Wtuser o where o.wtuserLoginname=? and o.isDelete=0";
		List lst = getHibernateTemplate().find(hsql, new Object[] { userName });
		if (lst.size() == 1) {
			Wtuser user = (Wtuser) lst.get(0);
			return user;
		}
		return null;
	}
    
	/*
	public String getPid(String userid){
		Object[] objsz = new Object[] {  Long.valueOf(userid) };
		String sql = "from Wtuser o where o.wtuserId = ?" ;
		List<Wtuser> lst = getHibernateTemplate().find(sql, objsz);
		if(lst!=null)
			return lst.get(0).getUserrelate().toString();
		return null;
	}*/
	
	public List<Wtuser> getSubid(String userid){
		Object[] objsz = new Object[] { userid };
		String sql = "from Wtuser o where o.userrelate = ?" ;
		List<Wtuser> lst = getHibernateTemplate().find(sql, objsz);
		if(lst!=null)
			return lst;
		return null;
	}
	/**
	 * 进行登陆验证处理
	 */
	@SuppressWarnings("unchecked")
	public boolean userLogin(Wtuser wtuser, String basePath) {
		// 此处在后面需要改进，主要是需要防止数据库注入漏洞，考虑对密码进行再次摘要算法才可。
		List list = this.getHibernateTemplate().find(
				"from Wtuser as user  where user.wtuserLoginname = '"
						+ wtuser.getWtuserLoginname() + "' ");
		if (list.size() == 1) {
			Wtuser user = (Wtuser) list.get(0);
			if (!(wtuser.getWtuserPassword().trim().equals(user
					.getWtuserPassword()))) {// 用户名和密码不匹配
				return false;
			} else {
				wtuser.setWtuserId(user.getWtuserId());// 设置ID
				//wtuser.setWtuserName(user.getWtuserName());
				// 登陆验证成功，在处理权限之前，应清空之前的可能存在的记录，因为可能在线变更用户的权限
				// 只要重新登陆一次，则应该重新获取
				RoleUtil.getInstance().deletePermission(user.getWtuserId());
				dealUserRole(user, basePath);// 对用户的角色权限进行处理
				return true;
			}
		}
		return false;
	}

	/**
	 * 处理该用户的角色关系
	 * 
	 * @param wtuser
	 */
	@SuppressWarnings("unchecked")
	private void dealUserRole(Wtuser wtuser, String basePath) {
		// 用于存储当前用户角色下拥有的菜单栏的第一级菜单中的编码
		Set<String> menuOrder = new HashSet<String>();
		// 获得用户角色关系记录，以进行循环找到对应的角色
		Set wtURole = wtuser.getWtUserRoleRelationships();
		Iterator itURole = wtURole.iterator();
		while (itURole.hasNext()) {
			// 循环当前用户的所有用户角色关系，以获得用户角色
			Wtrole wtrole = (Wtrole) ((WtUserRoleRelationship) itURole.next())
					.getWtrole();
			//System.out.println("===>用户" + wtuser.getWtuserName() + " 分配了角色："+ wtrole.getWtroleName());
			// 循环处理角色与资源的关系
			Set setPermission = wtrole.getWtpermissions();
			Iterator itPer = setPermission.iterator();
			while (itPer.hasNext()) {
				Wtresource wtresource = ((Wtpermission) itPer.next())
						.getWtresource();
				//System.out.println("===>用户" + wtuser.getWtuserName()+ " 分配了角色，角色下面的资源为：" + wtresource.getWtresName());
				Wtfunction wtfunction = wtresource.getWtfunction();
				String requestPath = wtfunction.getWtfunExcutepath();
				RoleUtil.getInstance().pushPermission(wtuser.getWtuserId(),
						requestPath, wtresource.getWtresCode());
			}

			// 循环处理角色与功能的关系
			Set setFunction = wtrole.getWtrolefunrelationships();
			Iterator itfun = setFunction.iterator();
			while (itfun.hasNext()) {
				Wtrolefunrelationship wtrolefunrelationship = (Wtrolefunrelationship) itfun
						.next();
				Wtfunction wtfunction = wtrolefunrelationship.getWtfunction();
				//System.out.println("===>用户" + wtuser.getWtuserName()+ " 分配了角色，角色下面的菜单为：" + wtfunction.getWtfunName());
				String order = wtfunction.getWtfunOrder();
				int orderlen = order.length() / 2;
				for (int i = 1; i < orderlen + 1; i++) {
					String subStr = order.substring(0, i * 2);
					menuOrder.add(subStr);
				}

				// String por = order.substring(0, 4);//取根目录下的第一级菜单项
				// menuOrder.add(por);
			}
		}
		dealMenu(wtuser.getWtuserId(), menuOrder, basePath);
	}

	/**
	 * 处理菜单栏
	 * 
	 * @param menuOrder
	 */
	@SuppressWarnings("unchecked")
	private void dealMenu(Long uid, Set<String> menuOrder, String basePath) {
		List sortList = new ArrayList();
		sortList.addAll(menuOrder);
		if (sortList.size() > 0) {
			String hql = "from Wtfunction as fun ";
			hql = hql + "where fun.wtfunOrder ='";
			for (int i = 0; i < sortList.size() - 1; i++) {
				String tt = (String) sortList.get(i);
				hql = hql + tt + "' or fun.wtfunOrder ='";
			}
			// 最后一个需要单独处理
			hql = hql + sortList.get(sortList.size() - 1)
					+ "' order by fun.wtfunOrder asc";

			List sortListp = getHibernateTemplate().find(hql);
			if (sortListp.size() > 0) {
				Map<String, List<LeftMenu>> listMenu = new HashMap<String, List<LeftMenu>>();
				for (int i = 0; i < sortListp.size(); i++) {
					Wtfunction wtfunction = (Wtfunction) sortListp.get(i);
					if (wtfunction.getWtfunParentid() != null)// 不为根结点
					{
						// 得到父结点排序号
						String order = wtfunction.getWtfunOrder().substring(0,
								wtfunction.getWtfunOrder().length() - 2);
						List ll = listMenu.get(order);// 得到父结点集合
						// 判断是否有父结点
						if (ll != null) {// 有父结点的情况
							LeftMenu leftMenu = new LeftMenu();
							// leftMenu.setId(wtfunction.getWtfunctionId());
							leftMenu.setId(wtfunction.getWtfunOrder());
							leftMenu.setText(wtfunction.getWtfunName());
							if (wtfunction.getWtfunIsleaf().equals("0")) { // 自己不为叶子结点时
								String ownorder = wtfunction.getWtfunOrder();
								List ownli = listMenu.get(ownorder);
								if (ownli == null) {// 自己为空,同时把自己加至自己的集合中
									List<LeftMenu> lii = new ArrayList<LeftMenu>();
									listMenu.put(wtfunction.getWtfunOrder(),
											lii);
								}
								leftMenu.setLeaf(false);
								leftMenu.setIcon(basePath
										+ "images/menuimages/working3.gif");
							} else {// 自己为叶子结点
								leftMenu.setCls("div_big");
								leftMenu.setFullPage(true);
								leftMenu.setIconCls("img_big");
								leftMenu.setIcon(basePath
										+ "images/menuimages/working.gif");
								leftMenu.setLeaf(true);
								leftMenu.setUrl(basePath
										+ wtfunction.getWtfunExcutepath());
							}
							ll.add(leftMenu);// 将自己加至父结点中
						}
					} else {// 表明为根结点
						List<LeftMenu> lii = new ArrayList<LeftMenu>();
						listMenu.put(wtfunction.getWtfunOrder(), lii);
						// listMenu.put(wtfunction.getWtfunctionId(), lii);
					}
				}
				RoleUtil.getInstance().pushMenuList(uid, listMenu);
			}
		}
	}

	public List findUserByLoginName(String loginName) {
		String queryString = "from Wtuser as u where u.wtuserLoginname=?";
		return this.getHibernateTemplate().find(queryString, loginName);
	}

	public int sameLoginNameNum(String loginName) {
		// TODO Auto-generated method stub
		String queryString = "select count(wtuserId) from Wtuser u where u.wtuserLoginname=?";
		List num = this.getHibernateTemplate().find(queryString, loginName);
		if (CollectionUtils.isEmpty(num)) {
			return 0;
		} else {
			return (Integer) num.get(0);
		}
	}

    public boolean saveuser(Wtuser user)
    {
        try
        {
            this.getHibernateTemplate().save(user);
        }
        catch (Exception e)
        {
            
            e.printStackTrace();
            return false;
        }
        return true;
    }

}
