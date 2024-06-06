package com.aesop.per;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aesop.domain.Product;
import com.aesop.domain.ProductVO;

@Repository
public class ProductDAO  implements ProductMapper {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getTotalCount() {
		return sqlSession.selectOne("product.getTotalCount");
	}

	@Override
	public List<ProductVO> getProductList() {
		return sqlSession.selectList("product.getProductList");
	}

	@Override
	public List<ProductVO> getCategoryList(String category) {
		return sqlSession.selectList("product.getCategoryList", category);
	}

	@Override
	public ProductVO getProduct(int pno) {
		return sqlSession.selectOne("product.getProduct", pno);
	}

	@Override
	public void insProduct(Product product) {
		sqlSession.insert("product.insProduct", product);
	}

	@Override
	public void upProduct(Product product) {
		sqlSession.update("product.upProduct", product);
	}

	@Override
	public void delProduct(int pno) {
		sqlSession.delete("product.delProduct", pno);
	}
	
}
