package com.beadhouse.pojo;

import java.io.Serializable;

public class Background implements Serializable{
	
	private static final long serialVersionUID = -9162824339801302149L;
	
	private Integer id;
	
	private String background;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBackground() {
		return background;
	}

	public void setBackground(String background) {
		this.background = background;
	}
	
	
	
}
