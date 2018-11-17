package com.beadhouse.mapper;

import com.beadhouse.pojo.EarthRoleAction;
import com.beadhouse.pojo.EarthRoleActionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EarthRoleActionMapper {
    int countByExample(EarthRoleActionExample example);

    int deleteByExample(EarthRoleActionExample example);

    int deleteByPrimaryKey(Long id);

    int insert(EarthRoleAction record);

    int insertSelective(EarthRoleAction record);

    List<EarthRoleAction> selectByExample(EarthRoleActionExample example);

    EarthRoleAction selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") EarthRoleAction record, @Param("example") EarthRoleActionExample example);

    int updateByExample(@Param("record") EarthRoleAction record, @Param("example") EarthRoleActionExample example);

    int updateByPrimaryKeySelective(EarthRoleAction record);

    int updateByPrimaryKey(EarthRoleAction record);
}