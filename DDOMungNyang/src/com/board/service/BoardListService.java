package com.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;
import com.board.dto.BoardPaging;

import controller.CommandAction;

public class BoardListService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터 가져오기
		int pg=Integer.parseInt(request.getParameter("pg"));
		
		//select DB
		int pageSize=5;                    //한 페이지에 출력할 게시물수
		int endNum=pg*pageSize;            //끝번호
		int startNum=endNum-(pageSize-1);  //시작번호
		
		Map<String, Integer>map=new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		BoardDAO dao=new BoardDAO();
		List<BoardDTO> list=dao.getBoardList(map);          //현재화면에 출력할 5개 게시물 가져오기
		
		//페이지처리
		BoardPaging paging=new BoardPaging(pg,2,pageSize);  //화면처리-동기화(synchronized)
		paging.makePagingHTML();
		
		request.setAttribute("list", list);
		request.setAttribute("pg", pg);
		request.setAttribute("paging", paging);
		
		return "board/boardList.jsp";
	}
}







