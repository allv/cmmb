package com.wootion.cmmb.service;

import com.wootion.cmmb.service.user.UserService;
import com.wootion.idp.common.utils.SpringBeanFactory;

public class ServiceFactroy {

	public static UserService getListUserService() {
		return (UserService) SpringBeanFactory.getSpringBean("listuserservice");
	}
}
