package com.beadhouse.mapper;

import com.beadhouse.pojo.EarthMenu;
import com.beadhouse.pojo.EarthMenuExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EarthMenuMapper {
    int countByExample(EarthMenuExample example);

    int deleteByExample(EarthMenuExample example);
    int deleteByExample2(EarthMenuExample example);
    int deleteByExample3(EarthMenuExample example);
    int deleteByExample4(EarthMenuExample example);

    int deleteByPrimaryKey(Long id);

    int insert(EarthMenu record);

    int insertSelective(EarthMenu record);

    List<EarthMenu> selectByExample(EarthMenuExample example);
    List<EarthMenu> selectByExample2(EarthMenuExample example);
    List<EarthMenu> selectByExample3(EarthMenuExample example);

    EarthMenu selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") EarthMenu record, @Param("example") EarthMenuExample example);

    int updateByExample(@Param("record") EarthMenu record, @Param("example") EarthMenuExample example);

    int updateByPrimaryKeySelective(EarthMenu record);

    int updateByPrimaryKey(EarthMenu record);
}