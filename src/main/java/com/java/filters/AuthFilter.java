package com.java.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 过滤main.jsp
 * time:11:38
 * author:丁鹏
 */
@WebFilter("/*")
public class AuthFilter implements Filter{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        //获取请求的具体资源名:/main.jsp   main.jsp
        String uri = request.getRequestURI();
        //判断用户是否登录
        HttpSession session = request.getSession();
        Object name = session.getAttribute("name");
        if(uri!=null && uri.endsWith("main.jsp") && name==null){//没有登录
            response.sendRedirect("/pages/admin/login.jsp");
        }else{
            filterChain.doFilter(request,response);
        }
    }

    @Override
    public void destroy() {

    }
}
