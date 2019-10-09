package com.oracle.intelagr.service.impl;

import com.oracle.intelagr.common.PageModel;
import com.oracle.intelagr.entity.CompanyCPLT;
import com.oracle.intelagr.entity.ReCallRecord;
import com.oracle.intelagr.entity.SeedCPLT;
import com.oracle.intelagr.mapper.CompanyCPLTMapper;
import com.oracle.intelagr.mapper.SeedCPLTMapper;
import com.oracle.intelagr.service.ICompanyCPLTService;
import com.oracle.intelagr.service.ISeedCPLTService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class SeedCPLTService implements ISeedCPLTService {
    @Autowired
    private SeedCPLTMapper seedCPLTMapper;


    @Override
    public void save(SeedCPLT seedCPLT) {
        seedCPLTMapper.insert(seedCPLT);
    }

    @Override
    public List<SeedCPLT> selectAll() {
        return null;
    }

    @Override
    public void queryForPage(PageModel pageModel) {
        Map map=(Map)pageModel.getData();
        map.put("index",(pageModel.getPage()-1)*pageModel.getPageSize());
        map.put("pageSize",pageModel.getPageSize());
        List<SeedCPLT> seedCPL = seedCPLTMapper.select(map);
        pageModel.setTotalCount( seedCPLTMapper.count(map));
        pageModel.setResult(seedCPL);

    }

    @Override
    public SeedCPLT queryById(int id) {
        return seedCPLTMapper.selectById(id);
    }

    @Override
    public void update(SeedCPLT seedCPLT) {
        seedCPLTMapper.update(seedCPLT);
    }

    @Override
    public void delete(int[] ids) {
        if(ids!=null){
            for(int id : ids){
                SeedCPLT seedCPLT = seedCPLTMapper.selectById(id);
                seedCPLT.setDeleteFlag("Y");
                seedCPLTMapper.update(seedCPLT);
            }
        }

    }

    @Override
    public void updateFile(SeedCPLT seedCPLT) {
        seedCPLTMapper.updateFile(seedCPLT);
    }
}
