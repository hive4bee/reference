package com.review.dto;

import java.util.Date;

public class CommunityDTO {
	private int cno;
	private String mid;
	private String mpw;
	private String subject;
	private String content;
	private int hit;
	private int ref;
	private int re_step;
	private int re_level;
	private Date indate;
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	@Override
	public String toString() {
		return "CommunityDTO [cno=" + cno + ", mid=" + mid + ", mpw=" + mpw + ", subject=" + subject + ", content="
				+ content + ", hit=" + hit + ", ref=" + ref + ", re_step=" + re_step + ", re_level=" + re_level
				+ ", indate=" + indate + "]";
	}
	
	
	
	

}
