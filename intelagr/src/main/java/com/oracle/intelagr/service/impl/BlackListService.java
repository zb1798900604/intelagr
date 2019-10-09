package com.oracle.intelagr.service.impl;

import com.oracle.intelagr.entity.BlackList;
import com.oracle.intelagr.mapper.BlackListMapper;
import com.oracle.intelagr.service.IBlackListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class BlackListService implements IBlackListService {
    @Autowired
    private BlackListMapper blackListMapper;


    @Override
    public void save(BlackList blackList) {
        blackListMapper.insert(blackList);
    }

    @Override
    public List<BlackList> selectById(String companyCode) {
        return blackListMapper.selectById(companyCode);
    }

//    @Override
//    public boolean count(String companyCode) {
//        String str=null;
//
//        if(blackListMapper.count(companyCode)){
//            return true;
//        }
//        return false;
//
//    }
}
