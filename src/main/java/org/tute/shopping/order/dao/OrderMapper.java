package org.tute.shopping.order.dao;

import org.springframework.stereotype.Component;
import org.tute.shopping.order.pojo.Order;

import java.util.ArrayList;
import java.util.List;

@Component
public interface OrderMapper {
    int deleteByPrimaryKey(String orderId);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(String orderId);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    int selectCount(String clientId);

    List<Order> selectByClientId(String clientId);

    List<Order> selectAll();
}