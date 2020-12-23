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

public class DogNameDogComService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		String dogname = request.getParameter("dogname");
		
		//select DB
		int pageSize=6; 
		int endNum= pg*pageSize;
		int startNum=endNum-(pageSize-1);  //시작번호
		
		Map<String,Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("dogname", dogname);
		
		ImageBoardDao dao = ImageBoardDao.getInstance();
		List<IbDTO> list = dao.getDongNameList(map);
		
		//강아지 인기 top3
		List<IbDTO> toplist = dao.getImageTopList();
		
		//페이지처리
		Ibpaging ibpaging = new Ibpaging(pg,2,pageSize);
		ibpaging.makePagingHTML3(map, dogname);
		System.out.println(""+ibpaging.getPagingHTML());
		
		//request객체에 등록
		request.setAttribute("list", list);
		request.setAttribute("toplist", toplist);
		request.setAttribute("pg", pg);
		request.setAttribute("ibpaging", ibpaging);
		return "dogboard/dogCompany.jsp";
	}

}
