package com.ib.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ib.dao.ImageBoardDao;
import com.ib.dto.IbDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import controller.CommandAction;

public class ImageBoardWriteAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		System.out.println("IW 들어옴");
		
		//실제 저장 경로
//		String uploadDir =this.getClass().getResource("").getPath();
//		uploadDir = uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"DDOMungNyangProject/DDOMungNyang_1215/WebContent/uploadImage";
//
//		System.out.println("절대경로 : " + uploadDir + "<br/>"); 
		
		
//		String realFolder=request.getServletContext().getRealPath("/storage");
		//System.out.println("저장 폴더:" + realFolder);
		
		String realFolder=request.getSession().getServletContext().getRealPath("/storage");
		//System.out.println("저장 폴더:" + realFolder);
		
		
		//파일업로드
		MultipartRequest multi=new MultipartRequest(
                request, realFolder, 100* 1024 * 1024 , "UTF-8",new DefaultFileRenamePolicy());
		
		
		
		//데이터 얻어오기
		String classify1=multi.getParameter("classify1"); // 강아지 고양이
		System.out.println("classify1 "+classify1);
		String classify2=multi.getParameter("classify2");  // 분양
		System.out.println("classify2 "+classify2);
		String dogkortype=multi.getParameter("kortype"); // 종류
		System.out.println("dogkortype " + dogkortype);
		String dogengtype=multi.getParameter("engtype");
		System.out.println("dogengtype " +dogengtype);
		String gender=multi.getParameter("sex");  //성별
		System.out.println("gender " + gender);
		String age=multi.getParameter("age"); //나이
		System.out.println("age " + age);
		String price=multi.getParameter("price"); // 가격
		System.out.println("price " + price);
		String jusa=multi.getParameter("jusaType");
		System.out.println("jusa " +jusa);
		String pic=multi.getFilesystemName("imagepath"); //  사진
		
		System.out.println("pic " + pic);
		int heart=0; //  인기도
		
		//데이터 저장
		IbDTO dto=new IbDTO();
		//entity.setPetid(petid)
		dto.setClassify1(classify1);
		System.out.println(dto.getClassify1());
		dto.setClassify2(classify2);
		dto.setDogkortype(dogkortype);
		dto.setDogengtype(dogengtype);
		dto.setGender(gender);
		dto.setAge(age);
		dto.setPrice(price);
		dto.setJusa(jusa);
		dto.setPic(pic);
		dto.setHeart(heart);
		
		//DB-insert
//		ImageBoardDao dao=ImageBoardDao.getInstance();
		ImageBoardDao dao= new ImageBoardDao();
		int n=dao.imageBoardInsert(dto);
		System.out.println("다오에서 온 n : " + n);
		
		if(n>0) {
			System.out.println("ok");
			return "dogboard/imageBoardWriteOk.html";}
			
		else {
			System.out.println("fail");
			return "dogboard/imageBoardWrite.html";
		}
		}
}
