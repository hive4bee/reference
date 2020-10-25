package com.review.dto;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BookDTO {
	
	private int bno;
	private String bname;
	private String bauthor;
	private String bimg;  //파일명
	private MultipartFile bfile; //파일
	private String bcontent;
	private String mid;
	private int bcnt;
	private Date indate;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBauthor() {
		return bauthor;
	}
	public void setBauthor(String bauthor) {
		this.bauthor = bauthor;
	}
	public String getBimg() {
		return bimg;
	}
	public void setBimg(String bimg) {
		this.bimg = bimg;
	}
	public MultipartFile getBfile() {
		return bfile;
	}
	public void setBfile(MultipartFile bfile) {
		this.bfile = bfile;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getBcnt() {
		return bcnt;
	}
	public void setBcnt(int bcnt) {
		this.bcnt = bcnt;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	@Override
	public String toString() {
		return "BookDTO [bno=" + bno + ", bname=" + bname + ", bauthor=" + bauthor + ", bimg=" + bimg + ", bfile="
				+ bfile + ", bcontent=" + bcontent + ", mid=" + mid + ", bcnt=" + bcnt + ", indate=" + indate + "]";
	}
	
	
	
	
	
	
	
}
