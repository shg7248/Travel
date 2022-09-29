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
public class CateDao {
	
private String namespace = "admin.model.Admin";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getTotalCount(Map<String, String> map) {
		int result = sqlSessionTemplate.selectOne(namespace+".GetCateTotalCount", map);
		return result;

	}
	
	public List<CateBean> getCateList(Paging pageInfo, Map<String, String> map) {
		List<CateBean> lists=new ArrayList<CateBean>();

		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		lists=sqlSessionTemplate.selectList(namespace+".GetCateList",map,rowBounds);
		System.out.println(lists.size());
		return lists;
		
		
	}
	

	public CateBean selectcateByNum(String canum) {
		CateBean cb = sqlSessionTemplate.selectOne(namespace+".GetCate",canum);
		System.out.println("selectCate mb num : " + cb.getCanum());
		return cb;

	}

	public int deleteCate(String canum) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteCate",canum);
		System.out.println(cnt);
		return cnt;
	}
	
	public int insertCate(CateBean cate) {
		int cnt = sqlSessionTemplate.insert(namespace + ".InsertCate", cate);
		return cnt; // 써놓기 
	}
	
	

	public int updateCate(CateBean cb){
		//System.out.println(album.getTitle());
		int cnt = sqlSessionTemplate.update(namespace+".UpdateCate", cb);
		System.out.println(cnt);
		return cnt;
	}

	public List<CateBean> getCateListTotal() {
		return sqlSessionTemplate.selectList(namespace+".GetCateListTotal");
	}

	public List<CateBean> getAroundCateList() {
		return sqlSessionTemplate.selectList(namespace+".GetAroundCateList");
	}
	
}






