package com.ex01.review;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.review.dto.BCriteria;
import com.review.dto.BPageMaker;
import com.review.dto.BookDTO;
import com.review.dto.FoodDTO;
import com.review.dto.FoodReviewDTO;
import com.review.dto.MemberDTO;
import com.review.dto.TFCriteria;
import com.review.dto.TFPageMaker;
import com.review.dto.TourDTO;
import com.review.dto.TourLikeDTO;
import com.review.service.ItemsService;

@Controller
public class ItemsController {

	@Inject
	private ItemsService service;

	@Resource
	private String uploadPath;

	//Tour
	//�쟾泥� 由ъ뒪�듃 蹂닿린
	@RequestMapping(value="/tour.vw", method=RequestMethod.GET)
	public String tourAll(TFCriteria cri,Model model) throws Exception {
		//Service�쓽 totalCnt瑜� �샇異쒗븯�뿬 �쟾泥� 寃뚯떆湲� �닔(total)瑜� 諛쏆븘�� pageMaker�뿉 Criteria�� �븿猿� 蹂대궡 怨꾩궛�븯�뿬 model�뿉 paging�젙蹂대�� ���옣
		//�긽�떒 蹂��닔 �솗�씤 �슂
		List<TourDTO> tourAll = service.tourAll(cri);
		int total=service.cntTour();
		model.addAttribute("tourAll", tourAll);
		model.addAttribute("paging",new TFPageMaker(cri,total));
		return "/items/tourList";
	}

	//�긽�꽭蹂닿린
	@RequestMapping(value="/tourDetail.vw", method=RequestMethod.GET)
	public String detailTour(@RequestParam("tno") int tno, Model model,HttpServletRequest request) throws Exception{

		model.addAttribute("detailTour", service.detailTour(tno));

		//String mid=((MemberDTO) httpRequest.getSession().getAttribute("loginUser")).getMid();

		String mid;
		Object obj=request.getSession().getAttribute("loginUser");
		if(obj==null){
			mid="guest";
		}else{
			mid=((MemberDTO)obj).getMid();
		}

		TourLikeDTO tourLikeDTO = new TourLikeDTO();
		tourLikeDTO.setTno(tno);
		tourLikeDTO.setMid(mid);

		int likeTour = service.cntLikeTour(tourLikeDTO);

		model.addAttribute("heart",likeTour);
		return "/items/tourDetail";
	}

	//湲� �벐湲� �뤌 
	@RequestMapping(value="/tourInsert.vw",method=RequestMethod.GET)
	public String tourInsertGet() {

		return "items/tourInsert";
	}

