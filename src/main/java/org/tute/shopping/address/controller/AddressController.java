package org.tute.shopping.address.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.tute.shopping.address.dao.AddressMapper;
import org.tute.shopping.address.pojo.Address;
import org.tute.shopping.cart.pojo.Cart;
import org.tute.shopping.common.util.IdUtil;
import org.tute.shopping.user.pojo.User;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * Created by dell on 2016/4/6.
 */
@Controller("address")
@RequestMapping("/address")
public class AddressController {

    @Autowired
    private AddressMapper addressMapper;

    /**
     * 全部地址
     */
    @RequestMapping(value = "/all")
    public String address(HttpServletRequest request) {
        request.getSession().setAttribute("address",addressMapper.selectByClientId(((User)request.getSession().getAttribute("user")).getClientId()));
        return "order";
    }

    /**
     * 添加地址
     */
    @RequestMapping(value = "/add")
    public String add(HttpServletRequest request,@RequestParam String addr,@RequestParam String postcode,@RequestParam String phone,@RequestParam String username) throws UnsupportedEncodingException {
        Address address = new Address();
        address.setAddrId(IdUtil.getRandomCharAndNumr(8));
        address.setClientId(((User) request.getSession().getAttribute("user")).getClientId());
        address.setAddress(addr);
        address.setPhone(phone);
        address.setUsername(username);
        address.setPostcode(postcode);
        System.out.println("show lists ------------>"+(List<Cart>)request.getAttribute("carts"));
        request.setAttribute("carts",(List<Cart>)request.getAttribute("carts"));
        int i = addressMapper.insert(address);
        if(i==1){
            request.setAttribute("code",200);
            request.setAttribute("message","添加成功！");
            request.getSession().setAttribute("address", addressMapper.selectByClientId(((User) request.getSession().getAttribute("user")).getClientId()));
        } else {
            request.setAttribute("code",500);
            request.setAttribute("message","添加失败！");
        }
        return "order";
    }

    /**
     * 删除地址
     */
    @RequestMapping(value = "/remove")
    public String remove(HttpServletRequest request,@RequestParam String addrId) {
        int i = addressMapper.deleteByPrimaryKey(addrId);
        if(i==1){
            request.setAttribute("code",200);
            request.setAttribute("message","删除成功！");
            request.getSession().setAttribute("address", addressMapper.selectByClientId(((User) request.getSession().getAttribute("user")).getClientId()));
        } else {
            request.setAttribute("code",500);
            request.setAttribute("message","删除失败！");
        }
        return "order";
    }

    /**
     * 修改地址
     */
    @RequestMapping(value = "/modify")
    public String modify(HttpServletRequest request,@RequestParam String addrId,@RequestParam String phone,@RequestParam String username,@RequestParam String postcode,@RequestParam String addr) throws UnsupportedEncodingException {
        Address address = new Address();
        address.setAddrId(addrId);
        address.setPhone(phone);
        address.setAddress(addr);
        address.setPostcode(postcode);
        address.setUsername(username);
        User user = (User) request.getSession().getAttribute("user");
        address.setClientId(user.getClientId());
        request.setAttribute("carts",(List<Cart>)request.getAttribute("carts"));
        int i = addressMapper.updateByPrimaryKey(address);
        if(i==1){
            request.setAttribute("code",200);
            request.setAttribute("message","删除成功！");
            request.getSession().setAttribute("address", addressMapper.selectByClientId(((User) request.getSession().getAttribute("user")).getClientId()));
        } else {
            request.setAttribute("code",500);
            request.setAttribute("message","删除失败！");
        }
        return "order";
    }

    /**
     * 获取某个地址
     */
    @RequestMapping(value = "/addrId")
    @ResponseBody
    public Map<String, Object> address(@RequestBody Map addrId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("address",addressMapper.selectByPrimaryKey((String)addrId.get("addrId")));
        return map;
    }
}
