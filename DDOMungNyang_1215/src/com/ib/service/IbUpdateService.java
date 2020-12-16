package com.ib.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTMLDocument.HTMLReader.ParagraphAction;

import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;
import com.ib.dao.ImageBoardDao;
import com.ib.dto.IbDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.CommandAction;

public class IbUpdateService implements CommandAction {

   @Override
   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

      // 실제 저장 경로
//      String uploadDir = this.getClass().getResource("").getPath();
//      uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata"))
//            + "DDOMungNyangProject/DDOMungNyang_1215/WebContent/uploadImage";

//      System.out.println("절대경로 : " + uploadDir);

//      String realFolder=request.getServletContext().getRealPath("/storage");
      // System.out.println("저장 폴더:" + realFolder);

//      String path=getServletContext().getRealPath("/storage");
//      
//      // 파일업로드
//      MultipartRequest multi = new MultipartRequest(request, uploadDir, 1024 * 1024 * 100, "UTF-8",
//            new DefaultFileRenamePolicy());
      
      //실제 저장 경로
            String realFolder=request.getServletContext().getRealPath("/storage");
            //System.out.println("저장 폴더:" + realFolder);
            
            //파일업로드
            MultipartRequest multi=new MultipartRequest(
                      request, realFolder, 5*1024*1024, "UTF-8",new DefaultFileRenamePolicy());

      // 데이터 얻어오기
      request.setCharacterEncoding("UTF-8");
      int pg = Integer.parseInt(request.getParameter("pg"));
      int petid = Integer.parseInt(request.getParameter("petid"));
      String classify1 = multi.getParameter("classify1"); // 강아지 고양이
      System.out.println("classify1 " + classify1);
      String classify2 = multi.getParameter("classify2"); // 분양
      System.out.println("classify2 " + classify2);
      String dogkortype = multi.getParameter("dogkortype"); // 종류
      System.out.println("dogkortype " + dogkortype);
      String dogengtype = multi.getParameter("dogengtype");
      System.out.println("dogengtype " + dogengtype);
      String gender = multi.getParameter("gender"); // 성별
      System.out.println("gender " + gender);
      String age = multi.getParameter("age"); // 나이
      System.out.println("age " + age);
      String price = multi.getParameter("price"); // 가격
      System.out.println("price " + price);
      String jusa = multi.getParameter("jusa");
      System.out.println("jusa " + jusa);
      String pic = multi.getFilesystemName("pic"); // 사진

      IbDTO dto = new IbDTO();
      dto.setPetid(petid);
      dto.setClassify1(classify1);
      dto.setClassify2(classify2);
      dto.setDogkortype(dogkortype);
      dto.setDogengtype(dogengtype);
      dto.setGender(gender);
      dto.setAge(age);
      dto.setPrice(price);
      dto.setJusa(jusa);
      dto.setPic(pic);

      // update DB
      ImageBoardDao dao = new ImageBoardDao();
      dao.dogUpdate(dto);

      request.setAttribute("pg", pg);

      return "dogboard/dogUpdate.jsp";
   }
}