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
public class FaciDao {
	
private String namespace = "admin.model.Admin";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getTotalCount(Map<String, String> map) {
		int result = sqlSessionTemplate.selectOne(namespace+".GetFaTotalCount", map);
		return result;

	}
	
	public List<FaciBean> getFaciList(Paging pageInfo, Map<String, String> map) {
		List<FaciBean> lists=new ArrayList<FaciBean>();

		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		lists=sqlSessionTemplate.selectList(namespace+".GetFaciList",map,rowBounds);
		System.out.println(lists.size());
		return lists;
	
	}
	
	public FaciBean selectFaciByNum(String fnum) {
		FaciBean fb = sqlSessionTemplate.selectOne(namespace+".GetFaci",fnum);
		System.out.println("selectFaci fb num : " + fb.getFnum());
		return fb;

	}

	public int deleteFaci(String fnum) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteFaci",fnum);
		System.out.println(cnt);
		return cnt;
	}
	
	public int insertFaci(FaciBean bean) {
		int cnt = sqlSessionTemplate.insert(namespace + ".InsertFaci", bean);
		return cnt; // 써놓기 
	}
	
	
}
