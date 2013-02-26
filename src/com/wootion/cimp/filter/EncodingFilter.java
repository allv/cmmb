package com.wootion.cimp.filter;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.commons.beanutils.ConvertUtils;

import com.wootion.converterutil.UtilDataConverter;

/**
 * <p>
 * 
 * @version 1.0
 * @author
 */

public class EncodingFilter implements Filter {

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        chain.doFilter(request, response);
    }

    public void init(FilterConfig arg0) throws ServletException {
        ConvertUtils.register(new UtilDataConverter(), Date.class);
    }

}
