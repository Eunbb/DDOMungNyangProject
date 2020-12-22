package com.ib.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.ib.dao.ImageBoardDao;
import com.ib.dto.IbDTO;
import com.ib.dto.Ibpaging;

import controller.CommandAction;

public class IbListService2 implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		//select DB
		int pageSize=6; 
		int endNum= pg*pageSize;
		int startNum=endNum-(pageSize-1);  //시작번호
		
		Map<String,Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		ImageBoardDao dao = ImageBoardDao.getInstance();
		List<IbDTO> list = dao.getImageList2(map);
		
		//페이지처리
		Ibpaging ibpaging = new Ibpaging(pg,2,pageSize);
		ibpaging.makePagingHTML();
		
		//request객체에 등록
		request.setAttribute("list", list);
		request.setAttribute("pg", pg);
		request.setAttribute("ibpaging", ibpaging);
		return "dogboard/dogPeople.jsp";
	}

}
