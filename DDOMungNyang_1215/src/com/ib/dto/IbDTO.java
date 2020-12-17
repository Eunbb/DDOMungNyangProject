package com.ib.dto;

public class IbDTO {
	private int petid;
	private String classify1;
	private String classify2;
	private String dogkortype;
	private String dogengtype;
	private String gender;
	private String age;
	private String price;
	private String jusa;
	private String pic; // 경로 
	private int heart;
	
	public IbDTO() {
		super();

	}

	

	public IbDTO(int petid, String classify1, String classify2, String dogkortype, String dogengtype, String gender,
			String age, String price, String jusa, String pic, int heart) {
		super();
		this.petid = petid;
		this.classify1 = classify1;
		this.classify2 = classify2;
		this.dogkortype = dogkortype;
		this.dogengtype = dogengtype;
		this.gender = gender;
		this.age = age;
		this.price = price;
		this.jusa = jusa;
		this.pic = pic;
		this.heart = heart;
	}



	public int getPetid() {
		return petid;
	}

	public void setPetid(int petid) {
		this.petid = petid;
	}

	public String getClassify1() {
		return classify1;
	}

	public void setClassify1(String classify1) {
		this.classify1 = classify1;
	}

	public String getClassify2() {
		return classify2;
	}

	public void setClassify2(String classify2) {
		this.classify2 = classify2;
	}

	public String getDogkortype() {
		return dogkortype;
	}

	public void setDogkortype(String dogkortype) {
		this.dogkortype = dogkortype;
	}

	public String getDogengtype() {
		return dogengtype;
	}

	public void setDogengtype(String dogengtype) {
		this.dogengtype = dogengtype;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getJusa() {
		return jusa;
	}

	public void setJusa(String jusa) {
		this.jusa = jusa;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public int getHeart() {
		return heart;
	}

	public void setHeart(int heart) {
		this.heart = heart;
	}
	
}
