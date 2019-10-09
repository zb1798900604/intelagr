package com.oracle.intelagr.service.impl;

import com.oracle.intelagr.entity.BlackListD;
import com.oracle.intelagr.mapper.BlackListDMapper;
import com.oracle.intelagr.service.IBlackListDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BlackListDService implements IBlackListDService {
    @Autowired
    private BlackListDMapper blackListDMapper;


    @Override
    public void save(BlackListD blackListD) {
        blackListDMapper.insert(blackListD);
    }

}
