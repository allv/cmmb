package com.wootion.cmmb.service.user;

import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.BaseService;

public interface UserService extends BaseService {

	/**
	 * 查询结果
	 * 
	 * @param index
	 * @param maxresult
	 * @param startDate
	 * @param endDate
	 * @param username
	 * @return
	 */
	public QueryResult<Wtuser> getQueryUserResult(Integer index,
			Integer maxresult, String startDate, String endDate,
			String username, String wtuserIsuseable, Integer isCheck,
			String userType, String userShort, String sessionID);

}
