package com.review.dto;

public class TFCriteria {
	
	private int pageNum=1;	//페이지 번호
	private int amount=6;	//페이지당 데이터 갯수
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "TFCriteria [pageNum=" + pageNum + ", amount=" + amount + "]";
	}
	
	public TFCriteria() {
		this.pageNum=1;
		this.amount=6;
	}
	
}//class endz
