package com.review.dto;

import java.util.Date;

public class FoodReviewDTO {
	
	private int frno;
	private int fno;
	private int frstar;
	private String frcontent;
	private String mid;
	private Date indate;
	private Date upindate;
	
	public int getFrno() {
		return frno;
	}
	public void setFrno(int frno) {
		this.frno = frno;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getFrstar() {
		return frstar;
	}
	public void setFrstar(int frstar) {
		this.frstar = frstar;
	}
	public String getFrcontent() {
		return frcontent;
	}
	public void setFrcontent(String frcontent) {
		this.frcontent = frcontent;
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
	public Date getUpindate() {
		return upindate;
	}
	public void setUpindate(Date upindate) {
		this.upindate = upindate;
	}
	
	@Override
	public String toString() {
		return "FoodReviewDTO [frno=" + frno + ", fno=" + fno + ", frstar=" + frstar + ", frcontent=" + frcontent
				+ ", mid=" + mid + ", indate=" + indate + ", upindate=" + upindate + "]";
	}
	
}
