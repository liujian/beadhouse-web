 package com.beadhouse.pojo;

import java.util.Date;

public class Pagenation {
 
    private int rowCount=0;  
   
    private int pageCount=0;  
  
    private int currentpage=1;  
    //一页显示的行数
    private int pageSize=30;
    private String values;
    private Date values2;
    private Date values3;
    private String values4;
    
	public Pagenation(){  
        super();  
    }  
  
    public Pagenation(int rowCount,int pageCount,int currentpage,int pageSize){  
        super();  
        this.currentpage=currentpage;  
        this.rowCount=rowCount;  
        this.pageCount=pageCount;  
        this.pageSize=pageSize;  
    }  
    public int getRowCount() {  
        return rowCount;  
    }  
    public void setRowCount(int rowCount) {  
        this.rowCount = rowCount;  
        
        //this.pageCount=rowCount%this.pageSize==0?rowCount/this.pageSize:rowCount/this.pageSize+1;  
        this.pageCount=(rowCount+this.pageSize-1)/this.pageSize;  
    }  
  
    public Integer getStartRow(){  
        return (getCurrentpage()-1)*getPageSize();  
    }  
   
    public Integer getEndRow(){  
        return getCurrentpage()*getPageSize();        
    }  
    public int getPageCount() {  
        return pageCount;  
    }   
    public void setPageCount(int pageCount) {  
        this.pageCount = pageCount;  
    }  
    public int getCurrentpage() {  
        if(currentpage>pageCount)  
            currentpage=pageCount;  
        if(currentpage<1)  
            currentpage=1;  
        return currentpage;  
    }  
    public void setCurrentpage(int currentpage) {  
        this.currentpage = currentpage;  
    }  
    public int getPageSize() {  
        return pageSize;  
    }  
    public void setPageSize(int pageSize) {  
        this.pageSize = pageSize;  
    }
	public String getValues() {
		return values;
	}
	public void setValues(String values) {
		this.values = values;
	}
	public Date getValues2() {
		return values2;
	}
	public void setValues2(Date values2) {
		this.values2 = values2;
	}
	public Date getValues3() {
		return values3;
	}
	public void setValues3(Date values3) {
		this.values3 = values3;
	}
	   
    public String getValues4() {
		return values4;
	}

	public void setValues4(String values4) {
		this.values4 = values4;
	}

  
}



	

