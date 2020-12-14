package com.ib.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dao.Ibpaging;
import com.ib.dto.IbDTO;

import controller.CommandAction;

public class IbListService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		System.out.println(pg); // 1
		//select-DB
		BoardDAO dao = BoardDAO.getInstance();
		int endNum= pg*6; // 6건씩 보여줌 한 페이지에
		int startNum = endNum-5; // -5
		
		Map<String,Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<IbDTO> list = dao.getImageList(map);
		
		//페이지처리
		Ibpaging paging = new Ibpaging(pg,3,6); // 현재페이지,표시할 페이지수, 출력할게시물수
		paging.makePagingHTML();
		
		//request객체에 등록
		request.setAttribute("list", list);
		request.setAttribute("pg", pg);
		request.setAttribute("ibpaging", paging);
		return "dogCompany.jsp";
	}

}
