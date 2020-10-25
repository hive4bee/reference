package com.review.dto;

public class BCriteria {
	private int pageNum=1; //페이지 번호
	private int amount=8; //페이지당 데이터 갯수

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
		return "BCriteria [pageNum=" + pageNum + ", amount=" + amount + "]";
	}

	//불러쓰기 위해 & 클래스 이름과 동일
	public BCriteria() {
		this.pageNum=1;
		this.amount=8;
	}









}
