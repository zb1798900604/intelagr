package com.oracle.intelagr.mapper;

import com.oracle.intelagr.entity.CompanyCPLT;
import com.oracle.intelagr.entity.SeedCPLT;

import java.util.List;
import java.util.Map;

public interface CompanyCPLTMapper {
    public void insert(CompanyCPLT companyCPLT);
    public List<CompanyCPLT> selectAll();
    public int count(Map<String, Object> map);
    public List<CompanyCPLT> select(Map<String, Object> map);
    public CompanyCPLT selectById(int id);
    public void update(CompanyCPLT companyCPLT);
    public void updateFile(CompanyCPLT companyCPLT);
}
