package com.aesop.per;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aesop.domain.Qna;

@Repository
public class QnaDAO implements QnaMapper {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getTotalCount() {
		return sqlSession.selectOne("qna.getTotalCount") ;
	}

	@Override
	public List<Qna> getQnaList() {
		return sqlSession.selectList("qna.getQnaList") ;
	}
	
	@Override
	public Qna getQna(int no) {
		return sqlSession.selectOne("Qna.getQna", no);
	}

	@Override
	public void insQna(Qna qna) {
		sqlSession.insert("Qna.insQna", qna);
	}

	@Override
	public void upQna(Qna qna) {
		sqlSession.update("Qna.upQna", qna);
	}


	@Override
	public void delQna(int no) {
		sqlSession.delete("Qna.delQna", no);
	}

	@Override
	public void hitsCount(int no) {
		sqlSession.update("Qna.hitsCount", no);
		
	}
	
	
	
	



	

}