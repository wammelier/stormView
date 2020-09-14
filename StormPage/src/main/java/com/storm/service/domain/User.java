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
	private String userPosition; // 청년직책 ('0' = 일 '1' = 리더)
	private Timestamp signRegDate; // 홈페이지 가입일시
	private Timestamp registoreRegDate; // 관리자가 유저 등록일시
	private String signupFlag; // 어플 가입여부 플래그 ('0' = 가입안됨, '1' = 가입됨)
	private String userRole; // 사이트내 직책 '0' = 일반회원, '1' = 관리자
	private String userDeleted; // 재명여부 '0' = 일반회원, '1' = 재명회

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

	public String getUserPosition() {
		return userPosition;
	}

	public void setUserPosition(String userPosition) {
		this.userPosition = userPosition;
	}

	public Timestamp getSignRegDate() {
		return signRegDate;
	}

	public void setSignRegDate(Timestamp signRegDate) {
		this.signRegDate = signRegDate;
	}

	public Timestamp getRegistoreRegDate() {
		return registoreRegDate;
	}

	public void setRegistoreRegDate(Timestamp registoreRegDate) {
		this.registoreRegDate = registoreRegDate;
	}

	public String getSignupFlag() {
		return signupFlag;
	}

	public void setSignupFlag(String signupFlag) {
		this.signupFlag = signupFlag;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getUserDeleted() {
		return userDeleted;
	}

	public void setUserDeleted(String userDeleted) {
		this.userDeleted = userDeleted;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", nickName=" + nickName
				+ ", email=" + email + ", gender=" + gender + ", phone=" + phone + ", birth=" + birth + ", userImg="
				+ userImg + ", address=" + address + ", leaderName=" + leaderName + ", baptismName=" + baptismName
				+ ", userPosition=" + userPosition + ", signRegDate=" + signRegDate + ", registoreRegDate="
				+ registoreRegDate + ", signupFlag=" + signupFlag + ", userRole=" + userRole + ", userDeleted="
				+ userDeleted + "]";
	}
	

}