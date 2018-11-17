package com.beadhouse.pojo;

import java.util.Date;

public class EarthMenu {
    private Long id;

    private Integer version;

    private Date createtime;

    private String name;

    private String url;

    private String number;

    private Short isleaf;

    private Short level;

    private Long parentid;

    private String targetname;
    private String parentidname;

   

	public String getParentidname() {
		return parentidname;
	}

	public void setParentidname(String parentidname) {
		this.parentidname = parentidname;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    public Short getIsleaf() {
        return isleaf;
    }

    public void setIsleaf(Short isleaf) {
        this.isleaf = isleaf;
    }

    public Short getLevel() {
        return level;
    }

    public void setLevel(Short level) {
        this.level = level;
    }

    public Long getParentid() {
        return parentid;
    }

    public void setParentid(Long parentid) {
        this.parentid = parentid;
    }

    public String getTargetname() {
        return targetname;
    }

    public void setTargetname(String targetname) {
        this.targetname = targetname == null ? null : targetname.trim();
    }
}