package com.ib.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ib.dao.ImageBoardDao;
import com.ib.dao.ImageBoardPaging;
import com.ib.entity.ImageBoardEntity;

public class ImageBoardListAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg=Integer.parseInt(request.getParameter("pg"));
		
		//DB-Select
		ImageBoardDao dao=ImageBoardDao.getInstance();
		int endNum=pg*3;
		int startNum=endNum-2;
		
		Map<String,Object> map=new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<ImageBoardEntity> list=dao.getImageBoardList(map);
		
		//페이징처리                                                       현재페이지,표시할 페이지수,출력할게시물의갯수
		ImageBoardPaging paging=new ImageBoardPaging(pg ,3,3);
		paging.makePagingHTML();                 // pg를 1 2 3으로 수정해 볼것
		
		//request객체에 등록
		request.setAttribute("list", list);
		request.setAttribute("pg", pg);
		request.setAttribute("imageBoardPaging", paging);
		
		return "imgboard/imageBoardList.jsp";
	}
}








