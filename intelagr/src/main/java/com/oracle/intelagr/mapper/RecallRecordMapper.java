package com.oracle.intelagr.mapper;

import com.oracle.intelagr.entity.ReCallRecord;

import java.util.List;
import java.util.Map;

public interface RecallRecordMapper {

    public int count(Map<String, Object> map);
    public List<ReCallRecord> select(Map<String, Object> map);
    public void insert(ReCallRecord reCallRecord);

}
