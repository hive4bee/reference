package com.review.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.binding.MapperMethod.ParamMap;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.review.dto.*;

@Repository
public class ItemsDAOImpl implements ItemsDAO {

	@Inject
	private SqlSessionTemplate session;

	public static String namespace="itemsMapper";

	//Tour
	@Override
	public void insertTour(TourDTO tourDTO) throws Exception {
		session.insert(namespace+".insertTour", tourDTO);
	}

	@Override
	public void deleteTour(int tno) throws Exception {
		session.delete(namespace+".deleteTour",tno);
	}

	@Override
	public TourDTO detailTour(int tno) throws Exception {
		return session.selectOne(namespace+".detailTour",tno);
	}

	@Override
	public List<TourDTO> tourAll(TFCriteria paging) throws Exception {
		return session.selectList(namespace+".tourAll",paging);
	}

	@Override
	public int cntTour() throws Exception {
		return session.selectOne(namespace+".cntTour");
	}

	@Override
	public void goodTour(TourLikeDTO tourLikeDTO) throws Exception {
		session.insert(namespace+".goodTour",tourLikeDTO);
	}

	@Override
	public void nogoodTour(TourLikeDTO tourLikeDTO) throws Exception {
		session.delete(namespace+".nogoodTour",tourLikeDTO);
	}

	@Override
	public void likeTour(int tno) throws Exception {
		session.update(namespace+".likeTour",tno);
	}

	@Override
	public int cntLikeTour(TourLikeDTO tourLikeDTO) throws Exception {
		return session.selectOne(namespace+".cntLikeTour",tourLikeDTO);
	}


	//Food

	@Override
	public void insertFood(FoodDTO foodDTO) throws Exception {
		session.insert(namespace+".insertFood", foodDTO);
	}

	@Override
	public void deleteFood(int fno) throws Exception {
		session.delete(namespace+".deleteFood",fno);
	}

	@Override
	public FoodDTO detailFood(int fno) throws Exception {
		return session.selectOne(namespace+".detailFood",fno);
	}

	@Override
	public List<FoodDTO> foodAll(TFCriteria paging) throws Exception {
		return session.selectList(namespace+".foodAll",paging);
	}

	@Override
	public int cntFood() throws Exception {
		return session.selectOne(namespace+".cntFood");
	}

	@Override
	public List<FoodReviewDTO> foodReviewAll(int fno) throws Exception {
		return session.selectList(namespace+".foodReviewAll",fno);
	}

	@Override
	public void insertFoodReview(FoodReviewDTO foodReviewDTO) throws Exception {
		session.insert(namespace+".insertFoodReview",foodReviewDTO);
	}

	@Override
	public void deleteFoodReview(int frno) throws Exception {
		session.delete(namespace+".deleteFoodReview",frno);
	}

	@Override
	public int cntFoodStar(FoodDTO foodDTO) throws Exception {
		return session.update(namespace+".cntFoodStar", foodDTO);
	}
	@Override
	public int modifyFoodReview(FoodReviewDTO dto) throws Exception {
		return session.update(namespace+".modifyFoodReview", dto);
	}


	//Book

	@Override
	public void insertBook(BookDTO bookDTO) throws Exception {
		session.insert(namespace+".insertBook", bookDTO);
	}

	@Override
	public void deleteBook(int bno) throws Exception {
		session.delete(namespace+".deleteBook",bno);
	}

	@Override
	public BookDTO detailBook(int bno) throws Exception {
		return session.selectOne(namespace+".detailBook", bno);
	}

	@Override
	public List<BookDTO> bookAll(BCriteria paging) throws Exception {
		return session.selectList(namespace+".bookAll",paging);
	}

	@Override
	public int cntBook() throws Exception {
		return session.selectOne(namespace+".cntBook");
	}


	@Override
	public void insertBookReview(BookReviewDTO bookReviewDTO) throws Exception {
		session.insert(namespace+".insertBookReview",bookReviewDTO);		
	}

	@Override
	public void deleteBookReview(int brno) throws Exception {
//		if(paramMap.get("r_type").equals("main")) {
//			//遺�紐⑤��꽣 �븯�쐞 �떎 吏���
//			return session.delete(namespace+".deleteBookReveiwAll");
//		}else {
//			//�옄湲� �옄�떊留� 吏���
//			return session.delete(namespace+".deleteBookReveiw");
//		}
		session.delete(namespace+".deleteBookReview",brno);
	}

	@Override
	public List<BookReviewDTO> bookReviewAll(int bno) throws Exception {
		return session.selectList(namespace+".bookReviewAll",bno);
	}

	@Override
	public void cntBookView(BookDTO bookDTO) throws Exception {
		session.update(namespace+".cntBookView", bookDTO);
	}
	
	

	
}
