package com.board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.board.dto.BoardDTO;
import com.ib.dto.IbDTO;

public class BoardDAO {
	private static SqlSessionFactory factory;
	private static BoardDAO instance;
	
	static{
		try{
			String resource="mybatis/mybatis-config.xml";
			Reader reader=Resources.getResourceAsReader(resource);
			factory=new SqlSessionFactoryBuilder().build(reader);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	//----------------------------------------------------------------
	public static BoardDAO getInstance() {
		if(instance == null) {
			synchronized (BoardDAO.class) {
				instance=new BoardDAO();
			}
		}
		return instance;
	}
	//----------------------------------------------------------------
	public int getTotalArticle() {   // 총 게시물수
		SqlSession session=factory.openSession();
		int n=session.selectOne("mybatis.BoardMapper.getTotalArticle");
		session.close();
		return n;
	}
	//-----------------------------------------------------------------
	public int boardInsert(BoardDTO dto) {
		SqlSession session=factory.openSession();
		int n=0;
		try{
			n=session.insert("mybatis.BoardMapper.boardInsert", dto);
			if(n > 0)
				session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		return n;
	}
	//--------------------------------------------------------------------------
	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		SqlSession session=factory.openSession();
		List<BoardDTO> list=session.selectList("mybatis.BoardMapper.getBoardList",map);
		session.close();
		return list;
	}
	//조회수----------------------------------------------------------------------
	public void updateHit(int seq) {
		SqlSession session=factory.openSession();
		int n=0;
		try{
			n=session.update("mybatis.BoardMapper.updateHit",seq);
			if(n > 0)
				session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
	}
	//seq에 해당하는 데이터 가져오기-----------------------------------------------------
	public BoardDTO getBoard(int seq) {
		SqlSession session=factory.openSession();
		BoardDTO dto=session.selectOne("mybatis.BoardMapper.getBoard",seq);
		session.close();
		return dto;
	}

	//수정하기-----------------------------------------------------------------------
	public void boardUpdate(BoardDTO dto) {
		SqlSession session=factory.openSession();
		int n=0;
		try{
			n=session.update("mybatis.BoardMapper.boardUpdate",dto);
			if(n > 0)
				session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
	}

	//삭제하기-------------------------------------------
	public void boardDelete(int seq) {
		//2,3번은 "답글달기" 먼저 한 후 추가하기
		SqlSession session=factory.openSession();
		int n=0;
		
		try{
			n=session.update("mybatis.BoardMapper.boardReplyMinus",seq);
			if(n > 0)
				session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		//원글이 삭제된 답글이 남아있음------------------
		session=factory.openSession();
		n=0;
		
		try{
			n=session.update("mybatis.BoardMapper.boardOriginalDelete",seq);
			if(n > 0)
				session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		
		//게시글 삭제
		session=factory.openSession();
		n=0;
		try{
			n=session.delete("mybatis.BoardMapper.boardDelete",seq);
			if(n > 0)
				session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		
	}
	
   //답글 달기----------------------------------------------------
   public void boardReply(BoardDTO dto) {
      BoardDTO pDto=this.getBoard(dto.getPseq());   //원글
      
      //step(글순서): update-------------
      SqlSession session=factory.openSession();
      int n=0;
      
      Map<String,Integer> map=new HashMap<>();
      map.put("ref",pDto.getRef());
      map.put("step",pDto.getStep());
      
      try {
         n=session.update("mybatis.BoardMapper.boardUpdateStep", map);
         
         if(n > 0)
            session.commit();
      }catch(Exception e) {
         e.printStackTrace();
         session.rollback();
      }finally {
         session.close();
      }

      //답글추가----------------------------------
      session=factory.openSession();
      n=0;
      
      try {
         dto.setRef(pDto.getRef());       //그룹번호
         dto.setLev(pDto.getLev()+1);     //단계(들여쓰기)
         dto.setStep(pDto.getStep()+1);   //글순서
         dto.setSeq(pDto.getSeq());       //원글 번호
         
         n=session.insert("mybatis.BoardMapper.boardReplyInsert", dto);
         if(n>0)
            session.commit();
      }catch(Exception e) {
         e.getSuppressed();
         session.rollback();
      }finally {
         session.close();
      }
      
      //reply(답변수): update---------------------
      session=factory.openSession();
      n=0;
      
      try {
         int seq=pDto.getSeq();
         n=session.update("mybatis.BoardMapper.boardUpdateReply",seq);
         
         if(n > 0)
            session.commit();
      }catch(Exception e) {
         e.printStackTrace();
         session.rollback();
      }finally {
         session.close();
      }
   }
 
   
 //--------------------------------------------imageboard------------------------------------------------------
 //------------------------------------------------------------------------글 등록했을때 불러오기
 	public List<IbDTO> getImageList(Map<String, Object> map) {
 		SqlSession session =factory.openSession();
 		List<IbDTO> list = session.selectList("mybatis.IbMapper.getImageList",map);
 		session.close();
 		return list;
 	}
 	
	//petid에 해당하는 데이터 가져오기-----------------------------------------------------
	public IbDTO getDog(int petid) {
		SqlSession session=factory.openSession();
		IbDTO dto=session.selectOne("mybatis.IbMapper.getDog",petid);
		session.close();
		return dto;
	}
}















