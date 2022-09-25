package admin.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import comp.model.FacBean;
import util.Paging;

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
	
	public FaciBean selectFaciByNo(String fno) {
		FaciBean fb = sqlSessionTemplate.selectOne(namespace+".GetFaci",fno);
		System.out.println("selectFaci fb fno : " + fb.getFno());
		return fb;

	}

	public int deleteFaci(String fno) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteFaci",fno);
		System.out.println(cnt);
		return cnt;
	}
	
	public int insertFaci(FaciBean faci) {
		int cnt = sqlSessionTemplate.insert(namespace + ".InsertFaci", faci);
		return cnt; // 써놓기 
	}
	
	public int updateFaci(FaciBean fb){
		//System.out.println(album.getTitle());
		int cnt = sqlSessionTemplate.update(namespace+".UpdateFaci", fb);
		System.out.println(cnt);
		return cnt;
		
	}

	public List<FaciBean> getFacGroupList() {
		return sqlSessionTemplate.selectList(namespace+".GetFacGroupList");
	}
	
}













