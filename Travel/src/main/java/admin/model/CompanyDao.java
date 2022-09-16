package admin.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import Util.Paging;

@Component
public class CompanyDao {
	
	private String namespace = "admin.model.Admin";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getTotalCount(Map<String, String> map) {
		int result = sqlSessionTemplate.selectOne(namespace+".GetComTotalCount", map);
		return result;

	}
	
	public List<CompanyBean> getCompanyList(Paging pageInfo, Map<String, String> map) {
		List<CompanyBean> lists=new ArrayList<CompanyBean>();

		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		lists=sqlSessionTemplate.selectList(namespace+".GetCompanyList",map,rowBounds);
		System.out.println(lists.size());
		return lists;
	
	}
	
	public CompanyBean selectHostByNum(String cnum) {
		CompanyBean cb = sqlSessionTemplate.selectOne(namespace+".GetHost",cnum);
		System.out.println("selectCompany cb num : " + cb.getCnum());
		return cb;

	}

	public int deleteHost(String cnum) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteHost",cnum);
		System.out.println(cnt);
		return cnt;
	}
}



