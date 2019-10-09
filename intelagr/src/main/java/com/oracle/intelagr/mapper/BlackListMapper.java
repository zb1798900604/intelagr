package com.oracle.intelagr.mapper;

import com.oracle.intelagr.entity.BlackList;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface BlackListMapper {
    public void insert(BlackList blackList);
    public List<BlackList> selectById(@Param("companyCode") String companyCode);
//    public boolean count(@Param("companyCode") String companyCode);
}
