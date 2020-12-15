package com.ib.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.ib.dto.IbDTO;
import com.ib.entity.ImageBoardEntity;

public class ImageBoardDao {
	private static ImageBoardDao instance;
	private static SqlSessionFactory factory;
	
	//Mybatis연결객체 생성--------------------------------------
	static {
		try {
			String resource="mybatis/mybatis-config.xml";
			Reader reader=Resources.getResourceAsReader(resource);
			factory=new SqlSessionFactoryBuilder().build(reader);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	//dao 객체를 한번만 생성해서 사용(singleton방식)-------------------- 
	public static ImageBoardDao getInstance() {
		if(instance==null) {
			synchronized (ImageBoardDao.class) {  //동기화 처리
				instance=new ImageBoardDao();
			}
		}
		return instance;
	}
	//---------------------------------------------------------
	public int imageBoardInsert(IbDTO dto) {
		SqlSession session=factory.openSession();
		int n=0;
		System.out.println("Dao 들어옴");
		try{                 
			n=session.insert("mybatis.IbMapper.imageBoardInsert", dto);
			System.out.println("DAO : " + n);
			if(n > 0)
				session.commit();
		}catch(Exception e){
			e.printStackTrace();
			session.rollback();
		}finally{
			session.close();
		}
		return n;
	}
	//---------------------------------------------------------
	public int getTotalArticle() {   //총 게시물의 갯수
		SqlSession session=factory.openSession();
		int n=session.selectOne("mybatis.ImageBoardMapper.getTotalArticle");
		session.close();
		return n;
	}
	//--------------------------------------------------------
	public List<ImageBoardEntity> getImageBoardList(Map<String, Object> map) {
		SqlSession session=factory.openSession();
		List<ImageBoardEntity> list=session.selectList("mybatis.ImageBoardMapper.getImageBoardList", map);
		session.close();
		return list;
	}
	//--------------------------------------------------------
	public List<ImageBoardEntity> getImagePath(List<Integer> list) {
		SqlSession session=factory.openSession();
		List<ImageBoardEntity> imgPathList
		          =session.selectList("mybatis.ImageBoardMapper.getImagePath", list);
		session.close();
		return imgPathList;
	}
	//--------------------------------------------------------
	public int imageBoardDelete(List<Integer> list) {
		int n=0;
		SqlSession session=factory.openSession();
		
		try {
			n=session.delete("mybatis.ImageBoardMapper.imageBoardDelete",list);
			if(n > 0)
				session.commit();
		}catch(Exception e) {
			session.rollback();
		}finally{
			session.close();
		}
		return n;
	}

	

}








