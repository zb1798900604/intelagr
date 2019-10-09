package com.oracle.intelagr.controller;

import com.oracle.intelagr.common.*;
import com.oracle.intelagr.entity.*;
import com.oracle.intelagr.service.IFunctionService;
import com.oracle.intelagr.service.IRoleFunctionService;
import com.oracle.intelagr.service.IRoleService;
import com.oracle.intelagr.service.IUserService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.rmi.MarshalledObject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private IRoleService roleService;
    @Autowired
    private IFunctionService functionService;
    @Autowired
    private IRoleFunctionService roleFunctionService;

    //查询所有用户
    @RequestMapping("/list")
    public String list(Map map, Role role,PageModel pageModel ){

        Map<String,Object> m=new HashMap<String, Object>();
        m.put("roleCode",role.getRoleCode());
        m.put("roleName",role.getRoleName());
        pageModel.setData(m);
        roleService.queryForPage(pageModel);
        pageModel.setData(role);

        map.put("pageModel",pageModel);
        return "/role/roleList";
    }

     @RequestMapping("/delete")
     @ResponseBody
     public JsonResult delete(@RequestBody String[] ids){
        int[] roleIds=new int[ids.length];
        for(int i=0;i<roleIds.length;i++){
            roleIds[i]=Integer.parseInt(ids[i]);
         }
        roleService.delete(roleIds);
        return new JsonResult(true);
    }

    @RequestMapping("/add")
    public String add(){
       return "/role/addRole";
    }

    @RequestMapping("/save")
    @ResponseBody
    public JsonResult save(Role role,HttpServletRequest request){
        BaseModel baseModel = CommonUtil.getBaseModel(request);
        role.setCreateDate(baseModel.getCreateDate());
        role.setCreateUserId(baseModel.getCreateUserId());
        role.setUpdateDate(baseModel.getUpdateDate());
        role.setUpdateUserId(baseModel.getUpdateUserId());
        roleService.save(role);
        return new JsonResult(true);
    }

    @RequestMapping("/edit")
    public String edit(String  id,Map map){
        Role role = roleService.queryById(Integer.parseInt(id));
        map.put("role",role);
        return "/role/editRole";
    }
    @RequestMapping("/update")
    @ResponseBody
    public JsonResult update(Role role,HttpServletRequest request){
        BaseModel baseModel = CommonUtil.getBaseModel(request);
        role.setUpdateDate(baseModel.getUpdateDate());
        role.setUpdateUserId(baseModel.getUpdateUserId());
        roleService.update(role);

        return new JsonResult(true);
    }

    @RequestMapping("/roleAuth")
    public String roleAuth(int id, Map m){
        Role role = roleService.queryById(id);
        m.put("role",role);
        //找出拥有的权限
        Map map1=new HashMap();
        map1.put("roleCode",role.getRoleCode());
        List<RoleFunction> query = roleFunctionService.query(map1);

        //找出所有的权限
        List<Function> functionList = functionService.selectAll();
        List<Map> list=new ArrayList<Map>();
        Map moduleMap=new HashMap();
        for(Function function:functionList){
            if(function.getModuleCode()!=null){
                if(moduleMap.get(function.getModuleCode())==null){
                    Map map=new HashMap();
                    list.add(map);
                    moduleMap.put(function.getModuleCode(),map);
                    map.put("parent",function);
                    List<Function> childList=new ArrayList<Function>();
                    childList.add(function);
                    map.put("child",childList);

                }else{
                    Map map=(Map) moduleMap.get(function.getModuleCode());
                    List<Function> childList=(List<Function>)map.get("child");
                    childList.add(function);
                }
            }
            JSONArray array=new JSONArray();
            for(Map map : list){
                //一级菜单的json
                TreeModel tm=new TreeModel();
                Function function1=(Function) map.get("parent");
                tm.setId(String.valueOf(function.getModuleCode()));
                tm.setText(function1.getModuleName());
                List<Function> chilrend=(List<Function>)map.get("child");
                for(Function fun:chilrend){
                    //一级菜单中的子菜单
                    TreeModel treeModel=new TreeModel();
                    treeModel.setId(String.valueOf(fun.getFunctionCode()));
                    treeModel.setText(fun.getFunctionName());
                    for(RoleFunction roleFunction:query){
                        if(roleFunction.getFunctionCode().equals(fun.getFunctionCode())){
                            treeModel.setChecked("true");
                            break;
                        }
                    }
                    tm.getChildren().add(treeModel);
                }
                array.add(tm);
            }
            m.put("jsonData",array.toString());
        }

        return "/role/roleAuth";
    }

    @RequestMapping("saveRoleAuth")
    @ResponseBody
    public JsonResult saveRoleAuth(String roleCode,HttpServletRequest request){
        String[] funIds=request.getParameterValues("funIds[]");

        User user =(User) request.getSession().getAttribute("user");
        roleService.saveRoleAuth(roleCode,funIds,user);
        return new JsonResult(true);
    }



}
