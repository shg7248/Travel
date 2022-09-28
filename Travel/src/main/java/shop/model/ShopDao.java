package shop.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import comp.model.RoomBean;

@Component
public class ShopDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace = "shop.model.Shop";
	
	public List<SearchBean> search(SearchBean searchBean) {
		return sqlSessionTemplate.selectList(namespace + ".Search", searchBean);
	}

	public DetailBean getOrderInfoByRnum(DetailBean detailBean) {
		return sqlSessionTemplate.selectOne(namespace + ".GetOrderInfoByRnum", detailBean);
	}

	public int insertOrders(OrdersBean ordersBean) {
		return sqlSessionTemplate.insert(namespace + ".InsertOrders", ordersBean);
	}

	public List<RoomBean> getRoomListByAnum(Map<String, String> map) {
		return sqlSessionTemplate.selectList(namespace + ".GetRoomListByAnum", map);
	}

	public void insertPoint(PointBean pointBean) {
		sqlSessionTemplate.insert(namespace + ".InsertPoint", pointBean);
	}

	public int getTotalPointByMnum(int mnum) {
		return sqlSessionTemplate.selectOne(namespace + ".GetTotalPointByMnum", mnum);
	}
}
