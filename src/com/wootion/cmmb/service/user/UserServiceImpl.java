package com.wootion.cmmb.service.user;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import com.wootion.cmmb.common.util.DateUtil;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.BaseServiceImpl;

public class UserServiceImpl extends BaseServiceImpl implements UserService
{

    public QueryResult<Wtuser> getQueryUserResult(Integer index,
            Integer maxresult, String startDate, String endDate,
            String username, String wtuserIsuseable, Integer isCheck,
            String userType, String userShort, String sessionID)
    {
        String whererjpql = " o.wtuserLoginname != 'admin'"
                + " and o.wtuserLoginname != 'admin' and o.pid = 0";
        List<Object> lst = new ArrayList<Object>();
        if (startDate != null && !startDate.trim().equals(""))
        {
            whererjpql = whererjpql + " and o.wtuserCreatetime >= ?";
            lst.add(DateUtil.getNormalDate(startDate));
        }
        if (endDate != null && !endDate.trim().equals(""))
        {
            whererjpql = whererjpql + " and o.wtuserCreatetime <= ?";
            lst.add(DateUtil.getNormalDate(endDate));
        }
        if (username != null && !username.trim().equals(""))
        {
            whererjpql = whererjpql + " and o.wtuserLoginname like '%"
                    + username + "%'";
        }
        if (wtuserIsuseable != null && !wtuserIsuseable.trim().equals("")
                && !"-1".equals(wtuserIsuseable.trim()))
        {
            whererjpql = whererjpql + " and o.wtuserIsuseable = '"
                    + wtuserIsuseable + "'";
        }

        whererjpql = whererjpql + " and o.isCheck = 1";

        if (userType != null && !userType.trim().equals("")
                && !"-1".equals(userType.trim()))
        {
            whererjpql = whererjpql + " and o.userType = '" + userType + "'";
        }

        if (userShort != null && !userShort.trim().equals(""))
        {
            whererjpql = whererjpql + " and o.userShort like '%" + userShort
                    + "%'";
        }

        /*增加对登录用户的角色判断
         *当大客户登录时，只显示大客户所属用户列表*/
        /*
        Long userID = PermissionCollection.getInstance()
                .getUserCache(sessionID).getUserID();
        Wtuser user = (Wtuser) ServiceFactroy.getUserService().getObjectByID(
                Wtuser.class, userID);
        if (user.getPid() == 0 && !"admin".equals(user.getWtuserLoginname())
                && !"superAdmin".equals(user.getWtuserLoginname()))
            whererjpql = whererjpql + " and o.pid = " + userID;
            */

        LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();

        map.put("userMark", "ASC");
        map.put("userExtendMark", "ASC");

        return this.commonDao.getScrollData(Wtuser.class, "wtuserId", index,
                maxresult, whererjpql, lst.toArray(), map);
    }

}
