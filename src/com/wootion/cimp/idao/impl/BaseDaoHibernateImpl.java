package com.wootion.cimp.idao.impl;

import java.lang.reflect.ParameterizedType;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Types;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.wootion.cimp.idao.BaseDao;

/**
 * <p>
 * 文件名称：BaseDaoHibernateImpl.java
 * </p>
 * <p>
 * 文件描述：公共接口实现类
 * <p>
 * <p>
 * 修改记录：无
 * </p>
 * 
 * @version 1.0
 * @author
 */
public class BaseDaoHibernateImpl<E> extends HibernateDaoSupport implements
		BaseDao<E> {
	protected Logger log = Logger.getLogger(this.getClass());

	/**
	 * 
	 * @param Class
	 *            <E>
	 * @return Class<E>
	 */
	@SuppressWarnings("unchecked")
	protected Class<E> getEntityClass(Class<E> entityClass) {
		return entityClass = (Class<E>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}

	/**
	 * 根据类名获取类
	 * 
	 * @param entityClassName
	 * @throws ClassNotFoundException
	 */
	@SuppressWarnings("unchecked")
	public void setEntityClass(String entityClassName)
			throws ClassNotFoundException {
		@SuppressWarnings("unused")
		final Class<E> entityClass = (Class<E>) Class.forName(entityClassName);
	}

	/**
	 * 返回Criteria
	 * 
	 * @param entityClass
	 * @return Criteria
	 */
	protected Criteria getCriteria(Class<E> entityClass) {
		Criteria criteria = getSession().createCriteria(entityClass);
		criteria.setCacheable(true);
		return criteria;
	}

	/*-----------------------接口实现类-------------------------------------*/

	/**
	 * 返回ID=ID的持久对象，当记录不存在时候，返回null
	 * 
	 * @param id
	 * @param entityClass
	 * @return E
	 */
	@SuppressWarnings("unchecked")
	public E getEntityById(String id, Class<E> entityClass) {

		return (E) getHibernateTemplate().get(entityClass, id);
	}

	/**
	 * 返回ID=ID的代理对象，延迟加载，当记录不存在时候，差生异常
	 * 
	 * @param id
	 * @param entityClass
	 * @return E
	 */
	@SuppressWarnings("unchecked")
	public E loadEntityById(String id, Class<E> entityClass) {
		return (E) getHibernateTemplate().load(entityClass, id);
	}

	/**
	 * 保存对象，并返回保存的对象的ID
	 * 
	 * @param Object entity
	 * @return String
	 */
	public String save(Object entity) {
		return (String) getHibernateTemplate().save(entity);
	}

	/**
	 * 更新对象信息
	 * 
	 * @param Object entity
	 * 
	 */
	public void update(Object entity) {
		getHibernateTemplate().update(entity);
	}

	/**
	 * 删除对象
	 * 
	 * @param Object entity
	 */
	public void delete(Object entity) {
		getHibernateTemplate().delete(entity);
		flush();
	}

	/**
	 * 根据传入一个Collection,删除这个Collection对象，即批量删除
	 * 
	 * @param collection
	 */
	public void deleteAll(Collection<E> collection) {
		getHibernateTemplate().deleteAll(collection);
		flush();
	}

	/**
	 * 提交内存中的数据
	 */
	public void flush() {
		getHibernateTemplate().flush();
	}

	/**
	 * 更新内存中的数据
	 * 
	 * @param Object entity
	 * 
	 */
	public void refresh(Object entity) {
		getHibernateTemplate().refresh(entity);
	}
	
	
	/**
	 * saveOrUpdate对象信息
	 * 
	 * @param  Object entity
	 * 
	 */
	public void saveOrUpdate(Object entity) {
		getHibernateTemplate().saveOrUpdate(entity);
	}

	/**
	 * 根据传入一个Collection,保存这个Collection对象，即批量增加或者更新
	 * 
	 * @param collection
	 */
	public void saveOrUpdateAll(Collection<E> collection) {
		getHibernateTemplate().saveOrUpdateAll(collection);
	}
	
	public SessionFactory getFactory(){
		return getHibernateTemplate().getSessionFactory();
		
	}

	/**
	 * 返回所有的对象信息list
	 * 
	 * @param entityClass
	 * @return List<E>
	 */
	@SuppressWarnings("unchecked")
	public List<E> listAll(Class<E> entityClass) {
		return getHibernateTemplate().loadAll(entityClass);
	}

	/**
	 * 执行SQL
	 * 
	 * @param sql
	 */
	public void executeSQL(String sql) {
		getSession().createSQLQuery(sql).executeUpdate();
		
	}

	
	
	/**
	 * 执行HSQL,语句必须符合HSQL规范
	 * 
	 * @param sql
	 * @return List<E>
	 */
	@SuppressWarnings("unchecked")
	public List<E> queryHQL(String sql) {
		return getSession().createQuery(sql).list();
	}

	/**
	 * 执行本地SQL
	 * 
	 * @param sql
	 * @return List<E>
	 */
	@SuppressWarnings("unchecked")
	public List<E> queryNQL(String sql) {
		return getSession().createSQLQuery(sql).list();
	}

	/**
	 * 返回根据字段name和数据value得到的持久对象
	 * 
	 * @param name
	 * @param value
	 * @param entityClass
	 * @return E
	 */
	public E loadBy(String name, Object value, Class<E> entityClass) {
		return loadBy(new String[] { name }, new Object[] { value },
				entityClass);
	}

	/**
	 * 返回根据数组字段name[]和数据value[]得到的持久对象
	 * 
	 * @param names[]
	 * @param values[]
	 * @param entityClass
	 * @return E
	 */
	public E loadBy(String[] names, Object[] values, Class<E> entityClass) {
		E result = null;
		List<E> resultList = findBy(names, values, entityClass);
		if (resultList.size() > 0) {
			result = resultList.get(0);
		}
		return result;
	}

	/**
	 * 根据字段name和数据value返回对象list
	 * 
	 * @param name
	 * @param value
	 * @param entityClass
	 * @return List<E>
	 */
	public List<E> findBy(String name, Object value, Class<E> entityClass) {
		return findBy(new String[] { name }, new Object[] { value },
				entityClass);
	}

	/**
	 * 根据数组字段name[],数据value[]返回对象list
	 * 
	 * @param names[]
	 * @param values[]
	 * @param entityClass
	 * @return List<E>
	 */
	@SuppressWarnings("unchecked")
	public List<E> findBy(String[] names, Object[] values, Class<E> entityClass) {
		if (names == null || values == null || names.length != values.length) {
			throw new HibernateException("Illegal name and values" + names
					+ ":" + values);
		}
		Criteria criteria = getCriteria(entityClass);
		Map<String, Object> criteriaMap = new HashMap<String, Object>();
		for (int i = 0; i < names.length; i++) {
			criteriaMap.put(names[i], values[i]);
		}
		criteria.add(Restrictions.allEq(criteriaMap));
		criteria.setCacheable(true);
		return criteria.list();
	}

	/**
	 * 查询方法 eg:from User where username=?
	 * 
	 * @param queryString
	 * @param values
	 * @return List<E>
	 */
	@SuppressWarnings("unchecked")
	public List<E> find(String queryString, Object values) {
		return getHibernateTemplate().find(queryString, values);
	}

	/**
	 * 查询方法 eg:from User where username=? and password=?
	 * 
	 * @param queryString
	 * @param values[]
	 * @return List<E>
	 */
	@SuppressWarnings("unchecked")
	public List<E> find(String queryString, Object[] values) {
		return getHibernateTemplate().find(queryString, values);
	}

	/**
	 * 返回最大记录数
	 * 
	 * @param entityName
	 * @return int
	 */
	public int count(String entityName) {
		StringBuffer sb = new StringBuffer("select count(*) from ");
		sb.append(entityName);
		int countData = ((Integer) getHibernateTemplate().find(sb.toString())
				.get(0)).intValue();
		return countData;
	}

	/**
	 * 根据查询条件返回最大记录数 eg from User where name=? and id=?
	 * 
	 * @param countString
	 * @param values[]
	 * @return int
	 */
	public int count(String countString, Object[] values) {
		StringBuffer sb = new StringBuffer("select count(*) ");
		sb.append(countString);
		int countData = ((Integer) getHibernateTemplate().find(sb.toString(),
				values).get(0)).intValue();
		return countData;
	}

	/**
	 * 将某个对象从内部缓存中清除
	 * 
	 * @param Object entity
	 * 
	 */
	public void evict(Object entity) {
		getSession().evict(entity);
	}

	/**
	 * 清空内部缓存
	 * 
	 */
	public void clear() {
		getSession().clear();
	}

	public void close(){
		getSession().close();
	}
	
	/**
	 * 分页方法
	 * 
	 * @param entityClass
	 * @param page
	 * @param pagesize
	 * @return List<E>
	 */
	@SuppressWarnings("unchecked")
	public List<E> getPage(Class<E> entityClass, int page, int pagesize) {
		Criteria criteria = getCriteria(entityClass);
		criteria.setFirstResult((page - 1) * pagesize);
		criteria.setMaxResults(page * pagesize);
		return criteria.list();
	}

	/**
	 * 调用存储过程
	 * 
	 * @param procName
	 * @param field参数数组
	 * @return flag 成功、失败标志
	 */
	public String callProc(String procName, String[] field) {
		String flag = "2";
		final int length = field.length;
		// Transaction tx = this.getSession().beginTransaction();
		Session session = this.getSession();
		Connection con = session.connection();
		String sql = "{call ";
		sql += procName;
		sql += "(";
		for (int i = 0; i < length; i++) {
			sql += "?,";
			// if(i < length-1)
			// {
			// sql += ",";
			// }
		}
		sql += "?";
		sql += ") }";
		// System.out.println(sql);
		try {
			CallableStatement cstmt = con.prepareCall(sql);

			for (int i = 0; i < length; i++) {
				cstmt.setString(i + 1, field[i]);
				// System.out.println(field[i]);
			}
			cstmt.registerOutParameter(length + 1, Types.CHAR);
			cstmt.executeUpdate();
			// cstmt.execute();
			flag = cstmt.getString(length + 1);
			// System.out.println("aaa::"+cstmt.getString(length+1));
		} catch (Exception e) {
			e.printStackTrace();
			//System.out.println("执行存储过程失败");
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return flag;
	}

	/**
	 * 更新树节点
	 */
	public void updateNode(Object obj) {
		try {
			this.getSession().flush();// 解决:a different object with the same
			// identifier value was already
			// associated with the session
			this.getSession().clear();// 解决同上问题
			this.getHibernateTemplate().merge(obj);// 解决:Found two
			// representations of same
			// collection问题的解决方法
		} catch (Exception e) {

			e.printStackTrace();
			logger.error("更新树节点对象失败", e);
		}
	}

	/**
	 * 保存一个对象
	 */
	public void saveObject(Object obj) throws HibernateException {
		try {
			getHibernateTemplate().save(obj);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("保存一个对象失败", e);
		}
	}
}
