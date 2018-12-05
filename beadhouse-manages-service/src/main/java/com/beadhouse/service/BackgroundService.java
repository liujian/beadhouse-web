package com.beadhouse.service;

import java.io.File;
import java.util.List;

import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.pojo.Background;
import com.beadhouse.pojo.Pagenation;


public interface BackgroundService {
	
	public EUDataGridResult getBackgroundlist(Pagenation pagenation);
	
	public void uploadPicture(File uploadFile,Background background);
	
    public Background getBackground(Integer id);
    
    public String getBackgroundpath();
    
    public void deleteImage(Integer id);
}
