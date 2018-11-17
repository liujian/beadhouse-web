package com.beadhouse.mapper;

import com.beadhouse.pojo.EarthRoleOperator;
import com.beadhouse.pojo.EarthRoleOperatorExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EarthRoleOperatorMapper {
    int countByExample(EarthRoleOperatorExample example);

    int deleteByExample(EarthRoleOperatorExample example);

    int deleteByPrimaryKey(Long id);

    int insert(EarthRoleOperator record);

    int insertSelective(EarthRoleOperator record);

    List<EarthRoleOperator> selectByExample(EarthRoleOperatorExample example);

    EarthRoleOperator selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") EarthRoleOperator record, @Param("example") EarthRoleOperatorExample example);

    int updateByExample(@Param("record") EarthRoleOperator record, @Param("example") EarthRoleOperatorExample example);

    int updateByPrimaryKeySelective(EarthRoleOperator record);

    int updateByPrimaryKey(EarthRoleOperator record);
}