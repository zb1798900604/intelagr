package com.oracle.intelagr.controller;

import com.oracle.intelagr.common.*;
import com.oracle.intelagr.entity.Function;
import com.oracle.intelagr.entity.Role;
import com.oracle.intelagr.entity.User;
import com.oracle.intelagr.service.IRoleService;
import com.oracle.intelagr.service.IUserService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private IUserService userService;
    @Autowired
    private IRoleService roleService;


    @RequestMapping("logout")
    public String logout(User user,HttpServletRequest request){
       request.getSession().invalidate();
       return "/login";
    }

    @RequestMapping("/login")
    @ResponseBody
    public JsonResult login(@RequestBody User user, HttpServletRequest request){
        //@RequestBody 能将传过来的值转成json
        List<User> login = userService.login(user);
        if(login.size()>0) {
            if("02".equals(login.get(0).getLoginStatus())){
                return new JsonResult(false,"当前用户已被禁用");
            }
            HttpSession session=request.getSession();
            session.setAttribute("user",login.get(0));
            return new JsonResult(true);
        }
        return new JsonResult(false,"用户名密码不正确");

    }

    @RequestMapping("/main")
    public String main(Map map,HttpServletRequest request){
        //角色权限分配
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        List<Map> list = userService.getFunction(user.getUserID());
        map.put("menuList",list);

        return "/main";
    }

    //查询所有用户
    @RequestMapping("/list")
    public String list(Map map, User user,PageModel pageModel ){//@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "10")int pageSize
//        PageModel pageModel=new PageModel();
//        pageModel.setPage(page);
//        pageModel.setPageSize(pageSize);
        Map<String,Object> m=new HashMap<String, Object>();
        m.put("userID",user.getUserID());
        m.put("userName",user.getUserName());
        m.put("userType",user.getUserType());

        pageModel.setData(m);
        userService.queryForPage(pageModel);
        pageModel.setData(user);
        map.put("pageModel",pageModel);
        return "/user/userList";
    }

/*    //删除单个
    @RequestMapping("/delete")
    @ResponseBody
    public JsonResult delete(@RequestBody User user){
        userService.delete(user.getUserID());
        return new JsonResult(true);
    }*/
    //删除多个list
    @RequestMapping("/delete")
    @ResponseBody
    public JsonResult delete(@RequestBody List<String> ids){
        String[] userIds=new String[ids.size()];
        ids.toArray(userIds);
        userService.delete(userIds);
        return new JsonResult(true);
    }
/*        @RequestMapping("/delete")
        @ResponseBody
        public JsonResult delete(@RequestBody String[] ids){
            userService.delete(ids);
            return new JsonResult(true);
        }*/

    @RequestMapping("/add")
    public String add(Map map){
        //查询所有的角色，
        List<Role> roles = roleService.selectAll();
        //拼成json字符串[{roleCode:,roleName:}]
        JSONArray jsonArray=new JSONArray();//数组json
        for(Role role: roles){
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("roleCode",role.getRoleCode());
            jsonObject.put("roleName",role.getRoleName());
            jsonArray.add(jsonObject);
        }
        //把json字符串传到页面上
        String str=jsonArray.toString();
        map.put("roleList",str);
        return "/user/addUser";
    }

    @RequestMapping("save")
    @ResponseBody
    public JsonResult save(User user,String role,HttpServletRequest request){
        if(role!=null){
            String[] roles=role.split(",");
            List<Role> list=new ArrayList<Role>();
            for(String str:roles){
                Role r=new Role();
                r.setRoleCode(str);
                list.add(r);
            }
            user.setRoles(list);
            //创建人，时间，修改人，修改时间
            BaseModel baseModel = CommonUtil.getBaseModel(request);
            user.setCreateDate(baseModel.getCreateDate());
            user.setCreateUserId(baseModel.getCreateUserId());
            user.setUpdateDate(baseModel.getUpdateDate());
            user.setUpdateUserId(baseModel.getUpdateUserId());
            userService.save(user);
        }
        return new JsonResult(true);
    }


    @RequestMapping("/edit")
    public String edit(String userID,Map map){
        User user = userService.selectById(userID);
        map.put("user",user);
        return "/user/basicInfoEdit";
    }
    @RequestMapping("/update")
    @ResponseBody
    public JsonResult update(User user,HttpServletRequest request){
        BaseModel baseModel = CommonUtil.getBaseModel(request);
        user.setUpdateDate(baseModel.getUpdateDate());
        user.setUpdateUserId(baseModel.getUpdateUserId());
        userService.update(user);

        return new JsonResult(true);
    }

    @RequestMapping("/detail")
    public String detail(String userID,Map map ){
        User user = userService.selectById(userID);
        map.put("user",user);
        return "/user/detail";
    }

    @RequestMapping("/resetPwdInit")
    public String resetPwdInit(String userID,Map map){

        User user=userService.selectById(userID);
        map.put("user",user);
        return "/user/editPass";
    }
    @RequestMapping("/resetPwd")
    @ResponseBody
    public JsonResult resetPwd(User user,HttpServletRequest request){
        User u=userService.selectById(user.getUserID());
        u.setPassword(MD5Util.getMD5Code(user.getPassword()));
        BaseModel baseModel = CommonUtil.getBaseModel(request);
        user.setUpdateDate(baseModel.getUpdateDate());
        user.setUpdateUserId(baseModel.getUpdateUserId());
        userService.update(u);
        return new JsonResult(true);
    }



    @RequestMapping("/startUse")
    @ResponseBody
    public JsonResult startUse(String userID,HttpServletRequest request){
        User user=userService.selectById(userID);
        if("01".equals(user.getLoginStatus())){
            return new JsonResult(false,"用户已经启用");
        }
        user.setLoginStatus("01");
        BaseModel baseModel = CommonUtil.getBaseModel(request);
        user.setUpdateDate(baseModel.getUpdateDate());
        user.setUpdateUserId(baseModel.getUpdateUserId());
        userService.update(user);
        return new JsonResult(true);
    }

    @RequestMapping("/endUse")
    @ResponseBody
    public JsonResult endUse(String userID,HttpServletRequest request){
        User user=userService.selectById(userID);
        if("02".equals(user.getLoginStatus())){
            return new JsonResult(false,"用户已被禁用");
        }
        user.setLoginStatus("02");
        BaseModel baseModel = CommonUtil.getBaseModel(request);
        user.setUpdateDate(baseModel.getUpdateDate());
        user.setUpdateUserId(baseModel.getUpdateUserId());
        userService.update(user);
        return new JsonResult(true);
    }





}
