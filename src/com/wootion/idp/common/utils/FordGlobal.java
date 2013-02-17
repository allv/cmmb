package com.wootion.idp.common.utils;

public class FordGlobal
{
    public static final String CATEGORY      = "categoryservice";

    public static final String FORUM         = "forumservice";

    public static final String THREAD        = "threadservice";

    public static final String FORUMUSER     = "forumuserservice";

    public static final String FUNCTION      = "functionservice";

    public static final String ROLE          = "roleservice";

    public static final String POST          = "postservice";     /*回复*/

    /** 每页分页数 */
    public static final int    PAGENUMBER    = 2;

    /**话题回复显示数*/
    public static final int    POSTNUMBER    = 2;

    /** 用户已经登陆了 */
    public static final int    USERLOGINED   = 1;

    /** 用户名密码不匹配 */
    public static final int    ERRORPASSWORD = 2;

    /** 用户不可用了 */
    public static final int    USERUNABLE    = 4;

    /** 用户登陆成功 */
    public static final int    LOGINSUCESS   = 8;

    /**用户未审核*/
    public static final int    USERUNUSEABLE = 3;

    /**用户审核未通过*/
    public static final int    USERUNCHECK   = 5;

    /**用户未激活或被停用*/
    public static final int    USERUNACTIVE  = 6;

    /**所属大客户未激活或被停用*/
    public static final int    PUSERUNACTIVE = 7;
}
