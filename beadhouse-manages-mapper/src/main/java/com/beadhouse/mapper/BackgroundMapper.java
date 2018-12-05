package com.beadhouse.mapper;

import java.util.List;

import com.beadhouse.pojo.Background;

public interface BackgroundMapper {

	List<Background> getBackgroundlist();
	
	Background getBackground(Integer id);
	
	void insertbackground(Background background);
	
	void deleteImage(Integer id);
	

}
