package com.oracle.intelagr.service;

import com.oracle.intelagr.common.PageModel;
import com.oracle.intelagr.entity.CompanyCPLT;
import com.oracle.intelagr.entity.ReCallRecord;

import java.util.List;

public interface IRecallRecordService {

    public void queryForPage(PageModel pageModel);
    public void save(ReCallRecord reCallRecord);
}
