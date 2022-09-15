package board.inquiry.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import board.board1.model.Board1Bean;

@Component("InquiryDao")
public class InquiryDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace="board.model.Board";


	public void insertInquiry(InquiryBean ib) {
		sqlSessionTemplate.insert(namespace+".InsertInquiry",ib);
	}


	public List<InquiryBean> getAllInquiryList() {
		List<InquiryBean> lists = new ArrayList<InquiryBean>();
		lists = sqlSessionTemplate.selectList(namespace+".GetAllInquiryList");
		return lists;
	}
	public List<InquiryBean> getAllInquiryListByEmail(String email) {
		List<InquiryBean> lists = new ArrayList<InquiryBean>();
		System.out.println(email);
		lists = sqlSessionTemplate.selectList(namespace+".GetAllInquiryListByEmail",email);
		return lists;
	}


	public InquiryBean getInquiryByInum(String inum) {
		InquiryBean ib = new InquiryBean();
		ib = sqlSessionTemplate.selectOne(namespace+".GetInquiryByInum",inum);
		return ib;
	}


	public void answer(InquiryBean ib) {
		sqlSessionTemplate.update(namespace+".Answer",ib);
	}


	public InquiryBean selectMemberEmailByInum(String inum) {
		InquiryBean ib = sqlSessionTemplate.selectOne(namespace+".SelectMemberEmailByInum",inum);
		return ib;
	}


	public void deleteInquiryByInum(String inum) {
		sqlSessionTemplate.delete(namespace+".DeleteInquiryByInum",inum);
	}
}
