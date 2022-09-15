package board.faq.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("FaqDao")
public class FaqDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace="board.model.Board";
	
	public void insertFaq(FaqBean fb) {
		sqlSessionTemplate.insert(namespace+".InsertFaq",fb);
	}

	public List<FaqBean> getAllFaqList() {
		List<FaqBean> lists = new ArrayList<FaqBean>();
		lists = sqlSessionTemplate.selectList(namespace+".GetAllFaqList");
		return lists;
	}

	public void deleteFaqByInum(String fnum) {
		sqlSessionTemplate.delete(namespace+".DeleteFaqByInum",fnum);
	}

	public FaqBean getFaqByFnum(String fnum) {
		FaqBean fb = sqlSessionTemplate.selectOne(namespace+".GetFaqByFnum",fnum);
		return fb;
	}

	public void updateFaqByFnum(FaqBean fb) {
		sqlSessionTemplate.update(namespace+".UpdateFaqByFnum",fb);
	}
	
	
}
