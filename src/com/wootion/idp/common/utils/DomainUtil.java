package com.wootion.idp.common.utils;

import com.wootion.idp.persistence.po.bean.Wtuser;

public class DomainUtil {

    public static boolean isUserDeleted(Wtuser user) { 
	return user.getIsDelete().intValue() != 0;
    }
    
    public static boolean isUserActived(Wtuser user) { 
	return user.getWtuserIsuseable().equals("1");
    }
}
