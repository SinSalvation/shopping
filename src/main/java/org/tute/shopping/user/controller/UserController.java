package org.tute.shopping.user.controller;


import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.tute.shopping.address.dao.AddressMapper;
import org.tute.shopping.book.dao.BookMapper;
import org.tute.shopping.book.pojo.BookWithBLOBs;
import org.tute.shopping.cart.dao.CartMapper;
import org.tute.shopping.common.util.MD5Util;
import org.tute.shopping.order.dao.OrderMapper;
import org.tute.shopping.order.pojo.Order;
import org.tute.shopping.user.dao.UserMapper;
import org.tute.shopping.user.pojo.User;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

/**
 * Created by dell on 2016/4/5.
 */
@Controller("user")
@RequestMapping("user")
public class UserController {

    @Autowired
    private AddressMapper addressMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private BookMapper bookMapper;

    @Autowired
    private CartMapper cartMapper;

    /**
     * 注册
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String toregist() {
        return "register";
    }

    /**
     * 注册
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> regist(HttpServletRequest request, @RequestBody Map value)
            throws IOException {
        User user = new User();
        user.setClientId(MD5Util.MD5((String) value.get("phone")).substring(10));
        user.setPhone((String) value.get("phone"));
        user.setUsername((String) value.get("username"));
        user.setPassword(MD5Util.MD5((String) value.get("password")));
        System.out.println("password: " + MD5Util.MD5((String) value.get("password")));
        int i = userMapper.insert(user);
        Map<String, Object> map = new HashMap<String, Object>();
        if (i == 1) {
            map.put("code", 200);
            map.put("message", "注册成功！");
        } else {
            map.put("code", 500);
            map.put("message", "注册失败！");
        }
        return map;
    }

    /**
     * 验证手机
     */
    @RequestMapping(value = "/phone", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> phone(HttpServletRequest request, @RequestBody Map value)
            throws IOException {
        User user = userMapper.selectByPhone((String) value.get("phone"));
        Map<String, Object> map = new HashMap<String, Object>();
        if (null == user) {
            map.put("code", 200);
            map.put("message", "手机号可以使用！");
        } else {
            map.put("code", 500);
            map.put("message", "手机号不能使用！");
        }
        return map;
    }

    /**
     * 登录
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String tologin() {
        return "login";
    }

    /**
     * 登录
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> login(HttpServletRequest request, @RequestBody Map value)
            throws IOException {
        User user = userMapper.selectByPhone((String) value.get("phone"));
        Map<String, Object> map = new HashMap<String, Object>();
        Set<BookWithBLOBs> result = new HashSet<BookWithBLOBs>();
        if (null == user) {
            map.put("code", 500);
            map.put("message", "用户名或密码不正确！");
        } else if (MD5Util.MD5((String) value.get("password")).equals(user.getPassword())) {
            map.put("code", 200);
            map.put("message", "登陆成功！");
            request.getSession().setAttribute("user", user);
            request.getSession().setAttribute("orderCount", orderMapper.selectCount(user.getClientId()));
            request.getSession().setAttribute("cartCount", cartMapper.selectCount(user.getClientId()));
            request.getSession().setAttribute("cart", cartMapper.selectByClientId(user.getClientId()));
            request.getSession().setAttribute("order", orderMapper.selectByClientId(user.getClientId()));
            request.getSession().setAttribute("address", addressMapper.selectByClientId(user.getClientId()));
            List<BookWithBLOBs> books = new ArrayList<BookWithBLOBs>();
            if (orderMapper.selectCount(user.getClientId()) == 0) {
                for (Order order : orderMapper.selectAll()) {
                    books.add(bookMapper.selectByPrimaryKey(order.getBookId()));
                    if (books.size() > 10) {
                        break;
                    }
                }
            } else {
                books.addAll(bookMapper.selectByClientId(user.getClientId()));
            }
            result.addAll(books);
            request.setAttribute("books", result);
        } else {
            map.put("code", 500);
            map.put("message", "用户名或密码不正确！");
        }
        return map;
    }

    /**
     * 首页推荐
     */
    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request)
            throws IOException {
        List<BookWithBLOBs> books = new ArrayList<BookWithBLOBs>();
        Set<BookWithBLOBs> result = new HashSet<BookWithBLOBs>();
        for (Order order : orderMapper.selectAll()) {
            books.add(bookMapper.selectByPrimaryKey(order.getBookId()));
            if (books.size() > 10) {
                break;
            }
        }
        result.addAll(books);
        request.setAttribute("books", result);
        return "index";
    }

    /**
     * 登出
     */
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request)
            throws IOException {
        request.getSession().removeAttribute("user");
        request.getSession().removeAttribute("cart");
        request.getSession().removeAttribute("cartCount");
        request.getSession().removeAttribute("orderCount");
        request.getSession().removeAttribute("order");
        request.getSession().removeAttribute("address");
        return "login";
    }

    /**
     * 修改信息
     */
    @RequestMapping(value = "/modify")
    @ResponseBody
    public Map<String, Object> modify(HttpServletRequest request) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        Map<String, Object> map = new HashMap<String, Object>();
        if (request.getParameter("method").equals("username")) {
            user.setUsername(new String(request.getParameter("username").getBytes("ISO8859-1"), "UTF-8"));
            int i = userMapper.updateByPrimaryKey(user);
            if (i == 1) {
                map.put("code", 200);
                map.put("message", "修改成功！");
                request.getSession().setAttribute("user", user);
            } else {
                map.put("code", 500);
                map.put("message", "修改失败！");
            }
        } else if (request.getParameter("method").equals("password")) {
            if (user.getPassword().equals(MD5Util.MD5(request.getParameter("password0")))) {
                user.setPassword(MD5Util.MD5(request.getParameter("password")));
                int i = userMapper.updateByPrimaryKey(user);
                if (i == 1) {
                    map.put("code", 200);
                    map.put("message", "修改成功！");
                    request.getSession().setAttribute("user", user);
                } else {
                    map.put("code", 500);
                    map.put("message", "修改失败！");
                }
            } else {
                map.put("code", 500);
                map.put("message", "修改失败！");
            }
        }
        return map;
    }

    /**
     * 上传图片
     */
    @RequestMapping(value = "/upload")
    @ResponseBody
    public Map<String, Object> upload(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws FileUploadException, IOException {
        Map<String, Object> map = new HashMap<String, Object>();
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(request.getSession().getServletContext().getRealPath("images") + ((User) request.getSession().getAttribute("user")).getClientId() + ".jpg")));
                stream.write(bytes);
                stream.close();
                map.put("code", 200);
                map.put("message", "上传成功！");
            } catch (Exception e) {
                map.put("code", 500);
                map.put("message", "上传失败！");
            }
        } else {
            map.put("code", 500);
            map.put("message", "图片不存在！");
        }
        return map;
    }
}
