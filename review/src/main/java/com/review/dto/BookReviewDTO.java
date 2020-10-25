package com.review.dto;

import java.util.Date;

public class BookReviewDTO {
	
	private int brno;
    private int bno;
    private int ref;
    private int depth;
    private String brcontent;
    private String mid;
    private Date indate;
    
	public int getBrno() {
		return brno;
	}
	public void setBrno(int brno) {
		this.brno = brno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getBrcontent() {
		return brcontent;
	}
	public void setBrcontent(String brcontent) {
		this.brcontent = brcontent;
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
		return "BookReviewDTO [brno=" + brno + ", bno=" + bno + ", ref=" + ref + ", depth=" + depth + ", brcontent="
				+ brcontent + ", mid=" + mid + ", indate=" + indate + "]";
	}
 
}
