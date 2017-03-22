package org.tute.shopping.common.filter;

import org.tute.shopping.user.pojo.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class PeopleFilter implements Filter {

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
        if (null == session.getAttribute("user")) {
            User user = new User();
            Double random = (Math.random() * 9000 + 1000);
            System.out.println((int)Math.random() * 9000 + 1000);
            user.setUsername("游客" + random.intValue());
            System.out.println("-------------------------------"+user.getUsername());
            req.getSession().setAttribute("user", user);
        }
        arg2.doFilter(arg0, arg1);
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub
    }

}
