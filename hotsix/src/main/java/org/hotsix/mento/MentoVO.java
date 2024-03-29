package org.hotsix.mento;

import java.util.Date;

import org.hotsix.member.MemberVO;

public class MentoVO extends MemberVO{
	
	private int mentoNo;
	private int memberNo;
	private String career;
	private int status;
	private String id;
	private int countWaiting;
	

	
	public int getCountWaiting() {
		return countWaiting;
	}

	public void setCountWaiting(int countWaiting) {
		this.countWaiting = countWaiting;
	}

	@Override
	public String getId() {
		return id;
	}

	@Override
	public void setId(String id) {
		this.id = id;
	}



	@Override
	public String getMenteeId() {
		// TODO Auto-generated method stub
		return super.getMenteeId();
	}

	@Override
	public void setMenteeId(String menteeId) {
		// TODO Auto-generated method stub
		super.setMenteeId(menteeId);
	}

	@Override
	public String getNickname() {
		// TODO Auto-generated method stub
		return super.getNickname();
	}
	@Override
	public void setNickname(String nickname) {
		// TODO Auto-generated method stub
		super.setNickname(nickname);
	}
	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return super.getName();
	}
	@Override
	public void setName(String name) {
		// TODO Auto-generated method stub
		super.setName(name);
	}
	@Override
	public String getLocation() {
		// TODO Auto-generated method stub
		return super.getLocation();
	}
	@Override
	public void setLocation(String location) {
		// TODO Auto-generated method stub
		super.setLocation(location);
	}
	@Override
	public Date getRegdate() {
		// TODO Auto-generated method stub
		return super.getRegdate();
	}
	@Override
	public void setRegdate(Date regdate) {
		// TODO Auto-generated method stub
		super.setRegdate(regdate);
	}
	@Override
	public Date getLogdate() {
		// TODO Auto-generated method stub
		return super.getLogdate();
	}
	@Override
	public void setLogdate(Date logdate) {
		// TODO Auto-generated method stub
		super.setLogdate(logdate);
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	public int getMentoNo() {
		return mentoNo;
	}
	public void setMentoNo(int mentoNo) {
		this.mentoNo = mentoNo;
	}
	@Override
	public int getMemberNo() {
		return memberNo;
	}
	@Override
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getCareer() {
		return career;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	
	
	
	

}
