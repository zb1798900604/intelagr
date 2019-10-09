package com.oracle.intelagr.controller;

import com.oracle.intelagr.common.PageModel;
import com.oracle.intelagr.entity.Company;
import com.oracle.intelagr.entity.CompanyCPLT;
import com.oracle.intelagr.entity.ReCallRecord;
import com.oracle.intelagr.service.ICompanyService;
import com.oracle.intelagr.service.IRecallRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("recall")
public class RecallRecordController {
    @Autowired
    private IRecallRecordService recallRecordService;
    @Autowired
    private ICompanyService companyService;

    @RequestMapping("list")
    public String list(Map map , PageModel pageModel, ReCallRecord reCallRecord, String beginDate, String endDate){
        Map<String,Object> m=new HashMap<String, Object>();
        m.put("beginDate",beginDate);
        m.put("endDate",endDate);
        m.put("batchNo",reCallRecord.getBatchNo());

        m.put("companyCode",reCallRecord.getCompanyCode());


        pageModel.setData(m);
        recallRecordService.queryForPage(pageModel);
        pageModel.setData(pageModel);

        //获得企业名称
        List<Company> select = companyService.select();

        map.put("pageModel",pageModel);
        map.put("companyList",select);
        return "/recall/recallList";
    }

}
