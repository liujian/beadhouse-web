package com.beadhouse.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.mapper.CodeThemeColorMapper;
import com.beadhouse.mapper.ThemeMapper;
import com.beadhouse.pojo.CodeColortype;
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.pojo.Theme;
import com.beadhouse.service.ThemeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ThemeServiceImpl implements ThemeService{
	
	@Autowired 
	private CodeThemeColorMapper codeThemeColorMapper;

	@Autowired
	private ThemeMapper themeMapper;

	@Override
	public List<CodeColortype> getThemeColorList() {
		List<CodeColortype> list=codeThemeColorMapper.getThemeColorList();
		return list;
	}

	@Override
	public EUDataGridResult getThemeColor(Pagenation pagenation) {
		//分页处理
		PageHelper.startPage(pagenation.getCurrentpage(), pagenation.getPageSize());
		List<Theme> list=(List<Theme>) themeMapper.selectTheme();
		 
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Theme> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	@Value("${IMAGEPATH}")
	private String IMAGEPATH;
	@Override
	public void uploadPicture(File uploadFile, Theme theme) {
		String realpath = IMAGEPATH;
		//输出图片路径
		if(uploadFile!=null){
			File savedFile=new File(realpath);
			if(!savedFile.getParentFile().exists()) savedFile.getParentFile().mkdirs();
			if(!savedFile.isDirectory()){
				//不是文件夹,创建即可
				savedFile.mkdirs();
			}
			//System.out.println(imageFileName);
	    	savedFile = new File(new File(realpath),theme.getLogo());
			try {
				FileUtils.copyFile(uploadFile, savedFile);
				themeMapper.updateTheme(theme);
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("上传失败！");
			}	 

     }		
	}

	@Override
	public Theme getTheme(String logo) {
		Theme theme = themeMapper.getTheme(logo);
		return theme;
	}

	@Override
	public String getImgpath() {
		return IMAGEPATH;
	}

}
