package com.wootion.idp.persistence.dao.user;

import java.util.List;

import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.persistence.po.bean.Wtuser;

public interface UserManagerDAO {
	
	/**
	 * 删除用户的角色
	 * @param userID
	 */
	public void deleteUserRole(Long userID);
	
	/**
	 * 获取某一用户的角色集合
	 * @param userID
	 * @return
	 */
	public List<Wtrole> getUserRoles(Long userID);
	
	//public String getPid(String userid);
	
	//public List<Wtuser> getSubid(String userid);
	////////////////////////////////////////////////////
    /**
     * 根据用户名得到用户对象
     * @param userName
     * @return
     */
	public Wtuser getUserByUserName(String userName);
	
	
	
    /**
     * 用户登陆方法，如果返回为空，则表明用户登陆验证失败，如果不为空，则返回为当前用户拥有的
     * 角色权限的菜单菜单栏项
     * @param wtuser 用户表对象
     * @return
     */
    public boolean userLogin(Wtuser wtuser,String basePath);
    
    
    public List<Wtrole> getParentRoles(String parentrole);
    /**
     * 根据登录名获得用户
     * @param loginName
     * @return
     */
   public List findUserByLoginName(String loginName);

   /**
    * 获得传入参数的对象个数
    * @param loginName
    * @return
    */
   public int sameLoginNameNum(String loginName);
   
   public boolean saveuser(Wtuser user);
   
   public List<Wtuser> getUsers(Wtuser queryObject);
   
   public Wtuser findUserById(Long userid);
}
