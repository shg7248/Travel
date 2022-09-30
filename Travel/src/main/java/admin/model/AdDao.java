package admin.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;import org.springframework.jdbc.support.incrementer.AbstractColumnMaxValueIncrementer;
import org.springframework.stereotype.Component;

import util.Paging;

@Component("AdDao")
public class AdDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace="admin.model.Admin";
	
	public void insertAdvertisement(AdBean ab) {
		sqlSessionTemplate.insert(namespace+".InsertAdvertisement", ab);
	}
	
	public int getTotalAdvertisementCount() {
		int result = sqlSessionTemplate.selectOne(namespace+".GetTotalAdvertisementCount");
		return result;
	}
	
	public List<AdBean> getAdvertisementList(Paging pageInfo) {
		List<AdBean> lists= new ArrayList<AdBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".GetAdvertisementList",null,rowBounds);
		return lists;
	}
	
	//상단까지함
	public AdBean getAdvertisementByAdnum(String adnum) {
		AdBean ab = sqlSessionTemplate.selectOne(namespace+".GetAdvertisementByAdnum",adnum);
		return ab;
	}

	public void deleteAdvertisementByNnum(String adnum) {
		sqlSessionTemplate.delete(namespace+".DeleteAdvertisementByNnum",adnum);
	}

	public void updateAdvertisementByNnum(AdBean ab) {
		sqlSessionTemplate.update(namespace+".UpdateAdvertisementByNnum",ab);
	}

	public AdBean getAdvertisementFirst() {
		AdBean ab = sqlSessionTemplate.selectOne(namespace+".GetAdvertisementFirst");
		return ab;
	}
}
