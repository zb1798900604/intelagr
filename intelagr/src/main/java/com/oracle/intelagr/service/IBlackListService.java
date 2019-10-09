package com.oracle.intelagr.service;

import com.oracle.intelagr.entity.BlackList;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface IBlackListService {

    public void save(BlackList blackList);
    public List<BlackList> selectById(@Param("companyCode") String companyCode);
//    public boolean count(@Param("companyCode") String companyCode);
}
