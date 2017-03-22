package org.tute.shopping.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tute.shopping.book.dao.BookMapper;
import org.tute.shopping.cart.dao.CartMapper;
import org.tute.shopping.cart.pojo.Cart;
import org.tute.shopping.common.util.IdUtil;
import org.tute.shopping.order.dao.OrderMapper;
import org.tute.shopping.order.pojo.Order;
import org.tute.shopping.user.pojo.User;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by dell on 2016/4/6.
 */
@Controller("order")
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private BookMapper bookMapper;

    @Autowired
    private CartMapper cartMapper;

    /**
     * 全部订单
     */
    @RequestMapping(value = "/all")
    public String order(HttpServletRequest request) {
        request.getSession().setAttribute("order",orderMapper.selectByClientId(((User)request.getSession().getAttribute("user")).getClientId()));
        request.getSession().setAttribute("orderCount", orderMapper.selectCount(((User) request.getSession().getAttribute("user")).getClientId()));
        return "orders";
    }

//     /**
     //     * 下单
     //     */
//    @RequestMapping(value = "/add")
//    public String add(HttpServletRequest request,@RequestParam List<String> bookIds,@RequestParam String addrId,@RequestParam int number) {
//        for(String id : bookIds){
//            BookWithBLOBs book = bookMapper.selectByPrimaryKey(id);
//            Order order = new Order();
//            order.setBookId(IdUtil.getRandomCharAndNumr(8));
//            order.setClientId(((User) request.getSession().getAttribute("user")).getClientId());
//            order.setAddressId(addrId);
//            order.setNumber(number);
//            order.setBookId(id);
//            order.setPrice(number*book.getPrice());
//            int i = orderMapper.insert(order);
//            if(i==1){
//                book.setRemain(book.getRemain()-1);
//                if(book.getRemain()<=0){
//                    i = bookMapper.updateByPrimaryKeyWithBLOBs(book);
//                    if(i==1){
//                        request.setAttribute("code",200);
//                        request.setAttribute("message","下单成功！");
//                        request.getSession().setAttribute("order", orderMapper.selectByClientId(((User) request.getSession().getAttribute("user")).getClientId()));
//                        request.getSession().setAttribute("orderCount", orderMapper.selectCount(((User) request.getSession().getAttribute("user")).getClientId()));
//                    } else {
//                        request.setAttribute("code", 500);
//                        request.setAttribute("message", "下单失败(库存量不足)！");
//                    }
//                } else {
//                    request.setAttribute("code", 500);
//                    request.setAttribute("message", "下单失败(库存量不足)！");
//                }
//            } else {
//                request.setAttribute("code", 500);
//                request.setAttribute("message","下单失败！");
//            }
//        }
//        return "order";
//    }

    /**
     * 从购物车下单
     */
    @RequestMapping(value = "/adds")
    @ResponseBody
    public Map addFromCart(HttpServletRequest request,@RequestBody String[] cartIds,@RequestParam String addrId) {
        Map<String,Object> result = new HashMap<String, Object>();
        for(String cartId : cartIds){
//            Book book = bookMapper.selectByBookId(cart)
            Cart cart = cartMapper.selectByPrimaryKey(Integer.parseInt(cartId));
            Order order = new Order();
            order.setOrderId(IdUtil.getRandomCharAndNumr(8));
            order.setClientId(((User) request.getSession().getAttribute("user")).getClientId());
            order.setAddressId(addrId);
            order.setNumber(cart.getNumber());
            order.setBookId(cart.getBook().getBookId());
            order.setPrice(cart.getSum());
            int i = orderMapper.insert(order);
            if(i==1){
                cart.getBook().setRemain(cart.getBook().getRemain()-cart.getNumber());
                if(cart.getBook().getRemain()>=0){
                    i = bookMapper.updateByPrimaryKey(cart.getBook());
                    if(i==1){
                        i = cartMapper.deleteByPrimaryKey(cart.getCartId());
                        if(i==1) {
                            result.put("code", 200);
                            result.put("message", "下单成功！");
                            request.getSession().setAttribute("cart", cartMapper.selectByClientId(((User) request.getSession().getAttribute("user")).getClientId()));
                            request.getSession().setAttribute("cartCount",cartMapper.selectCount(((User) request.getSession().getAttribute("user")).getClientId()));
                            request.getSession().setAttribute("order", orderMapper.selectByClientId(((User) request.getSession().getAttribute("user")).getClientId()));
                            request.getSession().setAttribute("orderCount", orderMapper.selectCount(((User) request.getSession().getAttribute("user")).getClientId()));
                        } else {
                            cart.getBook().setRemain(cart.getBook().getRemain()+cart.getNumber());
                            bookMapper.updateByPrimaryKey(cart.getBook());
                            orderMapper.deleteByPrimaryKey(order.getOrderId());
                            result.put("code", 500);
                            result.put("message", "下单失败(订单不存在)！");
                        }
                    } else {
                        orderMapper.deleteByPrimaryKey(order.getOrderId());
                        result.put("code", 500);
                        result.put("message", "下单失败(书本信息有误)！");
                    }
                } else {
                    orderMapper.deleteByPrimaryKey(order.getOrderId());
                    result.put("code", 500);
                    result.put("message", "下单失败(库存量不足)！");
                }
            } else {
                result.put("code", 500);
                result.put("message", "下单失败");
            }
        }
        return result;
    }

    @RequestMapping("/complete")
    public String complete(){
        return "complete";
    }
}
