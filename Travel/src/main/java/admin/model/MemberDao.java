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
public class MemberDao {
	
	private String namespace = "admin.model.Admin";

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getTotalCount(Map<String, String> map) {
		int result = sqlSessionTemplate.selectOne(namespace+".GetMemTotalCount", map);
		return result;

	}

	public List<MemberBean> getMemberList(Paging pageInfo, Map<String, String> map) {
		List<MemberBean> lists=new ArrayList<MemberBean>();
		
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		lists=sqlSessionTemplate.selectList(namespace+".GetMemberList",map,rowBounds);
		System.out.println(lists.size());
		return lists;
		
	}
	
	
	
}







