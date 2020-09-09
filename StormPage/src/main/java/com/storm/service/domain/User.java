package com.storm.service.domain;

import java.sql.Timestamp;

public class User {

	private String userId;
	private String userPwd;
	private String userName;
	private String nickName;
	private String email;
	private String gender;
	private String phone;
	private String birth;
	private String userImg;
	private String address;
	private String leaderName; // 울타리리더이름
	private String baptismName; // 세례종류('0' = 없음, '1' = 세례, '2'=입교, '3' = 유아세례
	private String signRegDate;
	private String userRole; // 사이트내 직책 '0' = 일반회원, '1' = 관리자
	private String userPostion; // 청년부내 직책 '0' = 일반청년, '1' = 리더
	private Timestamp userDeleted; // 재명여부 '0' = 일반회원, '1' = 재명회

	public User() {

	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLeaderName() {
		return leaderName;
	}

	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
	}

	public String getBaptismName() {
		return baptismName;
	}

	public void setBaptismName(String baptismName) {
		this.baptismName = baptismName;
	}

	public String getSignRegDate() {
		return signRegDate;
	}

	public void setSignRegDate(String signRegDate) {
		this.signRegDate = signRegDate;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getUserPostion() {
		return userPostion;
	}

	public void setUserPostion(String userPostion) {
		this.userPostion = userPostion;
	}

	public Timestamp getUserDeleted() {
		return userDeleted;
	}

	public void setUserDeleted(Timestamp userDeleted) {
		this.userDeleted = userDeleted;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", nickName=" + nickName
				+ ", email=" + email + ", gender=" + gender + ", phone=" + phone + ", birth=" + birth + ", userImg="
				+ userImg + ", address=" + address + ", leaderName=" + leaderName + ", baptismName=" + baptismName
				+ ", signRegDate=" + signRegDate + ", userRole=" + userRole + ", userPostion=" + userPostion
				+ ", userDeleted=" + userDeleted + "]";
	}
	

}
