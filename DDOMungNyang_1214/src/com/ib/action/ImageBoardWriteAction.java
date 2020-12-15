package com.ib.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ib.dao.ImageBoardDao;
import com.ib.entity.ImageBoardEntity;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ImageBoardWriteAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//실제 저장 경로
		String realFolder=request.getServletContext().getRealPath("/storage");
		//System.out.println("저장 폴더:" + realFolder);
		
		//파일업로드
		MultipartRequest multi=new MultipartRequest(
                request, realFolder, 5*1024*1024, "UTF-8",new DefaultFileRenamePolicy());
		
		//데이터 얻어오기
		String classify1=multi.getParameter("classify1");
		String classify2=multi.getParameter("classify2");
		String dogkortype=multi.getParameter("dogkortype");
		String dogengtype=multi.getParameter("dogengtype");
		String gender=multi.getParameter("gender");
		String age=multi.getParameter("age");
		String price=multi.getParameter("price");
		String jusa=multi.getParameter("jusa");
		String pic=multi.getParameter("pic");
		
		//데이터 저장
		ImageBoardEntity entity=new ImageBoardEntity();
		//entity.setPetid(petid)
		entity.setClassify1(classify1);
		entity.setClassify2(classify2);
		entity.setDogkortype(dogkortype);
		entity.setDogengtype(dogengtype);
		entity.setGender(gender);
		entity.setAge(age);
		entity.setPrice(price);
		entity.setJusa(jusa);
		entity.setPic(pic);
		
		//DB-insert
		ImageBoardDao dao=ImageBoardDao.getInstance();
		int n=dao.imageBoardInsert(entity);
		
		if(n>0)
			return "dogboard/imageBoardWriteOk.html";
		else
			return "dogboard/imageBoardWrite.html";
	}
}








