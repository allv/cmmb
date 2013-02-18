package com.wootion.idp.service.role;

import java.io.Serializable;
import java.util.List;

import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.po.bean.Wtpermission;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.BaseService;
import com.wootion.idp.view.vo.FordNagativation;

/**
 * 角色管理服务类
 * 
 * @author Administrator
 * 
 */
public interface RoleManagerService extends BaseService {

	public List<Wtpermission> getAllRolePermission();

	/**
	 * 查询结果，含分页信息
	 * 
	 * @param index
	 * @param maxresult
	 * @param startDate
	 * @param endDate
	 * @param username
	 * @return
	 */
	public QueryResult<Wtrole> getQueryUserResult(Integer index,
			Integer maxresult, String startDate, String endDate, String username);

	/**
	 * 根据角色ID，获取对应的权限列表，列表含有当前角色是否拥有对应权限的判断
	 * 
	 * @param roleID
	 * @return
	 */
	public List<FordNagativation> getRoleNagativation(Long roleID);

	/**
	 * 对某个角色分配权限
	 * @param roleID
	 * @param funs
	 * @param ress
	 */
	public void saveFPermission(Long roleID,String funs,String ress);
	
	/////////////////////////////////////////////////////////
	
	/**
	 * 给角色添加资源，一次只能给角色添加一个资源
	 * 
	 * @param roleid
	 *            角色ID
	 * @param resid
	 *            资源ID
	 */
	public void addRoleResource(Long roleid, Long resid);

	/**
	 * 给角色添加几个资源，一次添加几个的情况下调用
	 * 
	 * @param roleid
	 *            角色ID
	 * @param liResid
	 *            资源ID集合
	 */
	public void addRoleResources(Long roleid, List<Long> liResid);

	/**
	 * 列表查询中的分页获取数据
	 * 
	 * @param currentPage
	 * @param recordsPerPage
	 * @return
	 */
	public List getRecordsByPage(final int currentPage, final int recordsPerPage);

	/**
	 * 删除角色
	 * 
	 * @param pk
	 * @return
	 */
	public String deleteRole(Serializable pk);
	
	/**
     * 列表查询中的分页获取数据
     * 
     * @param currentPage
     * @param recordsPerPage
     * @return
     */
    public List<Wtrole> getRecords();
}
