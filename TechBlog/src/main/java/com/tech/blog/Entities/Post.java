package com.tech.blog.Entities;

import java.sql.Timestamp;

import javax.management.loading.PrivateClassLoader;

public class Post {
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getPlink() {
		return plink;
	}
	public void setPlink(String plink) {
		this.plink = plink;
	}
	public int getPuser() {
		return puser;
	}
	public void setPuser(int puser) {
		this.puser = puser;
	}
	private int pId;
	private String pTitle;
	private String pContent;
	private String pPic;
	private Timestamp pDate;
	private int fid;
	private int puser;
	private String plink;
	private String pCode;
	public Post(int pId, String pTitle, String pContent, String pPic, Timestamp pDate, int fid,int puser,String plink,String pCode) {
		super();
		this.pId = pId;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pPic = pPic;
		this.pDate = pDate;
		this.fid = fid;
		this.puser=puser;
		this.plink=plink;
		this.pCode=pCode;
	}
	public Post(String pTitle, String pContent, String pPic, Timestamp pDate, int fid,int puser,String plink,String pCode) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pPic = pPic;
		this.pDate = pDate;
		this.fid = fid;
		this.puser=puser;
		this.plink=plink;
		this.pCode=pCode;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getpPic() {
		return pPic;
	}
	public void setpPic(String pPic) {
		this.pPic = pPic;
	}
	public Timestamp getpDate() {
		return pDate;
	}
	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}

}
