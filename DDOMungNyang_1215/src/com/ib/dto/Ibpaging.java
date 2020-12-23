package com.ib.dto;

import com.board.dao.BoardDAO;
import com.ib.dao.ImageBoardDao;

public class Ibpaging {
	private int currentPage;  //  현재페이지
	private int pageBlock;    //  페이지갯수   [이전] [7][8][9] [다음]
	private int pageSize;     //  1페이지당 출력 게시물  (ex)3개씩 글 뿌리기
	private StringBuffer pagingHTML;
	
	public Ibpaging(int currentPage, int pageBlock, int pageSize) {
		super();
		this.currentPage = currentPage;
		this.pageBlock = pageBlock;
		this.pageSize = pageSize;
	}
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();//수정이 가능하도록 StringBuffer를 쓰도록하자
		
		ImageBoardDao imageBoardDao = ImageBoardDao.getInstance();
		int totalA = imageBoardDao.getTotalArticle();     // 총글수 가져오기
		int totalP = (totalA + pageSize -1) / pageSize;   // 총페이지수
		//또는 int totalP=(int)Math.ceil((double)totalA/pageSize);
		//System.out.println(totalP+"  "+t);
		
		int startPage = ((int)((currentPage-1)/pageBlock)) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		
		if(endPage > totalP) {
			endPage = totalP;
		}
		
		if(startPage>pageBlock){			
			pagingHTML.append("<a href='/bbs/Iblist1.do?pg="+(startPage-pageBlock)+"'>["+"이전]</a>");
		}		
		
		for(int i=startPage;i<=endPage;i++){
			if(currentPage==i){
				pagingHTML.append("<a href='/bbs/Iblist1.do?pg="+i+"'><font color=red>["+ i+ "]</font></a>");
			
			}else{
				pagingHTML.append("<a href='/bbs/Iblist1.do?pg="+i+"'>["+i+"]</a>");
			}
		}
				
		if(endPage<totalP){
			pagingHTML.append("<a href='/bbs/Iblist1.do?pg="+(startPage+pageBlock)+"'>["+"다음]</a>");
		}
	}
	
	public String getPagingHTML() {
		return pagingHTML.toString();
	}	
}
