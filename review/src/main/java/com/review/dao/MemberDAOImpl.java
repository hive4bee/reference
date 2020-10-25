package com.review.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.review.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	public static String namespace="memberMapper";

	@Inject
	private SqlSessionTemplate session;

	@Override
	public void insertMember(MemberDTO memberDTO) throws Exception {
		session.insert("memberMapper.insertMember",memberDTO);
	}

	@Override
	public int idCheck(MemberDTO memberDTO) throws Exception {
		//		int idresult=session.selectOne("memberMapper.idCheck",memberDTO);
		return session.selectOne("memberMapper.idCheck",memberDTO);
	}

	@Override
	public int mailCheck(MemberDTO memberDTO) throws Exception {
		//		int mailresult=session.selectOne("memberMapper.mailCheck",memberDTO);
		return session.selectOne("memberMapper.mailCheck",memberDTO);
	}

	@Override
	public MemberDTO checkLogin(MemberDTO memberDTO) throws Exception {
		return session.selectOne("memberMapper.checkLogin",memberDTO);
	}

	@Override
	public MemberDTO myPageMember(String mid) throws Exception {
		return session.selectOne("memberMapper.myPageMember",mid);
	}

	@Override
	public void updateMember(MemberDTO memberDTO) throws Exception {
		session.update("memberMapper.updateMember",memberDTO);
	}

	@Override
	public void deleteMember(MemberDTO memberDTO) throws Exception {
		session.delete("memberMapper.deleteMember",memberDTO);
	}
}
