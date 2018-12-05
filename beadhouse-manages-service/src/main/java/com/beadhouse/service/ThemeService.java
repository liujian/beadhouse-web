package com.beadhouse.service;

import java.io.File;
import java.util.List;

import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.pojo.CodeColortype;
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.pojo.Theme;

public interface ThemeService {

	public List<CodeColortype> getThemeColorList(); 
	
	public EUDataGridResult getThemeColor(Pagenation pagenation);
	
	public void uploadPicture(File uploadFile,Theme theme);
	
    public Theme getTheme(String logo);
    
    public String getImgpath();

}
