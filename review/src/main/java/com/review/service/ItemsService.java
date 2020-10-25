package com.review.service;

import java.util.*;

import com.review.dto.*;

public interface ItemsService {

	//Tour
	public void insertTour(TourDTO tourDTO) throws Exception;
	public void deleteTour(int tno) throws Exception;
	public TourDTO detailTour(int tno) throws Exception;
	public List<TourDTO> tourAll(TFCriteria paging) throws Exception;
	public int cntTour() throws Exception;
	public void goodTour(TourLikeDTO tourLikeDTO) throws Exception;
	public void nogoodTour(TourLikeDTO tourLikeDTO) throws Exception;
	public void likeTour(int tno) throws Exception;
	public int cntLikeTour(TourLikeDTO tourLikeDTO) throws Exception;

	//Food
	public void insertFood(FoodDTO foodDTO) throws Exception;
	public void deleteFood(int fno) throws Exception;
	public FoodDTO detailFood(int fno) throws Exception;
	public List<FoodDTO> foodAll(TFCriteria paging) throws Exception;
	public int cntFood() throws Exception;
	public int cntFoodStar(FoodDTO foodDTO) throws Exception;
	public List<FoodReviewDTO> foodReviewAll(int fno) throws Exception;
	public void insertFoodReview(FoodReviewDTO foodReviewDTO) throws Exception;
	public void deleteFoodReview(int frno) throws Exception;
	public int modifyFoodReview(FoodReviewDTO dto) throws Exception;
	

	//Book
	public void insertBook(BookDTO bookDTO) throws Exception;
	public void deleteBook(int bno) throws Exception;
	public BookDTO detailBook(int bno) throws Exception;
	public List<BookDTO> bookAll(BCriteria paging) throws Exception;
	public int cntBook() throws Exception;
	public List<BookReviewDTO> bookReviewAll(int bno) throws Exception;
	public void insertBookReview(BookReviewDTO bookReviewDTO) throws Exception;
	public void deleteBookReview(int brno) throws Exception;
//	public int cntBookReview(BookDTO bookDTO) throws Exception;
	public void cntBookView(BookDTO bookDTO) throws Exception;
	

}
