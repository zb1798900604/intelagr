package com.oracle.intelagr.controller;

import com.oracle.intelagr.common.BaseModel;
import com.oracle.intelagr.common.CommonUtil;
import com.oracle.intelagr.common.JsonResult;
import com.oracle.intelagr.common.PageModel;
import com.oracle.intelagr.entity.*;
import com.oracle.intelagr.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/companyCPLT")
public class CompanyCPLTController {
    @Autowired
    private ICompanyCPLTService companyComplaintService;
    @Autowired
    private ICompanyService companyService;
    @Autowired
    private IRecallRecordService recallRecordService;
    @Autowired
    private IProductService productService;
    @Autowired
    private IBlackListService blackListService;
    @Autowired
    private IBlackListDService blackListDService;
    @Autowired
    private IFileManagerService fileManagerService;

    @RequestMapping("/editInput")
    private String editInput(){
        return "/companycplt/companyCPLTEdit";
    }
    @RequestMapping("/save")
    @ResponseBody
    public JsonResult save(@RequestBody CompanyCPLT companyCPLT, HttpServletRequest request){

        if(!companyCPLT.equals(" ")) {
            BaseModel baseModel = CommonUtil.getBaseModel(request);
            companyCPLT.setCreateUserId(baseModel.getCreateUserId());
            companyCPLT.setCreateDate(baseModel.getCreateDate());
            companyCPLT.setUpdateDate(baseModel.getUpdateDate());
            companyCPLT.setUpdateUserId(baseModel.getUpdateUserId());
            companyComplaintService.save(companyCPLT);
            return new JsonResult(true);
        }else {
            return new JsonResult(false,"不能为空");
        }
    }
    @RequestMapping("/list")
    public String list(Map map , PageModel pageModel, CompanyCPLT companyCPLT , String complaintBeginDate,String complaintEndDate,String settleBeginDate,String settleEndDate){
        Map<String,Object> m=new HashMap<String, Object>();
        //按投诉日期查询
        m.put("complaintBeginDate",complaintBeginDate);
        //System.out.println(complaintBeginDate);
        m.put("complaintEndDate",complaintEndDate);
        //System.out.println(complaintEndDate);

        //按处理日期查询
        m.put("settleBeginDate",settleBeginDate);
        m.put("settleEndDate",settleEndDate);

        m.put("settleStatus",companyCPLT.getSettleStatus());

        pageModel.setData(m);
        companyComplaintService.queryForPage(pageModel);
        pageModel.setData(companyCPLT);


        map.put("pageModel",pageModel);

        return "/companycplt/companyCPLTList";
    }

