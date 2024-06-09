package com.aesop.per;

import java.util.List;

import com.aesop.domain.Member;

public interface MemberMapper {

	
	public List<Member> getMemberList();
	public Member getMember(String email);
	public int memberCount();
	public void insMember(Member member);
	public void changePw(Member member);
	public void changeInfo(Member member);
	public void changePoint(Member member);
	public void delMember(String email);
	
	
}