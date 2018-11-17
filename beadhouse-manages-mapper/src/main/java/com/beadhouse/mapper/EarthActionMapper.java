package com.beadhouse.mapper;

import com.beadhouse.pojo.EarthAction;
import com.beadhouse.pojo.EarthActionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EarthActionMapper {
    int countByExample(EarthActionExample example);

    int deleteByExample(EarthActionExample example);

    int deleteByPrimaryKey(Long id);

    int insert(EarthAction record);

    int insertSelective(EarthAction record);

    List<EarthAction> selectByExample(EarthActionExample example);
    List<EarthAction> selectByExample2(EarthActionExample example);
    List<String> selectByExample3(EarthActionExample example);
    List<EarthAction> selectByExample4(EarthActionExample example);

    EarthAction selectByPrimaryKey(Long id);
    EarthAction selectByPrimaryKey2(Long id);

    int updateByExampleSelective(@Param("record") EarthAction record, @Param("example") EarthActionExample example);

    int updateByExample(@Param("record") EarthAction record, @Param("example") EarthActionExample example);

    int updateByPrimaryKeySelective(EarthAction record);

    int updateByPrimaryKey(EarthAction record);
}