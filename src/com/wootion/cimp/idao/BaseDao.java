package com.wootion.cimp.idao;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;

import com.wootion.cimp.vo.data.healtheval;
import com.wootion.cimp.vo.data.workerstatistic;
import com.wootion.idp.common.utils.QueryResult;

/**
 * <p>
 * 文件名称: BaseDao.java 
 * </p>
 * <p>
 * 文件描述: 操作数据库相关接口类
 * </p>
 * <p>
 * 修改记录：无
 * </p>
 * 
 * @version 1.0
 */
public interface BaseDao<E> {
	/**
	 * 返回ID=ID的持久对象，当记录不存在时候，返回null
	 * 
	 * @param id
	 * @param entityClass
	 * @return E
	 */
	public E getEntityById(String id, Class<E> entityClass);

	public List<healtheval> queryNQLForHealtheval(String sql);
	
	/**
	 * 返回ID=ID的代理对象，延迟加载，当记录不存在时候，产生异常
	 * 
	 * @param id
	 * @param entityClass
	 * @return E
	 */
	public E loadEntityById(String id, Class<E> entityClass);

	/**
	 * 保存对象，并返回保存的对象的ID
	 * 
	 * @param Object entity
	 * @return String
	 */
	public String save(Object entity);

	/**
	 * 更新对象信息
	 * 
	 * @param Object entity
	 */
	public void update(Object entity);

	/**
	 * 刪除对象
	 * 
	 * @param Object entity
	 */
	public void delete(Object entity);

	/**
	 * 根据传入一个Collection,删除这个Collection对象，即批量删除
	 * 
	 * @param collection
	 */
	public void deleteAll(Collection<E> collection);

	/**
	 * 更新内存中的数据
	 * 
	 * @param Object entity
	 */
	public void refresh(Object entity);

	/**
	 * 提交内存中的数据
	 */
	public void flush();

	/**
	 * saveOrUpdate对象信息
	 * 
	 * @param Object entity
	 */
	public void saveOrUpdate(Object entity);

	//批量更新
    public void saveOrUpdateAll(Collection<E> collection);
	/**
	 * 返回所有的对象信息list
	 * 
	 * @param entityClass
	 * @return List<E>
	 */
	public List<E> listAll(Class<E> entityClass);

	/**
	 * 返回根据字段name和数据value得到的持久对象
	 * 
	 * @param name
	 * @param value
	 * @param entityClass
	 * @return E
	 */
	public E loadBy(String name, Object value, Class<E> entityClass);

	/**
	 * 返回根据数组字段name[]和数据value[]得到的持久对象
	 * 
	 * @param names[]
	 * @param values[]
	 * @param entityClass
	 * @return E
	 */
	public E loadBy(String[] names, Object[] values, Class<E> entityClass);

	/**
	 * 根据字段name和数据value返回对象list
	 * 
	 * @param name
	 * @param value
	 * @param entityClass
	 * @return List<E>
	 */
	public List<E> findBy(String name, Object value, Class<E> entityClass);

	/**
	 * 根据数组字段name[],数据value[]返回对象list
	 * 
	 * @param names[]
	 * @param values[]
	 * @param entityClass
	 * @return List<E>
	 */
	public List<E> findBy(String[] names, Object[] values, Class<E> entityClass);

	/**
	 * 执行SQL
	 * 
	 * @param sql
	 */
	public void executeSQL(String sql);

	/**
	 * 执行HSQL,语句必须符合HSQL规范
	 * 
	 * @param sql
	 * @return List<E>
	 */
	public List<E> queryHQL(String sql);

	/**
	 * 执行本地SQL
	 * 
	 * @param sql
	 * @return List<E>
	 */
	public List<E> queryNQL(String sql);

	/**
	 * 查询方法 eg:from User where username=?
	 * 
	 * @param queryString
	 * @param values
	 * @return List<E>
	 */
	public List<E> find(String queryString, Object values);

	/**
	 * 查询方法 eg:from User where username=? and password=?
	 * 
	 * @param queryString
	 * @param values[]
	 * @return List<E>
	 */
	public List<E> find(String queryString, Object[] values);

	/**
	 * 返回最大记录数
	 * 
	 * @param entityName
	 * @return int
	 */
	public int count(String entityName);

	/**
	 * 根据查询条件返回最大记录数 eg from User where name=? and id=?
	 * 
	 * @param countString
	 * @param values[]
	 * @return int
	 */
	public int count(String countString, Object[] values);

	/**
	 * 将某个对象从内部缓存中清除
	 * 
	 * @param Object entity
	 * 
	 */
	public void evict(Object entity);

	
	/**
	 * 清空内部缓存
	 * 
	 */
	public void clear();

	public void close();
	
	public SessionFactory getFactory();
	
	/**
	 * 分页方法
	 * 
	 * @param entityClass
	 * @param page
	 * @param pagesize
	 * @return List<E>
	 */
	public List<E> getPage(Class<E> entityClass, int page, int pagesize);

	/**
	 * 调用存储过程
	 * 
	 * @param procName
	 * @param field参数数组
	 * @return flag 成功、失败标志
	 */
	public String callProc(String procName, String[] field);

	/**
	 * not in 应用 Class myClass,String objName,String objParam,List paramList
	 * myClass：SysUser.class，objName：‘SysUser’，objParam：‘SysUser.MUserId’ return
	 * list
	 */
	// public List notIn(Class myClass,String objName,String objParam,List
	// paramList);
	/**
	 * 更新移动树节点
	 */
	public void updateNode(Object obj) throws HibernateException;

	/**
	 * 保存一个对象
	 */
	public void saveObject(Object obj) throws HibernateException;

	public QueryResult<E> getPageData(String querySql, int firstindex, int maxresult,String careflag)throws HibernateException;
}
