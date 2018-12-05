package com.beadhouse.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.mapper.BackgroundMapper;
import com.beadhouse.pojo.Background;
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.service.BackgroundService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class BackgroundServiceimpl implements BackgroundService {

	@Autowired
	private BackgroundMapper backgroundMapper;
	
	
	@Override
	public EUDataGridResult getBackgroundlist(Pagenation pagenation) {
		//分页处理
		PageHelper.startPage(pagenation.getCurrentpage(), pagenation.getPageSize());
		List<Background> list=(List<Background>) backgroundMapper.getBackgroundlist();
		 
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Background> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Value("${BACKGROUNDPATH}")
	private String BACKGROUNDPATH;
	@Override
	public void uploadPicture(File uploadFile, Background background) {
		String realpath = BACKGROUNDPATH;
		
		//输出图片路径
		if(uploadFile!=null){
			File savedFile=new File(realpath);
			if(!savedFile.getParentFile().exists()) savedFile.getParentFile().mkdirs();
			if(!savedFile.isDirectory()){
				//不是文件夹,创建即可
				savedFile.mkdirs();
			}
			//System.out.println(imageFileName);
	    	savedFile = new File(new File(realpath),background.getBackground());
			try {
				FileUtils.copyFile(uploadFile, savedFile);
				backgroundMapper.insertbackground(background);
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("上传失败！");
			}	 

     }		
	}
	@Override
	public Background getBackground(Integer id) {
		// TODO Auto-generated method stub
		return backgroundMapper.getBackground(id);
	}
	@Override
	public String getBackgroundpath() {
		
		return BACKGROUNDPATH;
	}
	@Override
	public void deleteImage(Integer id) {
		backgroundMapper.deleteImage(id);
		
	}

}
