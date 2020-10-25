package com.review.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class FoodDTO {
	
	private int fno;
	private String fname;
	private String fmenu;
	private String fcontent;
	private String faddr;
	private int fstar;
	private String fimg;//파일명
	private MultipartFile ffile;//파일
	private String mid;
	private Date indate;
	
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getFmenu() {
		return fmenu;
	}
	public void setFmenu(String fmenu) {
		this.fmenu = fmenu;
	}
	public String getFcontent() {
		return fcontent;
	}
	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}
	public String getFaddr() {
		return faddr;
	}
	public void setFaddr(String faddr) {
		this.faddr = faddr;
	}
	public int getFstar() {
		return fstar;
	}
	public void setFstar(int fstar) {
		this.fstar = fstar;
	}
	public String getFimg() {
		return fimg;
	}
	public void setFimg(String fimg) {
		this.fimg = fimg;
	}
	public MultipartFile getFfile() {
		return ffile;
	}
	public void setFfile(MultipartFile ffile) {
		this.ffile = ffile;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	
	@Override
	public String toString() {
		return "FoodDTO [fno=" + fno + ", fname=" + fname + ", fmenu=" + fmenu + ", fcontent=" + fcontent + ", faddr="
				+ faddr + ", fstar=" + fstar + ", fimg=" + fimg + ", ffile=" + ffile + ", mid=" + mid + ", indate="
				+ indate + "]";
	}
	
}
