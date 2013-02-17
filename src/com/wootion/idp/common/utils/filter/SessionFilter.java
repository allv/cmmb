/*jadclipse*/// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.

package com.wootion.idp.common.utils.filter;

import com.wootion.idp.common.collections.PermissionCollection;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionFilter
    implements Filter
{

    public SessionFilter()
    {
    }

    public String getEncoding()
    {
        return encoding;
    }

    public void setEncoding(String encoding)
    {
        this.encoding = encoding;
    }

    public void destroy()
    {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
        throws IOException, ServletException
    {
        HttpSession session = ((HttpServletRequest)request).getSession();
        HttpServletRequest httpRequest = (HttpServletRequest)request;
        if(session != null)
        {
            String tempa = httpRequest.getRequestURI();
            String tempb = tempa.substring(httpRequest.getContextPath().length(), tempa.length());
            if(!"/logout.do".trim().equals(tempb) && !"/index.do".trim().equals(tempb) && !"/login.do".trim().equals(tempb) && !"/menu.do".trim().equals(tempb) && !"/userregister.do".trim().equals(tempb) && !"/userregisterdo.do".trim().equals(tempb) && !"/unregister.do".trim().equals(tempb) && !"/unregisterdo.do".trim().equals(tempb))
            {
                String sessionID = session.getId();
                com.wootion.idp.common.collections.UserCacheBean uc = PermissionCollection.getInstance().getUserCache(sessionID);
                if(uc == null)
                {
                    String path = httpRequest.getContextPath();
                    String basePath = (new StringBuilder(String.valueOf(request.getScheme()))).append("://").append(request.getServerName()).append(":").append(request.getServerPort()).append(path).toString();
                    request.setAttribute("back", basePath);
                    request.setAttribute("msg", "\u7531\u4E8E\u957F\u65F6\u95F4\u672A\u64CD\u4F5C,session\u5DF2\u5931\u6548,\u8BF7\u91CD\u65B0\u767B\u9646\u7CFB\u7EDF!");
                    request.setAttribute("type", "error");
                    RequestDispatcher rd = httpRequest.getRequestDispatcher("/pages/train/message.jsp");
                    rd.forward(request, response);
                    return;
                }
            }
        }
        filterChain.doFilter(request, response);
    }

    public void init(FilterConfig config)
        throws ServletException
    {
        encoding = config.getInitParameter("encoding");
    }

    private String encoding;
}


/*
	DECOMPILATION REPORT

	Decompiled from: E:\music\cmmb1\cmmb\WebRoot\WEB-INF\lib\wootion.jar
	Total time: 24 ms
	Jad reported messages/errors:
	Exit status: 0
	Caught exceptions:
*/