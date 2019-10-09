package com.oracle.intelagr.service;

import com.oracle.intelagr.common.PageModel;
import com.oracle.intelagr.entity.CompanyCPLT;

import java.util.List;

public interface ICompanyCPLTService {
    public void save(CompanyCPLT companyCPLT);
    public List<CompanyCPLT> selectAll();
    public void queryForPage(PageModel pageModel);
    public CompanyCPLT queryById(int id);
    public void update(CompanyCPLT companyCPLT);
    public void delete(int[] ids);
    public void updateFile(CompanyCPLT companyCPLT);
}
