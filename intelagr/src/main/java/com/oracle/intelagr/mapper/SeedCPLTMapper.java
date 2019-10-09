package com.oracle.intelagr.mapper;

import com.oracle.intelagr.entity.SeedCPLT;

import java.util.List;
import java.util.Map;

public interface SeedCPLTMapper {
    public void insert(SeedCPLT seedCPLT);
//    public List<SeedCPLT> selectAll();
    public int count(Map<String, Object> map);
    public List<SeedCPLT> select(Map<String, Object> map);
    public SeedCPLT selectById(int id);
    public void update(SeedCPLT seedCPLT);

    public void updateFile(SeedCPLT seedCPLT);
}
