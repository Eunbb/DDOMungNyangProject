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

	// Mybatis연결객체 생성--------------------------------------
	static {
		try {
			String resource = "mybatis/mybatis-config.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// dao 객체를 한번만 생성해서 사용(singleton방식)--------------------
	public static ImageBoardDao getInstance() {
		if (instance == null) {
			synchronized (ImageBoardDao.class) { // 동기화 처리
				instance = new ImageBoardDao();
			}
		}
		return instance;
	}

	// ---------------------------------------------------------
	public int imageBoardInsert(IbDTO dto) {
		SqlSession session = factory.openSession();
		int n = 0;
		System.out.println("Dao 들어옴");
		try {
			n = session.insert("mybatis.IbMapper.imageBoardInsert", dto);
			System.out.println("DAO : " + n);
			if (n > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return n;
	}

	// BoardDAO에서 가져온거
	// ---------------------------------------------------------
	public int getTotalArticle() { // 총 게시물의 갯수
		SqlSession session = factory.openSession();
		int n = session.selectOne("mybatis.IbMapper.getTotalArticle");
		session.close();
		return n;
	}

	// ------------------------------------------------------------------------글
	// 강아지 업체분양
	public List<IbDTO> getImageList(Map<String, Object> map) {
		SqlSession session = factory.openSession();
		List<IbDTO> list = session.selectList("mybatis.IbMapper.getImageList", map);
		session.close();
		return list;
	}

	// 강아지 업체분양(+Top3)
	public List<IbDTO> getImageTopList() {
		SqlSession session = factory.openSession();
		List<IbDTO> list = session.selectList("mybatis.IbMapper.getImageTopList");
		session.close();
		return list;
	}
	
	// 강아지 개인분양
	public List<IbDTO> getImageList2(Map<String, Object> map) {
		SqlSession session = factory.openSession();
		List<IbDTO> list = session.selectList("mybatis.IbMapper.getImageList2", map);
		session.close();
		return list;
	}

	// 강아지 유기분양
	public List<IbDTO> getImageList3(Map<String, Object> map) {
		SqlSession session = factory.openSession();
		List<IbDTO> list = session.selectList("mybatis.IbMapper.getImageList3", map);
		session.close();
		return list;
	}

	// 고양이업체분양
	public List<IbDTO> getImageList4(Map<String, Object> map) {
		SqlSession session = factory.openSession();
		List<IbDTO> list = session.selectList("mybatis.IbMapper.getImageList4", map);
		session.close();
		return list;
	}

	// 고양이 개인분양
	public List<IbDTO> getImageList5(Map<String, Object> map) {
		SqlSession session = factory.openSession();
		List<IbDTO> list = session.selectList("mybatis.IbMapper.getImageList5", map);
		session.close();
		return list;
	}

	// 고양이 유기분양
	public List<IbDTO> getImageList6(Map<String, Object> map) {
		SqlSession session = factory.openSession();
		List<IbDTO> list = session.selectList("mybatis.IbMapper.getImageList6", map);
		session.close();
		return list;
	}

	// petid에 해당하는 데이터 가져오기-----------------------------------------------------
	public IbDTO getDog(int petid) {
		SqlSession session = factory.openSession();
		IbDTO dto = session.selectOne("mybatis.IbMapper.getDog", petid);
		session.close();
		return dto;
	}

	// 삭제하기-------------------------------------------
	public void dogDelete(int petid) {
		// 게시글 삭제
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.delete("mybatis.IbMapper.dogDelete", petid);
			if (n > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}

	}

	// 수정하기-----------------------------------------------------------------------
	public void dogUpdate(IbDTO dto) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.update("mybatis.IbMapper.dogUpdate", dto);
			if (n > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	// 여기서 부터는 가져온거 imageBoard에서
	// --------------------------------------------------------
	public List<ImageBoardEntity> getImagePath(List<Integer> list) {
		SqlSession session = factory.openSession();
		List<ImageBoardEntity> imgPathList = session.selectList("mybatis.ImageBoardMapper.getImagePath", list);
		session.close();
		return imgPathList;
	}

	// --------------------------------------------------------
	public int imageBoardDelete(List<Integer> list) {
		int n = 0;
		SqlSession session = factory.openSession();

		try {
			n = session.delete("mybatis.ImageBoardMapper.imageBoardDelete", list);
			if (n > 0)
				session.commit();
		} catch (Exception e) {
			session.rollback();
		} finally {
			session.close();
		}
		return n;
	}

}
