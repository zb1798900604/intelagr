package com.oracle.intelagr.service;

import com.oracle.intelagr.common.PageModel;
import com.oracle.intelagr.entity.SeedCPLT;

import java.util.List;

public interface ISeedCPLTService {
    public void save(SeedCPLT seedCPLT);
    public List<SeedCPLT> selectAll();
    public void queryForPage(PageModel pageModel);
    public SeedCPLT queryById(int id);
    public void update(SeedCPLT seedCPLT);
    public void delete(int[] ids);
    public void updateFile(SeedCPLT seedCPLT);

}
