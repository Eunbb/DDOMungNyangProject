package com.login.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.board.dto.BoardDTO;
import com.ib.dto.IbDTO;
import com.login.dto.LoginDTO;

public class LoginDAO {
	private static SqlSessionFactory factory;

	static {
		try {
			String resource = "mybatis/mybatis-config.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
		}
	}

	// ----------------------------------------------------------------------
	public LoginDTO getLoginUser(String id, String pw) {
		SqlSession session = factory.openSession();
		LoginDTO dto = new LoginDTO(id, pw, "", "", "", "");
		LoginDTO entity = session.selectOne("mybatis.LoginMapper.getLoginUser", dto);
		session.close();
		return entity;
	}

	//전체 member 가져오기
	public List<LoginDTO> getMemberList() {
		SqlSession session = factory.openSession();
		List<LoginDTO> list = session.selectList("mybatis.LoginMapper.getMember");
		session.close();
		return list;
	}	
	
	//id로 데이터검색해서 가져오기
	public LoginDTO getLoginData(String id) {
		SqlSession session = factory.openSession();
		LoginDTO entity = session.selectOne("mybatis.LoginMapper.getLoginData", id);
		session.close();
		return entity;
	}

	
	public int signUp(LoginDTO dto) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.insert("mybatis.LoginMapper.signUp", dto);
			if (n > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return n;
	}

	//회원정보 수정하기-----------------------------------------------------------------------
	public void getLoginModify(LoginDTO dto) {
		SqlSession session=factory.openSession();
		int n=0;
		try{
			n=session.update("mybatis.LoginMapper.loginmodify",dto);
			if(n > 0)
				session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
	}
	//멤버 삭제하기(관리자만)-------------------------------------------
	public void memberDelete(String id) {
		SqlSession session=factory.openSession();
		int n=0;

		try{
			n=session.delete("mybatis.LoginMapper.memberDelete",id);
			if(n > 0)
				session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		
	}

}
