package com.review.service;

import com.review.dto.MemberDTO;

public interface MemberService {

	public void insertMember(MemberDTO memberDTO) throws Exception;
	public int idCheck(MemberDTO memberDTO) throws Exception;
	public int mailCheck(MemberDTO memberDTO) throws Exception;
	public MemberDTO checkLogin(MemberDTO memberDTO) throws Exception;
	public MemberDTO myPageMember(String mid) throws Exception;
	public void updateMember(MemberDTO memberDTO) throws Exception;
	public void deleteMember(MemberDTO memberDTO) throws Exception;
}

