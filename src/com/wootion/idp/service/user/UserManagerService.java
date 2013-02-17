package com.wootion.idp.service.user;

import java.io.Serializable;
import java.util.List;

import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.BaseService;

public interface UserManagerService extends BaseService
{
    /**
     * 根据用户名得到用户ID
     * @param userName
     * @return
     */
    public Long getUserID(String username);
    /**
     * 根据用户名得用户对象
     * @param userName
     * @return
     */
    public Wtuser getUserByName(String userName);
    

    /**
     * 判断用户名是否存在
     * @param userName
     * @return 如果存在，返回true
     */
    public boolean isHaveUserName(String username);

    /**
     * 用户登陆
     * @param userName
     * @param userPwd
     * @param sessionID
     * @return
     */
    public Integer userLogin(String userName, String userPwd, String sessionID);

    /**
     * 用户登出
     * @param sessionID
     * @return
     */
    public Integer userLogOut(String sessionID);

    /**
     * 用户列表显示
     * @param index
     * @param maxresult
     * @return
     */
    public QueryResult<Wtuser> getQueryResult(Integer index, Integer maxresult);

    /**
     * 查询结果
     * @param index
     * @param maxresult
     * @param startDate
     * @param endDate
     * @param username
     * @return
     */
    public QueryResult<Wtuser> getQueryUserResult(Integer index,
            Integer maxresult, String startDate, String endDate,
            String username, String wtuserIsuseable, Integer isCheck, String sessionID,int clienttype);

    /**
     * 获取用户的角色集合
     * @param userID
     * @return
     */
    public List<Wtrole> getUserRole(Long userID);
    
    //public String getParentUser(Long userID);
   
    /**
     * 保存用户角色
     * @param uc
     * @param roles
     */
    public void saveUserRole(Long userID, String roles);
    
    public void saveUserRole1(Wtuser userID, Wtrole roles);
    public void saveUserandRole1(Wtuser user, Wtrole roles);
    /**
     * 保存用户（包含角色信息）
     * @param uc
     * @param roles
     */
    public void saveUserandRole(Wtuser user, String roles);

    //////////////////////////////////////////////////////

    /**
     * 分页查询，没有查询条件
     * @param currentPage
     * @param recordsPerPage
     * @return
     */
    public List<Wtuser> getUsersPage(final int currentPage,
            final int recordsPerPage);

    /**
     * 用户登陆方法，如果返回为空，则表明用户登陆验证失败，如果不为空，则返回为当前用户拥有的
     * 角色权限的菜单菜单栏项
     * @param wtuser 用户表对象，里面应该存储用户名和密码
     * @return 返回为真表示登陆成功，反之则表示登陆失败
     */
    public boolean userLogin(Wtuser wtuser, String basePath);

    /**
     * 删除用户
     * @param pk
     * @return
     */
    public String deleteUser(Serializable pk);
   
    /**
     * 是否可以添加新的菜单
     * @param menuName
     * @param action
     * @return
     */
    public boolean isHasSameLoginName(String loginName, String action,
            String wtUserId);

    /**
     * 批量添加用户
     * @param fileName 文件名
     * @param isRollBack 是否回滚
     * @return
     */
    public String addUsersByExcel(String file, String isRollBack);
    
    //public String getParentUserId(String userid);
    
    //public List<Wtuser> getSubUserId(String userid);

}
