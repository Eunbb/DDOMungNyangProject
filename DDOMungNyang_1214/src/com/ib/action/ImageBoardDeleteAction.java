package com.ib.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ib.dao.ImageBoardDao;
import com.ib.entity.ImageBoardEntity;


public class ImageBoardDeleteAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int page=Integer.parseInt(request.getParameter("pg"));
		String []str=request.getParameterValues("idx");  // [9, 8, 7]  
		
		if(str==null) {
			request.setAttribute("pg", page);
			request.setAttribute("result", str);
			return "imgboard/imageBoardDeleteOK.jsp";
		}
		
		List<Integer> list=new ArrayList<>();
		
		for(String temp : str)
		{
			list.add(Integer.parseInt(temp));
		}
		
		ImageBoardDao dao=ImageBoardDao.getInstance();		
		
		// storage 폴더의 파일 삭제------------------------------------
		List<ImageBoardEntity> imgPathList=dao.getImagePath(list);
		String realFolder=request.getServletContext().getRealPath("/storage");
		
		
		// 데이타베이스의 데이타삭제-------------------------------------
		int n=dao.imageBoardDelete(list);
		
		if(n > 0)
		{
			for(ImageBoardEntity entity : imgPathList){
				String path=realFolder + "/" + entity.getPic();
				if(fileIsLive(path)){
					fileDelete(path);
				}else{
					System.out.println("파일이 존재하지 않습니다");
				}
			}
			//request객체에 담기--------------------
			request.setAttribute("pg", page);
			//------------------------------------
			return "imgboard/imageBoardDeleteOK.jsp";
			
		}else{
			return "imgBoardList.do?pg=" + page;
		}	
	}
	
	//파일의 존재 여부를 확인하는 메서드---------------------------------
	public boolean fileIsLive(String isLiveFile){
		boolean existFile=false;
		
		try{
			File file=new File(isLiveFile);
			if(file.exists())
				existFile=true;
		}catch(Exception e){
			e.printStackTrace();
		}		
		return existFile;
	}
	//파일을 삭제하는 메서드--------------------------------------------
	public void fileDelete(String fileName){
		try{
			File file =new File(fileName);
			file.delete();
		}catch(Exception e){
			System.out.println("파일삭제가 실패 하였습니다");
		}
	}	
}













