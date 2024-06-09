package com.aesop.biz;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aesop.domain.Member;
import com.aesop.per.MemberMapper;

@Service
public class MemberService implements MemberBiz {

	@Autowired
	private MemberMapper memberDAO;
	
	@Override
	public List<Member> getMemberList() {
		return memberDAO.getMemberList();
	}

	@Override
	public Member getMember(String email) {		
		return memberDAO.getMember(email);
	}

	@Override
	public int memberCount() {
		return memberDAO.memberCount();
	}

	@Override
	public void insMember(Member member) {
		memberDAO.insMember(member);
	}

	@Override
	public void changePw(Member member) {
		 memberDAO.changePw(member);
		
	}

	@Override
	public void changeInfo(Member member) {
		 memberDAO.changeInfo(member);
		
	}

	@Override
	public void changePoint(Member member) {
		memberDAO.changePoint(member);
		
	}

	@Override
	public void delMember(String email) {
		memberDAO.delMember(email);
		
	}

	
	
}