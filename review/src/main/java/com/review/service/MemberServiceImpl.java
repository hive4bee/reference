package com.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.review.dao.MemberDAO;
import com.review.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;

	public void insertMember(MemberDTO memberDTO) throws Exception {
		memberDAO.insertMember(memberDTO);
	}

	@Override
	public int idCheck(MemberDTO memberDTO) throws Exception {
//		int mailresult = memberDAO.mailCheck(memberDTO);
		return memberDAO.idCheck(memberDTO);
	}

	@Override
	public int mailCheck(MemberDTO memberDTO) throws Exception {
		//		int mailresult = memberDAO.mailCheck(memberDTO);
		return memberDAO.mailCheck(memberDTO);
	}

	@Override
	public MemberDTO checkLogin(MemberDTO memberDTO) throws Exception {
		return memberDAO.checkLogin(memberDTO);
	}

	@Override
	public MemberDTO myPageMember(String mid) throws Exception {
		return  memberDAO.myPageMember(mid);
	}

	@Override
	public void updateMember(MemberDTO memberDTO) throws Exception {
		memberDAO.updateMember(memberDTO);
	}

	@Override
	public void deleteMember(MemberDTO memberDTO) throws Exception {
		memberDAO.deleteMember(memberDTO);
	}

}