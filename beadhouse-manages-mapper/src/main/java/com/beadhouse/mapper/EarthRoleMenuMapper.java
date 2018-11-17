package com.beadhouse.mapper;

import com.beadhouse.pojo.EarthRoleMenu;
import com.beadhouse.pojo.EarthRoleMenuExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EarthRoleMenuMapper {
    int countByExample(EarthRoleMenuExample example);

    int deleteByExample(EarthRoleMenuExample example);

    int deleteByPrimaryKey(Long id);

    int insert(EarthRoleMenu record);

    int insertSelective(EarthRoleMenu record);

    List<EarthRoleMenu> selectByExample(EarthRoleMenuExample example);

    EarthRoleMenu selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") EarthRoleMenu record, @Param("example") EarthRoleMenuExample example);

    int updateByExample(@Param("record") EarthRoleMenu record, @Param("example") EarthRoleMenuExample example);

    int updateByPrimaryKeySelective(EarthRoleMenu record);

    int updateByPrimaryKey(EarthRoleMenu record);
}