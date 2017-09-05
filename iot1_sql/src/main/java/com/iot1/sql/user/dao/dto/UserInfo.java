package com.iot1.sql.user.dao.dto;

import org.springframework.stereotype.Component;

@Component
public class UserInfo {
	private int userNum;
	private String userId;
	private String userName;
	private int age;
	private String address;
	private String hp1;
	private String hp2;
	private String hp3;
	private String userPwd;
	private int departNum;
	private String userRoleLevel;
	private char gender;
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public int getDepartNum() {
		return departNum;
	}
	public void setDepartNum(int departNum) {
		this.departNum = departNum;
	}
	public String getUserRoleLevel() {
		return userRoleLevel;
	}
	public void setUserRoleLevel(String userRoleLevel) {
		this.userRoleLevel = userRoleLevel;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "UserInfo [userNum=" + userNum + ", userId=" + userId + ", userName=" + userName + ", age=" + age
				+ ", address=" + address + ", hp1=" + hp1 + ", hp2=" + hp2 + ", hp3=" + hp3 + ", userPwd=" + userPwd
				+ ", departNum=" + departNum + ", userRoleLevel=" + userRoleLevel + ", gender=" + gender + "]";
	}

}