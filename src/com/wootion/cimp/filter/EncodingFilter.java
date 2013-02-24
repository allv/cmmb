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
 * 文件名称：EncodingFilter.java
 * </p>
 * <p>
 * 文件描述：中文编码设置过滤器
 * </p>
 * <p>
 * 版权所有：版权所有(C)2001-2010
 * </p>
 * <p>
 * 公 司：中兴软件技术有限公司
 * </p>
 * <p>
 * 内容摘要：无
 * </p>
 * <p>
 * 其他说明：无
 * </p>
 * <p>
 * 完成日期：2010-02-10
 * </p>
 * <p>
 * 修改记录：无
 * </p>
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
