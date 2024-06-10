package com.aesop.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aesop.domain.Qna;
import com.aesop.per.QnaMapper;

@Service
public class QnaService implements QnaBiz {
	
	@Autowired 
	private QnaMapper QnaDAO;

	@Override
	public int getTotalCount() {
		return QnaDAO.getTotalCount();
	}

	@Override
	public List<Qna> getQnaList() {
		return QnaDAO.getQnaList();
	}

	//조회수+상세보기
	@Transactional
	@Override
	public Qna getQna(int no) {
		QnaDAO.hitsCount(no);
		return QnaDAO.getQna(no);
	}
	
	//조회수만
	@Override
	public void countQna(int no) {
		QnaDAO.hitsCount(no);
	}

	@Override
	public void insQna(Qna qna) {
		QnaDAO.insQna(qna);
	}

	@Override
	public void upQna(Qna qna) {
		QnaDAO.upQna(qna);
	}

	@Override
	public void delQna(int no) {
		QnaDAO.delQna(no);
	}

	
	
}
	
	
	
	
	
	
	
	
//	//CRUD
//	void qna_insert(QnaVO vo); 		//글 저장
//	List<QnaVO> qna_list();			//목록 조회
//	QnaPage qna_list(QnaPage page);	//페이지 처리 된 공지글 목록 조회
//	QnaVO qna_detail(int id);		//상세 조회
//	void qna_update(QnaVO vo);		//글 수정
//	void qna_delete(int id);		//글 삭제
//	void qna_read(int id);			//조회수 증가 처리
//	void qna_reply_insert(QnaVO vo);//답글 저장
