package com.oracle.intelagr.service.impl;

import com.oracle.intelagr.common.PageModel;
import com.oracle.intelagr.entity.CompanyCPLT;
import com.oracle.intelagr.mapper.CompanyCPLTMapper;
import com.oracle.intelagr.service.ICompanyCPLTService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class CompanyCPLTService implements ICompanyCPLTService {
    @Autowired
    private CompanyCPLTMapper companyComplaintMapper;

    @Override
    public void save(CompanyCPLT companyCPLT) {
        companyComplaintMapper.insert(companyCPLT);
    }

    @Override
    public List<CompanyCPLT> selectAll() {
        return companyComplaintMapper.selectAll();
    }


    @Override
    public void queryForPage(PageModel pageModel) {
        Map map=(Map) pageModel.getData();
        map.put("index",(pageModel.getPage()-1)*pageModel.getPageSize());
        map.put("pageSize",pageModel.getPageSize());

//        map.put("complaintBeginDate",complaintBeginDate);
//        map.put("complaintEndDate",complaintEndDate);
//        System.out.println("1111111111"+complaintBeginDate+"1111111111");
//        System.out.println("1111111111"+complaintEndDate+"1111111111");


        List<CompanyCPLT> select = companyComplaintMapper.select(map);
        pageModel.setTotalCount(companyComplaintMapper.count(map));
        pageModel.setResult(select);
    }

    @Override
    public CompanyCPLT queryById(int id) {
        return companyComplaintMapper.selectById(id);
    }

    @Override
    public void update(CompanyCPLT companyCPLT) {
        companyComplaintMapper.update(companyCPLT);
    }

    @Override
    @Transactional
    public void delete(int[] ids) {
        if(ids!=null){
            for(int id:ids){
                CompanyCPLT companyCPLT = companyComplaintMapper.selectById(id);
                companyCPLT.setDeleteFlag("Y");
                companyComplaintMapper.update(companyCPLT);
            }
        }
    }

    @Override
    public void updateFile(CompanyCPLT companyCPLT) {
        companyComplaintMapper.updateFile(companyCPLT);
    }
}
