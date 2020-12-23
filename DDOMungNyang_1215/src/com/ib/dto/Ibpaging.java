package com.ib.dto;

import java.util.Map;

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
	//강아지 업체분양 메인 페이지
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
	//강아지 업체분양 메인 페이지 + 성별	
	public void makePagingHTML2(Map<String, Object> map) {
		pagingHTML = new StringBuffer();//수정이 가능하도록 StringBuffer를 쓰도록하자
		ImageBoardDao imageBoardDao = ImageBoardDao.getInstance();
		System.out.println("paging에서 map 받음 : " + map.keySet());
		int totalA = imageBoardDao.getTotalArticle2(map);     // 총글수 가져오기
		System.out.println("총글수 : " + totalA);
		int totalP = (totalA + pageSize -1) / pageSize;   // 총페이지수
		//또는 int totalP=(int)Math.ceil((double)totalA/pageSize);
		//System.out.println(totalP+"  "+t);
		
		int startPage = ((int)((currentPage-1)/pageBlock)) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		
		if(endPage > totalP) {
			endPage = totalP;
		}
		
		if(startPage>pageBlock){			
			pagingHTML.append("<a href='/bbs/genderdogcompany.do?pg="+(startPage-pageBlock)+"'>["+"이전]</a>");
		}		
		
		for(int i=startPage;i<=endPage;i++){
			if(currentPage==i){
				pagingHTML.append("<a href='/bbs/genderdogcompany.do?pg="+i+"'><font color=red>["+ i+ "]</font></a>");
			
			}else{
				pagingHTML.append("<a href='/bbs/genderdogcompany.do?pg="+i+"'>["+i+"]</a>");
			}
		}
				
		if(endPage<totalP){
			pagingHTML.append("<a href='/bbs/genderdogcompany.do?pg="+(startPage+pageBlock)+"'>["+"다음]</a>");
		}
	}
	
	//강아지 업체분양 메인 페이지 + 이름
		public void makePagingHTML3(Map<String, Object> map) {
			pagingHTML = new StringBuffer();//수정이 가능하도록 StringBuffer를 쓰도록하자
			ImageBoardDao imageBoardDao = ImageBoardDao.getInstance();
			System.out.println("paging에서 map 받음 : " + map.keySet());
			int totalA = imageBoardDao.getTotalArticle3(map);     // 총글수 가져오기
			System.out.println("총글수 : " + totalA);
			int totalP = (totalA + pageSize -1) / pageSize;   // 총페이지수
			//또는 int totalP=(int)Math.ceil((double)totalA/pageSize);
			//System.out.println(totalP+"  "+t);
			
			int startPage = ((int)((currentPage-1)/pageBlock)) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			
			if(endPage > totalP) {
				endPage = totalP;
			}
			
			if(startPage>pageBlock){			
				pagingHTML.append("<a href='/bbs/dognamedogcompany.do?pg="+(startPage-pageBlock)+"'>["+"이전]</a>");
			}		
			
			for(int i=startPage;i<=endPage;i++){
				if(currentPage==i){
					pagingHTML.append("<a href='/bbs/dognamedogcompany.do?pg="+i+"'><font color=red>["+ i+ "]</font></a>");
				
				}else{
					pagingHTML.append("<a href='/bbs/dognamedogcompany.do?pg="+i+"'>["+i+"]</a>");
				}
			}
					
			if(endPage<totalP){
				pagingHTML.append("<a href='/bbs/dognamedogcompany.do?pg="+(startPage+pageBlock)+"'>["+"다음]</a>");
			}
		}

		//강아지 업체분양 메인 페이지 + 가격내림차순
		public void makePagingHTML4() {
			pagingHTML = new StringBuffer();//수정이 가능하도록 StringBuffer를 쓰도록하자
			ImageBoardDao imageBoardDao = ImageBoardDao.getInstance();
			int totalA = imageBoardDao.getTotalArticle();     // 총글수 가져오기
			System.out.println("총글수 : " + totalA);
			int totalP = (totalA + pageSize -1) / pageSize;   // 총페이지수
			//또는 int totalP=(int)Math.ceil((double)totalA/pageSize);
			//System.out.println(totalP+"  "+t);
			
			int startPage = ((int)((currentPage-1)/pageBlock)) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			
			if(endPage > totalP) {
				endPage = totalP;
			}
			
			if(startPage>pageBlock){			
				pagingHTML.append("<a href='/bbs/pricedowndogcompany.do?pg="+(startPage-pageBlock)+"'>["+"이전]</a>");
			}		
			
			for(int i=startPage;i<=endPage;i++){
				if(currentPage==i){
					pagingHTML.append("<a href='/bbs/pricedowndogcompany.do?pg="+i+"'><font color=red>["+ i+ "]</font></a>");
				
				}else{
					pagingHTML.append("<a href='/bbs/pricedowndogcompany.do?pg="+i+"'>["+i+"]</a>");
				}
			}
					
			if(endPage<totalP){
				pagingHTML.append("<a href='/bbs/pricedowndogcompany.do?pg="+(startPage+pageBlock)+"'>["+"다음]</a>");
			}
		}

		//강아지 업체분양 메인 페이지 + 높은가격
		public void makePagingHTML5() {
			pagingHTML = new StringBuffer();//수정이 가능하도록 StringBuffer를 쓰도록하자
			ImageBoardDao imageBoardDao = ImageBoardDao.getInstance();
			int totalA = imageBoardDao.getTotalArticle();     // 총글수 가져오기
			System.out.println("총글수 : " + totalA);
			int totalP = (totalA + pageSize -1) / pageSize;   // 총페이지수
			//또는 int totalP=(int)Math.ceil((double)totalA/pageSize);
			//System.out.println(totalP+"  "+t);
			
			int startPage = ((int)((currentPage-1)/pageBlock)) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			
			if(endPage > totalP) {
				endPage = totalP;
			}
			
			if(startPage>pageBlock){			
				pagingHTML.append("<a href='/bbs/priceupdogcompany.do?pg="+(startPage-pageBlock)+"'>["+"이전]</a>");
			}		
			
			for(int i=startPage;i<=endPage;i++){
				if(currentPage==i){
					pagingHTML.append("<a href='/bbs/priceupdogcompany.do?pg="+i+"'><font color=red>["+ i+ "]</font></a>");
				
				}else{
					pagingHTML.append("<a href='/bbs/priceupdogcompany.do?pg="+i+"'>["+i+"]</a>");
				}
			}
					
			if(endPage<totalP){
				pagingHTML.append("<a href='/bbs/priceupdogcompany.do?pg="+(startPage+pageBlock)+"'>["+"다음]</a>");
			}
		}		
	public String getPagingHTML() {
		return pagingHTML.toString();
	}	
}
