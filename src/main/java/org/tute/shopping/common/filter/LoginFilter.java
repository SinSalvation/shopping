package org.tute.shopping.common.filter;

import org.tute.shopping.user.pojo.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class LoginFilter implements Filter {

    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }

    @Override
    public void doFilter(ServletRequest arg0, ServletResponse arg1,
                         FilterChain arg2) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) arg0;
        HttpServletResponse resp = (HttpServletResponse) arg1;
        HttpSession session = req.getSession();
        User u = (User) session.getAttribute("user");
        System.out.println("过滤器："+u);
        if (u == null){
            System.out.println("尚未登录");
            resp.sendRedirect("/shopping/user/login");
        } else {
            arg2.doFilter(arg0, arg1);
        }
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub

    }

}
