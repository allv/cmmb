package com.wootion.cmmb.common.formPermission;

import java.io.Serializable;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.wootion.cimp.idao.BaseDao;
import com.wootion.cmmb.common.util.ServletUtil;
import com.wootion.cmmb.persistenc.po.bean.FormPermission;
import com.wootion.idp.common.utils.DomainUtil;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.dao.CommonDao;
import com.wootion.idp.persistence.po.bean.Wtuser;

public class FormPermissionDAO implements CommonDao {
	
	private CommonDao commondao;
	private BaseDao baseDao;

	@Override
	public <T> void deleteAll(Collection<T> arg0) {
		commondao.deleteAll(arg0);
	}

	@Override
	public void deleteAll(String arg0, Object[] arg1) {
		commondao.deleteAll(arg0,arg1);
	}

	@Override
	public void deleteObject(Object arg0) {
		commondao.deleteObject(arg0);
	}

	@Override
	public <T> T getObject(Class<T> arg0, Serializable arg1) {
		return commondao.getObject(arg0, arg1);
	}

	@Override
	public <T> List<T> getObjects(Class<T> arg0) {
		return commondao.getObjects(arg0);
	}

	@Override
	public <T> List<T> getObjects(Class<T> arg0, String arg1, Object[] arg2) {
		return commondao.getObjects(arg0, arg1,arg2);
	}

	@Override
	public <T> List<T> getQueryObjects(Class<T> arg0, String arg1,
			Object[] arg2, LinkedHashMap<String, String> arg3) {
		return commondao.getQueryObjects(arg0, arg1, arg2, arg3);
	}

	@Override
	public <T> QueryResult<T> getScrollData(Class<T> clazz, String pk,
			int index, int maxresult) {
		return commondao.getScrollData(clazz, pk, index, maxresult);
	}

	@Override
	public <T> QueryResult<T> getScrollData(Class<T> clazz, String pk,
			int index, int maxresult, String whererjpql, Object[] lst,
			LinkedHashMap<String, String> map) {
		Long currentUserId = ServletUtil.getCurrentUserId();
		Wtuser currentUser = commondao.getObject(Wtuser.class, currentUserId);
		if(DomainUtil.isUserAdmin(currentUser)) {
			return commondao.getScrollData(clazz, pk, index,
					maxresult, whererjpql, lst, map);
		}else{
			List<FormPermission> result = baseDao.find("from FormPermission t where t.historyHandleUsers like ?", "%"+currentUserId.toString()+"%");
			StringBuffer sb = new StringBuffer();
			if(result != null ) {
				for(FormPermission temp:result) { 
					sb.append("'"+temp.getBillid()+"',");
				}
			}
			if(StringUtils.isNotEmpty(sb.toString())) {
				String string = sb.toString().substring(0,sb.toString().length()-1);
				whererjpql = whererjpql +" and "+pk+" in ("+string+")"; 
			}
			return commondao.getScrollData(clazz, pk, index,
					maxresult, whererjpql, lst, map);
		}
	}
	
	@Override
	public <T> int getSizeObject(Class<T> arg0, String arg1) {
		return commondao.getSizeObject(arg0, arg1);
	}

	@Override
	public <T> void removeObject(Class<T> arg0, Serializable arg1) {
		commondao.removeObject(arg0, arg1);
	}

	@Override
	public void saveObject(Object arg0) {
		commondao.saveObject(arg0);
	}

	@Override
	public <T> void saveOrUpdateAll(Collection<T> arg0) {
		commondao.saveOrUpdateAll(arg0);
	}

	@Override
	public void updateCollection(String arg0, Object[] arg1) {
		commondao.updateCollection(arg0, arg1);
	}

	@Override
	public void updateObject(Object arg0) {
		commondao.updateObject(arg0);
	}

	public CommonDao getCommondao() {
		return commondao;
	}

	public void setCommondao(CommonDao commondao) {
		this.commondao = commondao;
	}

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
}
