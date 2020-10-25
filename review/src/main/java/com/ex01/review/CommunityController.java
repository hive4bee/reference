package com.ex01.review;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.review.dto.CommunityDTO;
import com.review.dto.MemberDTO;
import com.review.dto.TFCriteria;
import com.review.dto.TFPageMaker;
import com.review.dto.TourDTO;

@Controller
public class CommunityController {

	@Autowired
	private SqlSessionTemplate session;

	//리스트 보기
	@RequestMapping("/community.vw")
	private String communityAll(Model model, String pageNum) {

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//한 페이지에 10개씩
		int currentPage=Integer.parseInt(pageNum);//현재 페이지

		int startRow=(currentPage-1)*pageSize+1;//한 페이지의 시작 행
		int endRow=currentPage*pageSize;//한 페이지의 마지막 행

		int count=0;//글 전체 갯수 넣을 변수
		int pageBlock=10;//1블럭당 10페이지씩 표시

		count=session.selectOne("communityMapper.cntCommunity");//총 글 갯수 

		int number=count-(currentPage-1)*pageSize;//글번호 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//총 페이지 갯수

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1페이지       11페이지     21페이지
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 페이지   20페이지     30페이지

		if(endPage>pageCount) {//에러 방지 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<CommunityDTO> list=session.selectList("communityMapper.communityALl",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("number",number);
		model.addAttribute("communityAll",list);
		model.addAttribute("pageNum",pageNum);
	
		return "/community/communityList";
	}

	//글, 답글 쓰기 Form
	@RequestMapping(value="/communityInsert.vw",method=RequestMethod.GET)
	private String insertCommunityGet(Model model,String num, String ref, String re_step,String re_level, String pageNum) {

		if(num==null) {// 처음 글쓸때
			num="0";
			ref="1";
			re_step="0";
			re_level="0";
		}
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("num", num);
		model.addAttribute("ref", ref);
		model.addAttribute("re_step", re_step);
		model.addAttribute("re_level", re_level);
		return "/community/communityInsert";
	}

	//글쓰기
	@RequestMapping(value="/communityInsert.vw",method=RequestMethod.POST)
	private String insertCommunityPost(@ModelAttribute("communityDTO") CommunityDTO communityDTO,HttpServletRequest request) {

		int maxNum=0;

		if(session.selectOne("communityMapper.maxNumber") != null){
			maxNum=session.selectOne("communityMapper.maxNumber");
		}

		if(maxNum !=0) {//최대 글번호가 0이 아니면
			maxNum=maxNum+1;
		}else { //최대 글번호가 0이면
			maxNum=1;
		}

		if(communityDTO.getCno() !=0) {//답글
			session.update("communityMapper.reStep", communityDTO);//답글 끼워넣기 위치 확보
			communityDTO.setRe_step(communityDTO.getRe_step()+1);//글 순서
			communityDTO.setRe_level(communityDTO.getRe_level()+1);//글 깊이
		}else {// 원글
			communityDTO.setRef(new Integer(maxNum));//글 그룹번호, 현재의 글번호에 ref 넣어줌
			communityDTO.setRe_step(new Integer(0));//글 순서
			communityDTO.setRe_level(new Integer(0));//글 깊이
		}
		session.insert("communityMapper.insertCommunity", communityDTO);
		return "redirect:/community.vw";
	}
	
	//글보기
//	@RequestMapping(value="/communityDetail.vw",method=RequestMethod.GET)
//	private String detailBoard(Model model,String num,String pageNum) throws Exception{
//		int num=Integer.parseInt(num);
//		session.update("communityMapper.hit",num1);//조횟수 증가 
//		
//		CommunityDTO communityDTO=session.selectOne("communityMapper.communityDetail",num1);
//		
//		String content=communityDTO.getContent();
//		//content=content.replace("\n","<br>");
//		
//
//		model.addAttribute("communityDTO",communityDTO);
//
//
//		
//		return "/community/communitydetail";
//		
//	}
//




}
