package com.login.dto;

//기본생성자, 인자4개받는 생성자, setter & getter
public class LoginDTO {
	private String id;
	private String pw;
	private String repw;
	private String name;
	private String nick;
	private String birth;
		
	
	public LoginDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LoginDTO(String id, String pw, String repw, String name, String nick, String birth
			) {
		super();
		this.id = id;
		this.pw = pw;
		this.repw = repw;
		this.name = name;
		this.nick = nick;
		this.birth = birth;
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getRepw() {
		return repw;
	}

	public void setRepw(String repw) {
		this.repw = repw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	
	
}
