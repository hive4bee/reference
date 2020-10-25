package com.ex01.review;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.review.dto.MemberDTO;
import com.review.service.MemberService;


@Controller
public class MemberController {

	@Inject
	private MemberService service;

	//회원가입 form
	@RequestMapping(value="/signup.vw",method=RequestMethod.GET)
	public String signupGet(){
		return "/member/signup";
	}

	//회원가입
	@RequestMapping(value="/signup.vw",method=RequestMethod.POST)
	public String signupPost(MemberDTO memberDTO) throws Exception{
		//		service.insertMember(memberDTO);
		String url=null;

		int idresult=service.idCheck(memberDTO);
		int mailresult=service.mailCheck(memberDTO);

		try {
			if(idresult==1||mailresult==1) {
				url="/";//별도 화면 없으니까 우선 main으로
			}else if(idresult==0 && mailresult==0) {
				service.insertMember(memberDTO);
				url="/member/thanksjoin";
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return url;	
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk.vw", method=RequestMethod.POST)
	public int idCheck(MemberDTO memberDTO) throws Exception {
		int idresult = service.idCheck(memberDTO);
		return idresult;
	}

	// 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="/mailChk.vw", method=RequestMethod.POST)
	public int mailCheck(MemberDTO memberDTO) throws Exception {
		int mailresult = service.mailCheck(memberDTO);
		return mailresult;
	}

	//로그인 form
	@RequestMapping(value="/login.vw",method=RequestMethod.GET)
	public String loginGet(){
		return "/member/login";
	}

	//로그인
	@RequestMapping(value="/login.vw",method=RequestMethod.POST)
	public String loginPost(MemberDTO memberDTO, HttpServletRequest request) throws Exception{

		HttpSession session=request.getSession();
		MemberDTO login=service.checkLogin(memberDTO);

		String url=null;

		if(login==null) {
			session.setAttribute("loginUser", null);
			url="/member/loginFail";
		}else {
			session.removeAttribute("mid");
			session.setAttribute("loginUser", login);
			url="redirect:/";
		}
		return url;
	}

	//로그아웃
	@RequestMapping("/logout.vw")
	public String userOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	//내정보보기
	@RequestMapping("/myPage.vw")
	public String myPageMember(@RequestParam("mid") String mid) throws Exception{
		service.myPageMember(mid);
		return "/member/myPage";
	}

	//회원수정 form
	@RequestMapping(value="/updateMember.vw",method=RequestMethod.GET)
	public String updateMemberGet(@RequestParam("mid") String mid){
		return "/member/updateMember";
	}

	//회원수정
	@RequestMapping(value="/updateMember.vw",method=RequestMethod.POST)
	public String updateMemberPost(MemberDTO memberDTO, HttpSession session) throws Exception{
		service.updateMember(memberDTO);
		session.invalidate();
		return "redirect:/";
	}

	// 회원 탈퇴
	@RequestMapping(value="/deleteMember.vw")
	public String userDelete(MemberDTO memberDTO,HttpSession session) throws Exception{
		service.deleteMember(memberDTO);
		session.invalidate();
		return "redirect:/";
	}
}
