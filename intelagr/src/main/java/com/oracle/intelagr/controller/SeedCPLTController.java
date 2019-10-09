package com.oracle.intelagr.controller;

import com.oracle.intelagr.common.*;
import com.oracle.intelagr.entity.*;
import com.oracle.intelagr.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/seedCPLT")
public class SeedCPLTController {
    @Autowired
    private ISeedCPLTService seedCPLTService;
    @Autowired
    private ICompanyService companyService;

    @Autowired
    private IBlackListService blackListService;
    @Autowired
    private IBlackListDService blackListDService;

    @Autowired
    private IFileManagerService fileManagerService;

    @RequestMapping("/editInput")
    private String editInput() {
        return "/seedcplt/seedCPLTEdit";
    }

    @RequestMapping("/save")
    @ResponseBody
    public JsonResult save(@RequestBody SeedCPLT seedCPLT, HttpServletRequest request) {

        if (!seedCPLT.equals(" ")) {
            BaseModel baseModel = CommonUtil.getBaseModel(request);
            seedCPLT.setCreateUserId(baseModel.getCreateUserId());
            seedCPLT.setCreateDate(baseModel.getCreateDate());
            seedCPLT.setUpdateDate(baseModel.getUpdateDate());
            seedCPLT.setUpdateUserId(baseModel.getUpdateUserId());
            seedCPLTService.save(seedCPLT);
            return new JsonResult(true);
        } else {
            return new JsonResult(false, "不能为空");
        }
    }

    @RequestMapping("/list")
    public String list(Map map, PageModel pageModel, SeedCPLT seedCPLT, String complaintBeginDate, String complaintEndDate, String settleBeginDate, String settleEndDate) {
        Map<String, Object> m = new HashMap<String, Object>();
        //按投诉日期查询
        m.put("complaintBeginDate", complaintBeginDate);
        //System.out.println(complaintBeginDate);
        m.put("complaintEndDate", complaintEndDate);
        //System.out.println(complaintEndDate);

        //按处理日期查询
        m.put("settleBeginDate", settleBeginDate);
        m.put("settleEndDate", settleEndDate);

        m.put("settleStatus", seedCPLT.getSettleStatus());

        m.put("companyCode", seedCPLT.getCompanyCode());
        pageModel.setData(m);
        seedCPLTService.queryForPage(pageModel);
        pageModel.setData(seedCPLT);

        //获得企业名称
        List<Company> select = companyService.select();

        map.put("pageModel", pageModel);
        map.put("companyList", select);
        return "/seedcplt/seedCPLTList";
    }

