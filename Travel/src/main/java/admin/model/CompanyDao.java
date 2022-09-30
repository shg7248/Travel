package admin.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import util.Paging;

@Component
public class CompanyDao {
	
	private String namespace = "admin.model.Admin";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getTotalCount(Map<String, String> map) {
		int result = sqlSessionTemplate.selectOne(namespace+".GetComTotalCount", map);
		System.out.println("total result:"+result);
		return result;

	}
	
	public List<CompanyBean> getCompanyList(Paging pageInfo, Map<String, String> map) {
		List<CompanyBean> lists=new ArrayList<CompanyBean>();

		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		lists=sqlSessionTemplate.selectList(namespace+".GetCompanyList",map,rowBounds);
		System.out.println(lists.size());
		return lists;
	
	}

	public CompanyBean getByNum(String cnum) {
		CompanyBean cb= sqlSessionTemplate.selectOne(namespace+".GetAppr",cnum);
		return cb;
	}

	public int updateAppr(CompanyBean cb) {
		
		int cnt = sqlSessionTemplate.update(namespace+".UpdateAppr",cb);
		return cnt;
	}

	public int deleteCompany(String cnum) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteCompany",cnum);
		System.out.print("cnt:"+cnt);
		return cnt;
	}
	

}



