package com.oracle.intelagr.service.impl;

import com.oracle.intelagr.common.PageModel;
import com.oracle.intelagr.entity.Function;
import com.oracle.intelagr.entity.Role;
import com.oracle.intelagr.entity.RoleFunction;
import com.oracle.intelagr.entity.User;
import com.oracle.intelagr.mapper.RoleFunctionMapper;
import com.oracle.intelagr.mapper.RoleMapper;
import com.oracle.intelagr.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RoleService implements IRoleService {
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private RoleFunctionMapper roleFunctionMapper;

    //查询所有角色
    public List<Role> selectAll() {
        return roleMapper.selectAll();
    }

    public void queryForPage(PageModel pageModel) {
        Map map=(Map) pageModel.getData();
        map.put("index",(pageModel.getPage()-1)*pageModel.getPageSize());
        map.put("pageSize",pageModel.getPageSize());
        List<Role> list = roleMapper.select(map);
        pageModel.setTotalCount(roleMapper.count(map));
        pageModel.setResult(list);

    }

    public Role queryById(int id) {
        return roleMapper.selectById(id);
    }

    @Transactional
    public void delete(int[] ids) {
        for(int r:ids){
            Role role=roleMapper.selectById(r);
            role.setDeleteFlag("Y");
            roleMapper.update(role);
            roleFunctionMapper.deleteRoleCode(role.getRoleCode());
        }

    }

    public void update(Role role) {
        Role r=roleMapper.selectById(role.getId());
        r.setRoleCode(role.getRoleCode());
        r.setRoleName(role.getRoleName());
        r.setRemark(role.getRemark());
        roleMapper.update(r);
    }

    public void save(Role role) {
        roleMapper.insert(role);
    }

    @Transactional
    public void saveRoleAuth(String roleCode, String[] funIds, User user) {
        roleFunctionMapper.deleteRoleCode(roleCode);
        for(String funCode:funIds){
            RoleFunction roleFunction=new RoleFunction();
            roleFunction.setRoleCode(roleCode);
            roleFunction.setFunctionCode(funCode);
            roleFunction.setCreateDate(new Date());
            roleFunction.setCreateUserId(user.getUserID());
            roleFunction.setUpdateDate(new Date());
            roleFunction.setUpdateUserId(user.getUserID());
            roleFunctionMapper.insert(roleFunction);
        }

    }
}
