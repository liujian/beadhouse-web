package com.beadhouse.mapper;

import java.util.List;

import com.beadhouse.pojo.Theme;

public interface ThemeMapper {

	List<Theme> selectTheme();
	
	void updateTheme(Theme theme);
	
	Theme getTheme(String logo);
	
}
