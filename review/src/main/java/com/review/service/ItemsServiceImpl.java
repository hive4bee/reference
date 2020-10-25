package com.review.service;

import java.util.*;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.review.dao.*;
import com.review.dto.*;

@Service
public class ItemsServiceImpl implements ItemsService {

	@Inject
	private ItemsDAO itemsDAO;

	//Tour
	@Override
	public void insertTour(TourDTO tourDTO) throws Exception {
		itemsDAO.insertTour(tourDTO);
	}

	@Override
	public void deleteTour(int tno) throws Exception {
		itemsDAO.deleteTour(tno);
	}

	@Override
	public TourDTO detailTour(int tno) throws Exception {
		return itemsDAO.detailTour(tno);
	}

	@Override
	public List<TourDTO> tourAll(TFCriteria paging) throws Exception {
		return itemsDAO.tourAll(paging);
	}

	@Override
	public int cntTour() throws Exception {
		return itemsDAO.cntTour();
	}

	@Override
	public void goodTour(TourLikeDTO tourLikeDTO) throws Exception {
		itemsDAO.goodTour(tourLikeDTO);
		itemsDAO.likeTour(tourLikeDTO.getTno());
	}

	@Override
	public void nogoodTour(TourLikeDTO tourLikeDTO) throws Exception {
		itemsDAO.nogoodTour(tourLikeDTO);
		itemsDAO.likeTour(tourLikeDTO.getTno());
	}

	@Override
	public void likeTour(int tno) throws Exception {
		//goodTour�� noogTour�뿉�꽌 �궗�슜 
	}

	@Override
	public int cntLikeTour(TourLikeDTO tourLikeDTO) throws Exception {
		return itemsDAO.cntLikeTour(tourLikeDTO);
	}


	//Food

	@Override
	public void insertFood(FoodDTO foodDTO) throws Exception {
		itemsDAO.insertFood(foodDTO);
	}

	@Override
	public void deleteFood(int fno) throws Exception {
		itemsDAO.deleteFood(fno);
	}

	@Override
	public FoodDTO detailFood(int fno) throws Exception {
		return itemsDAO.detailFood(fno);
	}

	@Override
	public List<FoodDTO> foodAll(TFCriteria paging) throws Exception {
		return itemsDAO.foodAll(paging);
	}

	@Override
	public int cntFood() throws Exception {
		return itemsDAO.cntFood();
	}

	@Override
	public int cntFoodStar(FoodDTO foodDTO) throws Exception {
		return itemsDAO.cntFoodStar(foodDTO);
	}

	@Override
	public List<FoodReviewDTO> foodReviewAll(int fno) throws Exception {
		return itemsDAO.foodReviewAll(fno);
	}

	@Override
	public void insertFoodReview(FoodReviewDTO foodReviewDTO) throws Exception {
		itemsDAO.insertFoodReview(foodReviewDTO);
	}

	@Override
	public void deleteFoodReview(int frno) throws Exception {
		itemsDAO.deleteFoodReview(frno);
	}
	
	@Override
	public int modifyFoodReview(FoodReviewDTO dto) throws Exception {
		return itemsDAO.modifyFoodReview(dto);
	}
	

	
	//Book
	public void insertBook(BookDTO bookDTO) throws Exception {
		itemsDAO.insertBook(bookDTO);
	}

	@Override
	public void deleteBook(int bno) throws Exception {
		itemsDAO.deleteBook(bno);
	}

	@Override
	public BookDTO detailBook(int bno) throws Exception {

		return itemsDAO.detailBook(bno);
	}

	@Override
	public List<BookDTO> bookAll(BCriteria paging) throws Exception {

		return itemsDAO.bookAll(paging);
	}

	@Override
	public int cntBook() throws Exception {
		return itemsDAO.cntBook();
	}

	@Override
	public List<BookReviewDTO> bookReviewAll(int bno) throws Exception {
		return itemsDAO.bookReviewAll(bno);
	//		List<BookReviewDTO> boardReplyList = itemsDO.bookReviewAll(paramMap);
//		//遺�紐�
//		List<BookReviewDTO> boardReplyListParent = new ArrayList<BookReviewDTO>();
//		//�옄�떇
//		List<BookReviewDTO> boardReplyListChild = new ArrayList<BookReviewDTO>();
//		//�넻�빀
//		List<BookReviewDTO> newBoardReplyList = new ArrayList<BookReviewDTO>();
//
//		//1.遺�紐⑥� �옄�떇 遺꾨━
//		for(BookReviewDTO boardReply: boardReplyList){
//			if(boardReply.getDepth()==0){
//				boardReplyListParent.add(boardReply);
//			}else{
//				boardReplyListChild.add(boardReply);
//			}
//		}
//
//		//2.遺�紐⑤�� �룎由곕떎.
//		for(BookReviewDTO boardReplyParent: boardReplyListParent){
//			//2-1. 遺�紐⑤뒗 臾댁“嫄� �꽔�뒗�떎.
//			newBoardReplyList.add(boardReplyParent);
//			//3.�옄�떇�쓣 �룎由곕떎.
//			for(BookReviewDTO boardReplyChild: boardReplyListChild){
//				//3-1. 遺�紐⑥쓽 �옄�떇�씤 寃껊뱾留� �꽔�뒗�떎.
//				if(boardReplyParent.getBrno()==(boardReplyChild.getRef())){
//					newBoardReplyList.add(boardReplyChild);
//				}
//			}
//		}
//		//�젙由ы븳 list return
//		return newBoardReplyList;
	}
	
	@Override
	public void insertBookReview(BookReviewDTO bookReviewDTO) throws Exception {
		itemsDAO.insertBookReview(bookReviewDTO);
	}

	@Override
	public void deleteBookReview(int brno) throws Exception {
		itemsDAO.deleteBookReview(brno);
		
	}

	@Override
	public void cntBookView(BookDTO bookDTO) throws Exception {
		itemsDAO.cntBookView(bookDTO);
	}

	


}
