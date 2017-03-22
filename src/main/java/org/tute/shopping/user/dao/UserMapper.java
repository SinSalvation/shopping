package org.tute.shopping.user.dao;

import org.springframework.stereotype.Component;
import org.tute.shopping.user.pojo.User;

@Component
public interface UserMapper {
    int deleteByPrimaryKey(String clientId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String clientId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByPhone(String phone);
}