package com.review.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class TourDTO {
	
	private int tno;
	private String tname;
	private String tcontent;
	private String tlocation;
	private String tstart;
	private String tend;
	private String timg;
	private MultipartFile tfile;
	private String mid;
	private int tlike;
	private Date indate;
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTcontent() {
		return tcontent;
	}
	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}
	public String getTlocation() {
		return tlocation;
	}
	public void setTlocation(String tlocation) {
		this.tlocation = tlocation;
	}
	public String getTstart() {
		return tstart;
	}
	public void setTstart(String tstart) {
		this.tstart = tstart;
	}
	public String getTend() {
		return tend;
	}
	public void setTend(String tend) {
		this.tend = tend;
	}
	public String getTimg() {
		return timg;
	}
	public void setTimg(String timg) {
		this.timg = timg;
	}
	public MultipartFile getTfile() {
		return tfile;
	}
	public void setTfile(MultipartFile tfile) {
		this.tfile = tfile;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getTlike() {
		return tlike;
	}
	public void setTlike(int tlike) {
		this.tlike = tlike;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	@Override
	public String toString() {
		return "TourDTO [tno=" + tno + ", tname=" + tname + ", tcontent=" + tcontent + ", tlocation=" + tlocation
				+ ", tstart=" + tstart + ", tend=" + tend + ", timg=" + timg + ", tfile=" + tfile + ", mid=" + mid
				+ ", tlike=" + tlike + ", indate=" + indate + "]";
	}

}
	
				