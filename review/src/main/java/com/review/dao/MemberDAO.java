package com.review.dao;

import com.review.dto.MemberDTO;
import com.review.dto.TourDTO;

public interface MemberDAO {
	
	public void insertMember(MemberDTO memberDTO) throws Exception;
	public int idCheck(MemberDTO memberDTO) throws Exception;
	public int mailCheck(MemberDTO memberDTO) throws Exception;
	public MemberDTO checkLogin(MemberDTO memberDTO) throws Exception;
	public MemberDTO myPageMember(String mid) throws Exception;
	public void updateMember(MemberDTO memberDTO) throws Exception;
	public void deleteMember(MemberDTO memberDTO) throws Exception;
}
