package org.tute.shopping.address.dao;

import org.springframework.stereotype.Component;
import org.tute.shopping.address.pojo.Address;

import java.util.List;

@Component
public interface AddressMapper {
    int deleteByPrimaryKey(String addrId);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(String addrId);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);

    List<Address> selectByClientId(String clientId);
}