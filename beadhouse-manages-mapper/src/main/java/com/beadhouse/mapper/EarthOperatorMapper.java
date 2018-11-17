package com.beadhouse.mapper;

import com.beadhouse.pojo.EarthOperator;
import com.beadhouse.pojo.EarthOperatorExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EarthOperatorMapper {
    int countByExample(EarthOperatorExample example);

    int deleteByExample(EarthOperatorExample example);

    int deleteByPrimaryKey(Long id);

    int insert(EarthOperator record);

    int insertSelective(EarthOperator record);

    List<EarthOperator> selectByExample(EarthOperatorExample example);
    List<EarthOperator> selectByExample2(EarthOperatorExample example);

    EarthOperator selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") EarthOperator record, @Param("example") EarthOperatorExample example);

    int updateByExample(@Param("record") EarthOperator record, @Param("example") EarthOperatorExample example);

    int updateByPrimaryKeySelective(EarthOperator record);

    int updateByPrimaryKey(EarthOperator record);
}