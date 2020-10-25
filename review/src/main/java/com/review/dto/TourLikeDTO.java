package com.review.dto;

import java.util.Date;

public class TourLikeDTO {
	
	private int tlno;
	private int tno;
	private String mid;
	
	public TourLikeDTO() {}
	
	public int getTlno() {
		return tlno;
	}
	public void setTlno(int tlno) {
		this.tlno = tlno;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	@Override
	public String toString() {
		return "TourLikeDTO [tlno=" + tlno + ", tno=" + tno + ", mid=" + mid + "]";
	}

}
