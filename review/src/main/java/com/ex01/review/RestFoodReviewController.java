package com.ex01.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.review.dto.*;
import com.review.service.*;

@RestController
@RequestMapping(value="/foodreview/")
public class RestFoodReviewController {

	@Inject
	private ItemsService service;

	//리스트 보기
	@RequestMapping(value = "/all/{fno}", method = RequestMethod.GET)
	public ResponseEntity<List<FoodReviewDTO>> list(@PathVariable("fno") int fno) {
		ResponseEntity<List<FoodReviewDTO>> entity = null;
		try {
			List<FoodReviewDTO> list = service.foodReviewAll(fno);
			entity = new ResponseEntity<>(service.foodReviewAll(fno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	//등록하기
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> insertFoodReview(@RequestBody FoodReviewDTO foodReviewDTO,FoodDTO foodDTO) {

		ResponseEntity<String> entity = null;
		try {
			service.insertFoodReview(foodReviewDTO);
			service.cntFoodStar(foodDTO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	//댓글 삭제
	@RequestMapping(value = "/{frno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteFoodReview(@PathVariable("frno") int frno, FoodDTO foodDTO) {

		ResponseEntity<String> entity = null;
		try {
			service.deleteFoodReview(frno);
			service.cntFoodStar(foodDTO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	//댓글 페이징
	@RequestMapping(value = "/{bno}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage( @PathVariable("fno") int fno, @PathVariable("page") int page) {
		//
		ResponseEntity<Map<String, Object>> entity = null;
		//	    
		try {
			TFCriteria cri = new TFCriteria();
			cri.setPageNum(page);
			System.out.println("확인1-1");

			TFPageMaker pageMaker = new TFPageMaker(cri, page);
			pageMaker.setCri(cri);

			Map<String, Object> map = new HashMap<String, Object>();
			List<FoodReviewDTO> list = service.foodReviewAll(fno);

			map.put("list", list);

			System.out.println("확인1-2");
			pageMaker.setCri(cri);

			map.put("pageMaker", pageMaker);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			System.out.println("확인1-3");
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}



}
