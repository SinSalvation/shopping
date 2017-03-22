package org.tute.shopping.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.tute.shopping.book.dao.BookMapper;
import org.tute.shopping.book.pojo.Book;
import org.tute.shopping.cart.dao.CartMapper;
import org.tute.shopping.cart.pojo.Cart;
import org.tute.shopping.common.util.IdUtil;
import org.tute.shopping.user.pojo.User;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by dell on 2016/4/6.
 */
@Controller("cart")
@RequestMapping("cart")
public class CartController {

    @Autowired
    private CartMapper cartMapper;

    @Autowired
    private BookMapper bookMapper;

    /**
     * 查看购物车
     */
    @RequestMapping(value = "/all")
    public String address(HttpServletRequest request) {
        request.getSession().setAttribute("cart",cartMapper.selectByClientId(((User)request.getSession().getAttribute("user")).getClientId()));
        request.getSession().setAttribute("cartCount", cartMapper.selectCount(((User)request.getSession().getAttribute("user")).getClientId()));
        return "cart";
    }

    /**
     * 加入购物车
     */
    @RequestMapping(value = "/add")
    public String add(HttpServletRequest request,@RequestParam String bookId,@RequestParam int number) {
        Book book = bookMapper.selectByPrimaryKey(bookId);
        System.out.println("bookId: "+bookId+"  book: "+book);
        Cart cart = new Cart();
        cart.setBookId(IdUtil.getRandomCharAndNumr(8));
        cart.setClientId(((User) request.getSession().getAttribute("user")).getClientId());
        cart.setBookId(bookId);
        cart.setNumber(number);
        cart.setSum(book.getPrice() * number);
        int i = cartMapper.insert(cart);
        if(i==1){
            request.setAttribute("code",200);
            request.setAttribute("message","添加成功！");
            request.getSession().setAttribute("cart", cartMapper.selectByClientId(((User) request.getSession().getAttribute("user")).getClientId()));
            request.getSession().setAttribute("cartCount", cartMapper.selectCount(((User)request.getSession().getAttribute("user")).getClientId()));
        } else {
            request.setAttribute("code",500);
            request.setAttribute("message","添加失败！");
        }
        return "cart";
    }

    /**
     * 从购物车删除
     */
    @RequestMapping(value = "/remove")
    public String remove(HttpServletRequest request,@RequestParam String cartId) {
        int i = cartMapper.deleteByPrimaryKey(Integer.parseInt(cartId));
        if(i==1){
            request.setAttribute("code",200);
            request.setAttribute("message","删除成功！");
            request.getSession().setAttribute("cart", cartMapper.selectByClientId(((User) request.getSession().getAttribute("user")).getClientId()));
            request.getSession().setAttribute("cartCount", cartMapper.selectCount(((User)request.getSession().getAttribute("user")).getClientId()));
        } else {
            request.setAttribute("code",500);
            request.setAttribute("message","删除失败！");
        }
        return "cart";
    }

    /**
     * 结算
     */
    @RequestMapping(value = "/settlement")
    public String settlement(HttpServletRequest request,@RequestParam List cartIds) {
        List<Cart> carts = new ArrayList<Cart>();
        for(String  cartId : (List<String>)cartIds){
            Cart cart = cartMapper.selectByPrimaryKey(Integer.parseInt(cartId));
            carts.add(cart);
        }
        request.getSession().setAttribute("carts",carts);
        return "order";
    }
}
