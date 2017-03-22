package org.tute.shopping.cart.dao;

import org.springframework.stereotype.Component;
import org.tute.shopping.cart.pojo.Cart;

import java.util.List;

@Component
public interface CartMapper {
    int deleteByPrimaryKey(Integer cartId);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(Integer cartId);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);

    int selectCount(String clientId);

    List<Cart> selectByClientId(String clientId);
}