package com.login.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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
			System.out.println("signUp 들어옴");
			n = session.insert("mybatis.LoginMapper.signUp", dto);
			System.out.println(n + "DAO");
			if (n > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ㅋㅋ 에러ㄸㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷ");
			session.rollback();
		} finally {
			session.close();
		}
		return n;
	}



}