    @RequestMapping("/viewInfo")
    public String viewInfo(int id, Map map) {
        SeedCPLT seedCPLT = seedCPLTService.queryById(id);
        //System.out.println(seedCPLT.getComplaintContent());
//        String bozCode=String.valueOf(id);
//        List<Mfile> fileList = fileManagerService.getFileList("19", bozCode);
//        map.put("fileList",fileList);
        map.put("seedCPLT", seedCPLT);
        return "/seedcplt/seedCPLTViewInfo";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public JsonResult delete(@RequestBody String[] ids) {
        int[] id = new int[ids.length];
        for (int i = 0; i < id.length; i++) {
            id[i] = Integer.parseInt(ids[i]);
        }
        SeedCPLT seedCPLT;
        for (int i : id) {
            seedCPLT = seedCPLTService.queryById(i);
            if (seedCPLT.getSettleStatus().equals("01")) {
                seedCPLTService.delete(id);
                JsonResult jsonResult = new JsonResult(true);
                jsonResult.setData(seedCPLT);
                return jsonResult;
            }
        }
        return new JsonResult(false, "已处理，不能删除！");
    }

    @RequestMapping("/settleValidate")
    @ResponseBody
    public JsonResult settleValidate(int id) {
        SeedCPLT seedCPLT = seedCPLTService.queryById(id);
        if (seedCPLT.getSettleStatus().equals("01")) {
            JsonResult jsonResult = new JsonResult(true);
            jsonResult.setData(seedCPLT);
            return jsonResult;
        }
        return new JsonResult(false, "已处理");
    }

    @RequestMapping("/settleInput")
    public String settleInput(int id, Map map) {
        SeedCPLT seedCPLT = seedCPLTService.queryById(id);

        map.put("seedCPLT", seedCPLT);
        return "/seedcplt/settleEdit";
    }


    @RequestMapping("/saveSettle")
    @ResponseBody
    public JsonResult saveSettle(@RequestBody SeedCPLT seedCPLT, HttpServletRequest request) {

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
        if (seedCPLT.getBlackListTimeLimit().equals("06")) {
            c.setTime(date);//设置日历时间
            c.add(Calendar.MONTH, 3);
            seedCPLT.setBlackListEndDate(c.getTime());
        } else if (seedCPLT.getBlackListTimeLimit().equals("05")) {
            c.setTime(date);//设置日历时间
            c.add(Calendar.MONTH, 6);
            seedCPLT.setBlackListEndDate(c.getTime());
        } else if (seedCPLT.getBlackListTimeLimit().equals("04")) {
            c.setTime(date);//设置日历时间
            c.add(Calendar.YEAR, 1);
            seedCPLT.setBlackListEndDate(c.getTime());
        } else if (seedCPLT.getBlackListTimeLimit().equals("03")) {
            c.setTime(date);//设置日历时间
            c.add(Calendar.YEAR, 3);
            seedCPLT.setBlackListEndDate(c.getTime());
        } else if (seedCPLT.getBlackListTimeLimit().equals("02")) {
            c.setTime(date);//设置日历时间
            c.add(Calendar.YEAR, 5);
            seedCPLT.setBlackListEndDate(c.getTime());
        } else if (seedCPLT.getBlackListTimeLimit().equals("01")) {
            c.setTime(date);//设置日历时间
            c.add(Calendar.YEAR, 100);
            seedCPLT.setBlackListEndDate(c.getTime());
        }
        //添加到黑名单表
        BlackList blackList = new BlackList();
        blackList.setCompanyCode(seedCPLT.getCompanyCode());

        String companyCode = seedCPLT.getCompanyCode();

        List<BlackList> blackLists = blackListService.selectById(companyCode);
        if (blackLists.size()==0) {
            blackList.setBlackListCount(1);
        } else {
            for (BlackList black:blackLists)
            blackList.setBlackListCount(black.getBlackListCount() + 1);
        }

        blackList.setBlackListEndDate(seedCPLT.getBlackListEndDate());
        blackList.setProcessor(seedCPLT.getProcessor());
        blackList.setSettleDate(seedCPLT.getSettleDate());
        blackList.setBlackListTimeLimit(seedCPLT.getBlackListTimeLimit());
        blackList.setBlackListReason(seedCPLT.getComplaintContent());
        blackList.setRemark(seedCPLT.getRemark());
        BaseModel baseModel1 = CommonUtil.getBaseModel(request);
        blackList.setCreateUserId(baseModel1.getCreateUserId());
        blackList.setCreateDate(baseModel1.getCreateDate());
        blackList.setUpdateDate(baseModel1.getUpdateDate());
        blackList.setUpdateUserId(baseModel1.getUpdateUserId());
        blackListService.save(blackList);
        //添加到黑名单名细
        BlackListD blackListD = new BlackListD();
        blackListD.setCompanyCode(seedCPLT.getCompanyCode());
        blackListD.setProcessor(seedCPLT.getProcessor());
        blackListD.setSettleDate(seedCPLT.getSettleDate());
        blackListD.setBlackListTimeLimit(seedCPLT.getBlackListTimeLimit());
        blackListD.setBlackListEndDate(seedCPLT.getBlackListEndDate());
        blackListD.setBlackListReason(seedCPLT.getComplaintContent());
        blackListD.setRemark(seedCPLT.getRemark());
        BaseModel baseModel2 = CommonUtil.getBaseModel(request);
        blackListD.setCreateUserId(baseModel2.getCreateUserId());
        blackListD.setCreateDate(baseModel2.getCreateDate());
        blackListD.setUpdateDate(baseModel2.getUpdateDate());
        blackListD.setUpdateUserId(baseModel2.getUpdateUserId());
        blackListDService.save(blackListD);
        seedCPLT.setSettleStatus("02");
        seedCPLTService.update(seedCPLT);

        //文件上传
        HttpSession session = request.getSession();
        seedCPLT.setCreateDate(new Date());
        seedCPLT.setCreateUserId(((User)session.getAttribute("user")).getUserID());
        seedCPLT.setUpdateDate(new Date());
        seedCPLT.setUpdateUserId(((User)session.getAttribute("user")).getUserID());
        seedCPLTService.updateFile(seedCPLT);
        CommonUtil.saveMfile(fileManagerService, "19", String.valueOf(seedCPLT.getId()), request);



        return new JsonResult(true);
    }
    @RequestMapping("view")
    private String view(int id,Map map){
        SeedCPLT seedCPLT = seedCPLTService.queryById(id);
        map.put("seedCPLT",seedCPLT);
//        String bozCode=String.valueOf(id);
//        List<Mfile> fileList = fileManagerService.getFileList("19", bozCode);
//        map.put("fileList",fileList);
        return "/seedcplt/seedCPLTView";
    }















}
