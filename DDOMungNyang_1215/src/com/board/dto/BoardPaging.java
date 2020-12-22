package com.board.dto;

import com.board.dao.BoardDAO;

public class BoardPaging {

	int currentPage;   // 현재페이지
	int pageBlock;     // [1][2][3][다음]   [이전][4][5][6][다음]
	int pageSize;      // 1페이에 몇개씩 글을 출력할 것인가?
	StringBuffer pagingHTML;
	
	public BoardPaging(int currentPage, int pageBlock, int pageSize) {
		this.currentPage = currentPage;
		this.pageBlock = pageBlock;
		this.pageSize = pageSize;
	}
	
	public void makePagingHTML(){
		pagingHTML=new StringBuffer();
		
		BoardDAO boardDAO=BoardDAO.getInstance();
		int totalA=boardDAO.getTotalArticle();   //총글수
		int totalP=(totalA+pageSize-1)/pageSize; //총페이지수
	
		int startPage=((int)((currentPage-1)/pageBlock))*pageBlock+1;		
		int endPage=startPage+pageBlock-1;
				
		if(endPage>totalP){
			endPage=totalP;
		}		
		
		//----------------------------------------------------------------
		if(startPage>pageBlock){			
			pagingHTML.append("<a href='/bbs/boardList.do?pg="+(startPage-pageBlock)+"'>["+"이전]</a>");
		}		
		
		for(int i=startPage;i<=endPage;i++){
			if(currentPage==i){
				pagingHTML.append("<a href='/bbs/boardList.do?pg="+i+"'><font color=red>["+ i+ "]</font></a>");
			
			}else{
				pagingHTML.append("<a href='/bbs/boardList.do?pg="+i+"'>["+i+"]</a>");
			}
		}
				
		if(endPage<totalP){
			pagingHTML.append("<a href='/bbs/boardList.do?pg="+(startPage+pageBlock)+"'>["+"다음]</a>");
		}
	}
	
	public String getPagingHTML() {
		return pagingHTML.toString();
	}	
}
