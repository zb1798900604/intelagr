package com.oracle.intelagr.service.impl;

import com.oracle.intelagr.common.PageModel;
import com.oracle.intelagr.entity.CompanyCPLT;
import com.oracle.intelagr.entity.ReCallRecord;
import com.oracle.intelagr.mapper.RecallRecordMapper;
import com.oracle.intelagr.service.IRecallRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class RecallRecordService implements IRecallRecordService {
    @Autowired
    private RecallRecordMapper recallRecordMapper;
    @Override
    public void queryForPage(PageModel pageModel) {
        Map map=(Map) pageModel.getData();
        map.put("index",(pageModel.getPage()-1)*pageModel.getPageSize());
        map.put("pageSize",pageModel.getPageSize());
        List<ReCallRecord> select = recallRecordMapper.select(map);
        pageModel.setTotalCount(recallRecordMapper.count(map));
        pageModel.setResult(select);

    }

    @Override
    public void save(ReCallRecord reCallRecord) {
        recallRecordMapper.insert(reCallRecord);
    }
}
