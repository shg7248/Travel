package comp.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import Util.Paging;

@Component
public class CompDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace = "comp.model.Comp";
	
	public List<ResionBean> getResionList() {
		return sqlSessionTemplate.selectList(namespace + ".GetResionList");
	}
	
	public List<FacBean> getFacList() {
		return sqlSessionTemplate.selectList(namespace + ".GetFacList");
	}

	public int insertAccom(AccomBean accomBean) {
		return sqlSessionTemplate.insert(namespace + ".InsertAccom", accomBean);
	}

	public AccomBean getAccomByAnum(String anum) {
		return sqlSessionTemplate.selectOne(namespace + ".GetAccomByAnum", anum);
	}
	
	public AccomBean getAccomByCnum(String cnum) {
		return sqlSessionTemplate.selectOne(namespace + ".GetAccomByCnum", cnum);
	}

	public int insertRoom(RoomBean roomBean) {
		return sqlSessionTemplate.insert(namespace + ".InsertRoom", roomBean);
	}

	public int getRoomTotalCountByAnum(Map<String, String> map) {
		return sqlSessionTemplate.selectOne(namespace + ".GetRoomTotalCountByAnum", map);
	}
	
	public int getRoomTotalCountByCnum(Map<String, String> map) {
		return sqlSessionTemplate.selectOne(namespace + ".GetRoomTotalCountByCnum", map);
	}

	public List<RoomBean> getRoomListByAnum(String anum) {
		return sqlSessionTemplate.selectList(namespace + ".GetRoomListByAnumOne", anum);
	}
	
	public List<RoomBean> getRoomListByAnum(Paging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		return sqlSessionTemplate.selectList(namespace + ".GetRoomListByAnum", map, rowBounds);
	}
	
	// 임시
	public List<RoomBean> getRoomListByCnum(Paging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		return sqlSessionTemplate.selectList(namespace + ".GetRoomListByCnum", map, rowBounds);
	}

	public RoomBean getRoomByRnum(String rnum) {
		return sqlSessionTemplate.selectOne(namespace + ".GetRoomByRnum", rnum);
	}

	// 카테고리
	public List<CategoryBean> getCategoryList() {
		return sqlSessionTemplate.selectList(namespace + ".GetCategoryList"); 
	}

	// rcode에 관련된 시/군/구 리스트
	public List<ResionBean> GetResionSIGUNGUList(String rcode) {
		return sqlSessionTemplate.selectList(namespace + ".GetResionSIGUNGUList"); 
	}

}
