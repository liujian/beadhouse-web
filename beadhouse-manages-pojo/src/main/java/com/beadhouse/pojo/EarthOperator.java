package com.beadhouse.pojo;

import java.util.Date;
import java.util.List;

public class EarthOperator {
    private Long id;

    private Integer version;

    private Date createtime;

    private String loginname;

    private String loginpwd;

    private String remark;

    private String realname;

    private String mobileno;

    private String status;

    private String type;

    private Date lastlogintime;

    private Short ischangedpwd;

    private Short pwderrorcount;

    private Date pwderrortime;
    
    private String roleid;
    private String rolename;
    private List<EarthMenu> earthmenu;
    private List<EarthAction> earthaction;
    private List<String> earthactionsx;
    

    public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public List<String> getEarthactionsx() {
		return earthactionsx;
	}

	public void setEarthactionsx(List<String> earthactionsx) {
		this.earthactionsx = earthactionsx;
	}

	public List<EarthMenu> getEarthmenu() {
		return earthmenu;
	}

	public void setEarthmenu(List<EarthMenu> earthmenu) {
		this.earthmenu = earthmenu;
	}

	public List<EarthAction> getEarthaction() {
		return earthaction;
	}

	public void setEarthaction(List<EarthAction> earthaction) {
		this.earthaction = earthaction;
	}

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
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

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname == null ? null : loginname.trim();
    }

    public String getLoginpwd() {
        return loginpwd;
    }

    public void setLoginpwd(String loginpwd) {
        this.loginpwd = loginpwd == null ? null : loginpwd.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    public String getMobileno() {
        return mobileno;
    }

    public void setMobileno(String mobileno) {
        this.mobileno = mobileno == null ? null : mobileno.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Date getLastlogintime() {
        return lastlogintime;
    }

    public void setLastlogintime(Date lastlogintime) {
        this.lastlogintime = lastlogintime;
    }

    public Short getIschangedpwd() {
        return ischangedpwd;
    }

    public void setIschangedpwd(Short ischangedpwd) {
        this.ischangedpwd = ischangedpwd;
    }

    public Short getPwderrorcount() {
        return pwderrorcount;
    }

    public void setPwderrorcount(Short pwderrorcount) {
        this.pwderrorcount = pwderrorcount;
    }

    public Date getPwderrortime() {
        return pwderrortime;
    }

    public void setPwderrortime(Date pwderrortime) {
        this.pwderrortime = pwderrortime;
    }
}