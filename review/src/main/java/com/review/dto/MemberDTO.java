package com.review.dto;
import java.io.Serializable;
import java.util.Date;

public class MemberDTO implements Serializable{
	
	private static final long serialVersionUID = 6581852293808906741L;
	
	private String mid;
	private String mpw;
	private String mmail;
	private Date indate;
	
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
	public String getMmail() {
		return mmail;
	}
	public void setMmail(String mmail) {
		this.mmail = mmail;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [mid=" + mid + ", mpw=" + mpw + ", mmail=" + mmail + ", indate=" + indate + "]";
	}
	
}//class end
