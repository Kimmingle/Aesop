package com.aesop.biz;

import java.util.List;

import com.aesop.domain.Qna;

public interface QnaBiz {
	
	
	public int getTotalCount();
	public List<Qna> getQnaList();
	public Qna getQna(int no);
	public void countQna(int no);  //조회수
	public void insQna(Qna qna);
	public void upQna(Qna qna);
	public void delQna(int no);

}
