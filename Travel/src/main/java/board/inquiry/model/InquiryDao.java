package board.inquiry.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import util.Paging;

@Component("InquiryDao")
public class InquiryDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace="board.model.Board";


	public void insertInquiry(InquiryBean ib) {
		sqlSessionTemplate.insert(namespace+".InsertInquiry",ib);
	}


	public List<InquiryBean> getAllInquiryList(Paging pageInfo) {
		List<InquiryBean> lists = new ArrayList<InquiryBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".GetAllInquiryList",null,rowBounds);
		return lists;
	}
	public List<InquiryBean> getAllInquiryListByMemberEmail(String email, Paging pageInfo) {
		List<InquiryBean> lists = new ArrayList<InquiryBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		System.out.println(email);
		lists = sqlSessionTemplate.selectList(namespace+".GetAllInquiryListByMemberEmail",email,rowBounds);
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


	public int getTotalCount() {
		int result = sqlSessionTemplate.selectOne(namespace+".GetTotalCount");
		return result;
	}


	public int getTotalInquiryListByMemberEmailCount(String email) {
		int result = sqlSessionTemplate.selectOne(namespace+".GetTotalInquiryListByMemberEmailCount",email);
		return result;
	}
	
}