    @RequestMapping("/viewInfo")
    public String viewInfo(int id,Map map ){
        CompanyCPLT companyCPLT = companyComplaintService.queryById(id);
        map.put("companyCPLT",companyCPLT);
        return "/companycplt/companyCPLTViewInfo";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public JsonResult delete(@RequestBody String[] ids){

        int[] id=new int[ids.length];
        for(int i=0;i<id.length;i++){
            id[i]=Integer.parseInt(ids[i]);
        }


        CompanyCPLT companyCPLT ;
        for(int i:id){
            companyCPLT = companyComplaintService.queryById(i);
            if(companyCPLT.getSettleStatus().equals("01")) {
                companyComplaintService.delete(id);
                JsonResult jsonResult = new JsonResult(true);
                jsonResult.setData(companyCPLT);
                return jsonResult;
            }
        }

        return new JsonResult(false,"已处理，不能删除！");


    }

    @RequestMapping("/settleValidate")
    @ResponseBody
    public JsonResult settleValidate(int id){
        CompanyCPLT companyCPLT = companyComplaintService.queryById(id);
        if(companyCPLT.getSettleStatus().equals("01")){
            JsonResult jsonResult=new JsonResult(true);
            jsonResult.setData(companyCPLT);
            return jsonResult;
        }
        return new JsonResult(false,"已处理");
    }

    @RequestMapping("/settleInput")
    public String settleInput(int id,Map map){
        CompanyCPLT companyCPLT = companyComplaintService.queryById(id);
        List<Product> products = productService.select();
//        for (Product p :products){
//            System.out.println(p.getProductCode());
//            System.out.println(p.getProductName());
//        }
        map.put("products",products);
        map.put("companyCPLT",companyCPLT);
        return "/companycplt/settleEdit";
    }


    @RequestMapping("/saveSettle")
    @ResponseBody
    public JsonResult saveSettle(@RequestBody CompanyCPLT companyCPLT,HttpServletRequest request){  //, String batchNo, String productCode, String recallReason

        if(companyCPLT.getReCallRecord().getProductCode()== null) {
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String settleDate = dateFormat.format(now);
            Calendar c = Calendar.getInstance();
            Date date = null;
            try {
                date = dateFormat.parse(settleDate);//初始日期
            } catch (ParseException e) {
                e.printStackTrace();
            }

            if (companyCPLT.getBlackListTimeLimit().equals("06")) {
                c.setTime(date);//设置日历时间
                c.add(Calendar.MONTH, 3);
                companyCPLT.setBlackListEndDate(c.getTime());
            } else if (companyCPLT.getBlackListTimeLimit().equals("05")) {
                c.setTime(date);//设置日历时间
                c.add(Calendar.MONTH, 6);
                companyCPLT.setBlackListEndDate(c.getTime());
            } else if (companyCPLT.getBlackListTimeLimit().equals("04")) {
                c.setTime(date);//设置日历时间
                c.add(Calendar.YEAR, 1);
                companyCPLT.setBlackListEndDate(c.getTime());
            } else if (companyCPLT.getBlackListTimeLimit().equals("03")) {
                c.setTime(date);//设置日历时间
                c.add(Calendar.YEAR, 3);
                companyCPLT.setBlackListEndDate(c.getTime());
            } else if (companyCPLT.getBlackListTimeLimit().equals("02")) {
                c.setTime(date);//设置日历时间
                c.add(Calendar.YEAR, 5);
                companyCPLT.setBlackListEndDate(c.getTime());
            } else if (companyCPLT.getBlackListTimeLimit().equals("01")) {
                c.setTime(date);//设置日历时间
                c.add(Calendar.YEAR, 100);
                companyCPLT.setBlackListEndDate(c.getTime());
            }

        }else {

            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String settleDate = dateFormat.format(now);
            Calendar c = Calendar.getInstance();
            Date date = null;
            try {
                date = dateFormat.parse(settleDate);//初始日期
            } catch (ParseException e) {
                e.printStackTrace();
            }
            if (companyCPLT.getBlackListTimeLimit().equals("06")) {
                c.setTime(date);//设置日历时间
                c.add(Calendar.MONTH, 3);
                companyCPLT.setBlackListEndDate(c.getTime());
            } else if (companyCPLT.getBlackListTimeLimit().equals("05")) {
                c.setTime(date);//设置日历时间
                c.add(Calendar.MONTH, 6);
                companyCPLT.setBlackListEndDate(c.getTime());
            } else if (companyCPLT.getBlackListTimeLimit().equals("04")) {
                c.setTime(date);//设置日历时间
                c.add(Calendar.YEAR, 1);
                companyCPLT.setBlackListEndDate(c.getTime());
            } else if (companyCPLT.getBlackListTimeLimit().equals("03")) {
                c.setTime(date);//设置日历时间
                c.add(Calendar.YEAR, 3);
                companyCPLT.setBlackListEndDate(c.getTime());
            } else if (companyCPLT.getBlackListTimeLimit().equals("02")) {
                c.setTime(date);//设置日历时间
                c.add(Calendar.YEAR, 5);
                companyCPLT.setBlackListEndDate(c.getTime());
            } else if (companyCPLT.getBlackListTimeLimit().equals("01")) {
                c.setTime(date);//设置日历时间
                c.add(Calendar.YEAR, 100);
                companyCPLT.setBlackListEndDate(c.getTime());
            }
            //添加到黑名单表
            BlackList blackList=new BlackList();
            blackList.setCompanyCode(companyCPLT.getCompanyCode());
            String companyCode=companyCPLT.getCompanyCode();


//
//            BlackList black = blackListService.selectById(companyCode);//查询出公司被拉黑的次数
//
//            if(black==null || "".equals(black) ) {//black.getBlackListCount()==null || black.getBlackListCount().equals(" ") || black.getBlackListCount()==0
//                blackList.setBlackListCount( 1);//设置拉黑次数为1
//            }else{//(black.getBlackListCount()>0)
//                blackList.setBlackListCount(black.getBlackListCount()+1);
//            }
            List<BlackList> blackLists = blackListService.selectById(companyCode);
            if (blackLists.size()==0) {
                blackList.setBlackListCount(1);
            } else {
                for (BlackList black:blackLists)
                    blackList.setBlackListCount(black.getBlackListCount() + 1);
            }


            blackList.setBlackListEndDate(companyCPLT.getBlackListEndDate());
            blackList.setProcessor(companyCPLT.getProcessor());
            blackList.setSettleDate(companyCPLT.getSettleDate());
            blackList.setBlackListTimeLimit(companyCPLT.getBlackListTimeLimit());
            blackList.setBlackListReason(companyCPLT.getProcessMode());
            blackList.setRemark(companyCPLT.getRemark());
            BaseModel baseModel1 = CommonUtil.getBaseModel(request);
            blackList.setCreateUserId(baseModel1.getCreateUserId());
            blackList.setCreateDate(baseModel1.getCreateDate());
            blackList.setUpdateDate(baseModel1.getUpdateDate());
            blackList.setUpdateUserId(baseModel1.getUpdateUserId());
            blackListService.save(blackList);

            //添加到黑名单名细
            BlackListD blackListD=new BlackListD();
            blackListD.setCompanyCode(companyCPLT.getCompanyCode());
            blackListD.setProcessor(companyCPLT.getProcessor());
            blackListD.setSettleDate(companyCPLT.getSettleDate());
            blackListD.setBlackListTimeLimit(companyCPLT.getBlackListTimeLimit());
            blackListD.setBlackListEndDate(companyCPLT.getBlackListEndDate());

            blackListD.setBlackListReason(companyCPLT.getProcessResult()); //processResult


            blackListD.setRemark(companyCPLT.getRemark());
            BaseModel baseModel2 = CommonUtil.getBaseModel(request);
            blackListD.setCreateUserId(baseModel2.getCreateUserId());
            blackListD.setCreateDate(baseModel2.getCreateDate());
            blackListD.setUpdateDate(baseModel2.getUpdateDate());
            blackListD.setUpdateUserId(baseModel2.getUpdateUserId());
            blackListDService.save(blackListD);


            //添加到召回表
            ReCallRecord reCallRecord=new ReCallRecord();
            reCallRecord.setCompanyCode(companyCPLT.getCompanyCode());
            reCallRecord.setProcessor(companyCPLT.getProcessor());
            reCallRecord.setSettleDate(companyCPLT.getSettleDate());
            reCallRecord.setBatchNo(companyCPLT.getReCallRecord().getBatchNo());//生产批次
            reCallRecord.setProductCode(companyCPLT.getReCallRecord().getProductCode());//产品编号
            reCallRecord.setRecallReason(companyCPLT.getReCallRecord().getRecallReason());//召回原因
            reCallRecord.setRemark(companyCPLT.getRemark());
            BaseModel baseModel = CommonUtil.getBaseModel(request);
            reCallRecord.setCreateUserId(baseModel.getCreateUserId());
            reCallRecord.setCreateDate(baseModel.getCreateDate());
            reCallRecord.setUpdateDate(baseModel.getUpdateDate());
            reCallRecord.setUpdateUserId(baseModel.getUpdateUserId());
            recallRecordService.save(reCallRecord);

            //文件上传
            HttpSession session = request.getSession();
            companyCPLT.setCreateDate(new Date());
            companyCPLT.setCreateUserId(((User)session.getAttribute("user")).getUserID());
            companyCPLT.setUpdateDate(new Date());
            companyCPLT.setUpdateUserId(((User)session.getAttribute("user")).getUserID());
            companyComplaintService.updateFile(companyCPLT);
            CommonUtil.saveMfile(fileManagerService, "18", String.valueOf(companyCPLT.getId()), request);




        }

        companyCPLT.setSettleStatus("02");
        companyComplaintService.update(companyCPLT);

        return new JsonResult(true);

    }


    @RequestMapping("view")
    private String view(int id,Map map){
        CompanyCPLT companyCPLT = companyComplaintService.queryById(id);
        map.put("companyCPLT",companyCPLT);
        return "/companycplt/companyCPLTView";
    }




}
