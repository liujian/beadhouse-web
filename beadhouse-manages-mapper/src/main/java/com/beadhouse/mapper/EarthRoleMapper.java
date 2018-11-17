package com.beadhouse.mapper;

import com.beadhouse.pojo.EarthRole;
import com.beadhouse.pojo.EarthRoleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EarthRoleMapper {
    int countByExample(EarthRoleExample example);

    int deleteByExample(EarthRoleExample example);

    int deleteByPrimaryKey(Long id);

    int insert(EarthRole record);

    int insertSelective(EarthRole record);

    List<EarthRole> selectByExample(EarthRoleExample example);

    EarthRole selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") EarthRole record, @Param("example") EarthRoleExample example);

    int updateByExample(@Param("record") EarthRole record, @Param("example") EarthRoleExample example);

    int updateByPrimaryKeySelective(EarthRole record);

    int updateByPrimaryKey(EarthRole record);
}