	//湲� �벐湲�
	@RequestMapping(value="/tourInsert.vw",method=RequestMethod.POST)
	public String tourInsertPost(TourDTO tourDTO) throws Exception{

		// �뙆�씪 �뾽濡쒕뱶 泥섎━
		String timg=null;
		MultipartFile uploadFile = tourDTO.getTfile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//�솗�옣�옄 援ы븯湲�
			UUID uuid = UUID.randomUUID();	//UUID 援ы븯湲�
			//						UUID瑜� 留뚮뱾�뼱 �솗�옣�옄�� 遺숈뿬 �꽌踰꾩� DB�뿉 ���옣�븯�룄濡� 諛붽퓞
			timg=uuid+"."+ext;
			uploadFile.transferTo(new File("E:\\__sts\\sts_work\\review\\src\\main\\webapp\\resources\\img\\tour\\" + timg));
		}
		tourDTO.setTimg(timg);
		service.insertTour(tourDTO);
		return "redirect:/tour.vw";
	}

	//湲� �궘�젣
	@RequestMapping(value="/tourDelete.vw")
	public String deleteTour(@RequestParam("tno") int tno,Model model) throws Exception {
		service.deleteTour(tno);
		return "redirect:/tour.vw";
	}

	//議몄븘�슂
	@ResponseBody
	@RequestMapping(value = "/tour/heart", method = RequestMethod.POST, produces = "application/json")
	public int heart(HttpServletRequest request) throws Exception {

		int heart=Integer.parseInt(request.getParameter("heart"));
		int tno=Integer.parseInt(request.getParameter("tno"));
		String mid=((MemberDTO) request.getSession().getAttribute("loginUser")).getMid();

		TourLikeDTO tourLikeDTO = new TourLikeDTO();

		tourLikeDTO.setTno(tno);
		tourLikeDTO.setMid(mid);

		if(heart >= 1) {
			service.nogoodTour(tourLikeDTO);
			heart=0;
		} else {
			service.goodTour(tourLikeDTO);
			heart=1;
		}
		return heart;
	}


	
	
	
	
	
	
	
	
	
	
	
	//Food

	//�쟾泥� 由ъ뒪�듃 蹂닿린
	@RequestMapping(value="/food.vw", method=RequestMethod.GET)
	public String foodAll(TFCriteria cri,Model model, FoodDTO foodDTO) throws Exception {
		//Service�쓽 totalCnt瑜� �샇異쒗븯�뿬 �쟾泥� 寃뚯떆湲� �닔(total)瑜� 諛쏆븘�� pageMaker�뿉 Criteria�� �븿猿� 蹂대궡 怨꾩궛�븯�뿬 model�뿉 paging�젙蹂대�� ���옣
		//�긽�떒 蹂��닔 �솗�씤 �슂

		List<FoodDTO> foodAll = service.foodAll(cri);

		int total=service.cntFood();
		model.addAttribute("foodAll", foodAll);
		model.addAttribute("paging",new TFPageMaker(cri,total));
		service.cntFoodStar(foodDTO);
		return "/items/foodList";
	}

	//�긽�꽭蹂닿린
	@RequestMapping(value="/foodDetail.vw", method=RequestMethod.GET)
	public String detailFood(@RequestParam("fno") int fno, FoodDTO foodDTO, Model model) throws Exception{
		model.addAttribute("detailFood", service.detailFood(fno));
		service.cntFoodStar(foodDTO);
		return "/items/foodDetail";
	}

	//湲� �벐湲� �뤌 
	@RequestMapping(value="/foodInsert.vw",method=RequestMethod.GET)
	public String foodInsertGet() {
		return "items/foodInsert";
	}

	//湲� �벐湲� (�븳湲�紐� �뙆�씪 �븞 �맖)
	@RequestMapping(value="/foodInsert.vw",method=RequestMethod.POST)
	public String foodInsertPost(FoodDTO foodDTO) throws Exception{
		// �뙆�씪 �뾽濡쒕뱶 泥섎━
		String fimg=null;
		MultipartFile uploadFile = foodDTO.getFfile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//�솗�옣�옄 援ы븯湲�
			UUID uuid = UUID.randomUUID();	//UUID 援ы븯湲�
			//						UUID瑜� 留뚮뱾�뼱 �솗�옣�옄�� 遺숈뿬 �꽌踰꾩� DB�뿉 ���옣�븯�룄濡� 諛붽퓞
			fimg=uuid+"."+ext;
			uploadFile.transferTo(new File("E:\\__sts\\sts_work\\review\\src\\main\\webapp\\resources\\img\\food\\" + fimg));
			//						uploadFile.transferTo(new File("/img/book/" + bimg));

		}
		foodDTO.setFimg(fimg);
		service.insertFood(foodDTO);
		return "redirect:/food.vw";
	}

	//湲� �궘�젣
	@RequestMapping(value="/foodDelete.vw")
	public String deleteFood(@RequestParam("fno") int fno,Model model) throws Exception {
		service.deleteFood(fno);
		return "redirect:/food.vw";
	}

	//�뙎湲��쓣 �쐞�빐 Rest諛⑹떇 controller �궗�슜
	@RequestMapping(value="/modify/{frno}")
	public ResponseEntity<String> modify(@RequestBody FoodReviewDTO dto, @PathVariable("frno") int frno) throws Exception{
		dto.setFrno(frno);
		return service.modifyFoodReview(dto) == 1 ? 
				new ResponseEntity<>("success", HttpStatus.OK) :
					new ResponseEntity<>("fail", HttpStatus.OK);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//Book

	//�쟾泥� 由ъ뒪�듃 蹂닿린
	@RequestMapping(value="/book.vw", method=RequestMethod.GET)
	public String bookAll(BCriteria cri,Model model,BookDTO bookDTO) throws Exception {
//		service.cntBookView(bookDTO);
		
		//Service�쓽 totalCnt瑜� �샇異쒗븯�뿬 �쟾泥� 寃뚯떆湲� �닔(total)瑜� 諛쏆븘�� pageMaker�뿉 Criteria�� �븿猿� 蹂대궡 怨꾩궛�븯�뿬 model�뿉 paging�젙蹂대�� ���옣
		//�긽�떒 蹂��닔 �솗�씤 �슂
		List<BookDTO> bookAll = service.bookAll(cri);
		int total=service.cntBook();
		model.addAttribute("bookAll", bookAll);
		model.addAttribute("paging",new BPageMaker(cri,total));

		return "/items/bookList";
	}

	//湲� �벐湲� �뤌 
	@RequestMapping(value="/bookInsert.vw",method=RequestMethod.GET)
	public String bookInsertGet() {
		return "items/bookInsert";
	}

	//湲� �벐湲�
	@RequestMapping(value="/bookInsert.vw",method=RequestMethod.POST)
	public String bookInsertPost(BookDTO bookDTO,HttpServletRequest request) throws Exception{
		// �뙆�씪 �뾽濡쒕뱶 泥섎━
		String bimg=null;
		MultipartFile uploadFile = bookDTO.getBfile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//�솗�옣�옄 援ы븯湲�
			UUID uuid = UUID.randomUUID();	//UUID 援ы븯湲�
			//UUID瑜� 留뚮뱾�뼱 �솗�옣�옄�� 遺숈뿬 �꽌踰꾩� DB�뿉 ���옣�븯�룄濡� 諛붽퓞
//			bimg=originalFileName;
			bimg=originalFileName+"."+ext; //book�� 蹂몃옒 �씠由꾩쑝濡�
			uploadFile.transferTo(new File("E:\\__sts\\sts_work\\review\\src\\main\\webapp\\resources\\img\\book\\" + bimg));
			String realPath=request.getServletContext().getRealPath("/");
			System.out.println(realPath);
			//			uploadFile.transferTo(new File(realPath+"/resources/img/book/" + bimg));

		}
		bookDTO.setBimg(bimg);

		service.insertBook(bookDTO);
		return "redirect:/book.vw";
	}

	//�긽�꽭蹂닿린
	@RequestMapping(value="/bookDetail.vw", method=RequestMethod.GET)
	public String detailBook(@RequestParam("bno") int bno,Model model,BookDTO bookDTO) throws Exception{
		
//		service.cntBookView(bookDTO);
	
		model.addAttribute("detailBook", service.detailBook(bno));
		return "/items/bookDetail";
	}

	//湲� �궘�젣
	@RequestMapping(value="/bookDelete.vw")
	public String deleteBook(@RequestParam("bno") int bno,Model model) throws Exception {
		service.deleteBook(bno);
		return "redirect:/book.vw";
	}

	//�뙎湲��쓣 �쐞�빐 Rest諛⑹떇 controller �궗�슜

}
