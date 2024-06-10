package com.aesop.per;


import java.util.List;

import com.aesop.domain.Qna;




public interface QnaMapper {
	
	public int getTotalCount();
	public List<Qna> getQnaList();
	public Qna getQna(int no);
	public void hitsCount(int no);
	public void insQna(Qna qna);
	public void upQna(Qna qna);
	public void delQna(int no);

}