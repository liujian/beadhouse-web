package com.beadhouse.util;

import java.io.Serializable;

/**
 * 返回对象
 * @author admin
 *
 */
public class ResultMap implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int state;
	
	private String message;
	
	private Object data;

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	
	
	
}
