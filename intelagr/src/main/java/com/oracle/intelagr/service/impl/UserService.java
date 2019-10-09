package com.oracle.intelagr.service.impl;

import com.oracle.intelagr.common.MD5Util;
import com.oracle.intelagr.common.PageModel;
import com.oracle.intelagr.entity.Function;
import com.oracle.intelagr.entity.Role;
import com.oracle.intelagr.entity.User;
import com.oracle.intelagr.entity.UserRole;
import com.oracle.intelagr.mapper.UserMapper;
import com.oracle.intelagr.mapper.UserRoleMapper;
import com.oracle.intelagr.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService implements IUserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;

    //登录
    public List<User> login(User user) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("userID",user.getUserID());
        map.put("password", MD5Util.getMD5Code(user.getPassword()));
        List<User> list = userMapper.select(map);
        return list;
    }


    public List<Map> getFunction(String userID) {
        User user = userMapper.selectById(userID);
        List<Map> list=new ArrayList<Map>();
        Map moduleMap=new HashMap();

        for(Role role:user.getRoles()){
            for (Function function:role.getFunctions()){
                if(function.getModuleCode()!=null){
                    //判断moduleMap中有没有function.getModuleCode()，如果没有
                    if(moduleMap.get(function.getModuleCode())==null){
                        //创建map，把map存到list中
                        Map map=new HashMap();
                        list.add(map);
                        //moduleMap的键是getModuleCode，值是map
                        moduleMap.put(function.getModuleCode(),map);
                        //map的键是一级菜单
                        map.put("parent",function.getModuleName());
                        List<Function> childList=new ArrayList<Function>();
                        childList.add(function);
                        //一级菜单下的所有二级菜单
                        map.put("child",childList);

                    }else{
                        Map map=(Map) moduleMap.get(function.getModuleCode());
                        List<Function> childList=(List<Function>)map.get("child");
                        childList.add(function);
                    }

                }
            }
        }



        return list;
    }
    //查询
    public void queryForPage(PageModel pageModel) {
        Map map=(Map)pageModel.getData();
        //把页数设置到map中
        map.put("index",(pageModel.getPage()-1)*pageModel.getPageSize());
        //页数长度
        map.put("pageSize",pageModel.getPageSize());
        List<User> list = userMapper.select(map);
        pageModel.setTotalCount(userMapper.count(map));
        pageModel.setResult(list);
    }
    //添加
    @Transactional
    public void save(User user) {
        user.setPassword(MD5Util.getMD5Code(user.getUserName()));
        //插入user表
        userMapper.insert(user);
        //插入userRole表
        for(Role role:user.getRoles()){
            //准备userrole用户角色关系表
            UserRole userRole=new UserRole();
            userRole.setRoleCode(role.getRoleCode());
            userRole.setUserID(user.getUserID());

            userRole.setCreateDate(user.getCreateDate());
            userRole.setCreateUserId(user.getCreateUserId());
            userRole.setUpdateDate(user.getUpdateDate());
            userRole.setUpdateUserId(user.getUpdateUserId());
            userRoleMapper.insert(userRole);
        }

    }




    public User selectById(String userID) {
        return userMapper.selectById(userID);

    }

    //修改
    public void update(User user) {
        userMapper.update(user);
    }

    //逻辑删除，调用update方法更改setDeleteFlag
    @Transactional
    public void delete(String userID) {
        User user=userMapper.selectById(userID);
        user.setDeleteFlag("Y");
        userMapper.update(user);
        userRoleMapper.delete(userID);
    }

    @Transactional
    public void delete(String[] userIDs) {
      if(userIDs!=null){
          for(String userID:userIDs){
              User user=userMapper.selectById(userID);
              user.setDeleteFlag("Y");
              userMapper.update(user);
              userRoleMapper.delete(userID);
          }
      }
    }

    public void resetPwd(String userID, String password) {

    }

    public void startUse(String userID) {

    }

    public void endUse(String userID) {

    }
}
