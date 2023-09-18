package com.green.domain;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	
	private String
	MEM_NO,
	MEM_NAME,
	MEM_ID,
	MEM_PW,
	MEM_DATE,
	MEM_PHONE,
	MEM_MAIL,
	MEM_TEL,
	MEM_ADD,
	MEM_BIRTH,
	
	LEV_NO,
	LEV_LEVEL
	;
	
	private MultipartFile fileName;

	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getMEM_NO() {
		return MEM_NO;
	}

	public String getMEM_NAME() {
		return MEM_NAME;
	}

	public String getMEM_ID() {
		return MEM_ID;
	}

	public String getMEM_PW() {
		return MEM_PW;
	}

	public String getMEM_DATE() {
		return MEM_DATE;
	}

	public String getMEM_PHONE() {
		return MEM_PHONE;
	}

	public String getMEM_MAIL() {
		return MEM_MAIL;
	}

	public String getMEM_TEL() {
		return MEM_TEL;
	}

	public String getMEM_ADD() {
		return MEM_ADD;
	}

	public String getMEM_BIRTH() {
		return MEM_BIRTH;
	}

	public String getLEV_NO() {
		return LEV_NO;
	}

	public String getLEV_LEVEL() {
		return LEV_LEVEL;
	}

	public void setMEM_NO(String mEM_NO) {
		MEM_NO = mEM_NO;
	}

	public void setMEM_NAME(String mEM_NAME) {
		MEM_NAME = mEM_NAME;
	}

	public void setMEM_ID(String mEM_ID) {
		MEM_ID = mEM_ID;
	}

	public void setMEM_PW(String mEM_PW) {
		MEM_PW = mEM_PW;
	}

	public void setMEM_DATE(String mEM_DATE) {
		MEM_DATE = mEM_DATE;
	}

	public void setMEM_PHONE(String mEM_PHONE) {
		MEM_PHONE = mEM_PHONE;
	}

	public void setMEM_MAIL(String mEM_MAIL) {
		MEM_MAIL = mEM_MAIL;
	}

	public void setMEM_TEL(String mEM_TEL) {
		MEM_TEL = mEM_TEL;
	}

	public void setMEM_ADD(String mEM_ADD) {
		MEM_ADD = mEM_ADD;
	}

	public void setMEM_BIRTH(String mEM_BIRTH) {
		MEM_BIRTH = mEM_BIRTH;
	}

	public void setLEV_NO(String lEV_NO) {
		LEV_NO = lEV_NO;
	}

	public void setLEV_LEVEL(String lEV_LEVEL) {
		LEV_LEVEL = lEV_LEVEL;
	}

	public MultipartFile getFileName() {
		return fileName;
	}

	public void setFileName(MultipartFile fileName) {
		this.fileName = fileName;
	}
	
}
