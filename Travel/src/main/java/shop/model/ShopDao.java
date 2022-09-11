package shop.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ShopDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace = "shop.model.Shop";
	
	public List<SearchBean> search(SearchBean searchBean) {
		return sqlSessionTemplate.selectList(namespace + ".Search", searchBean);
	}
}
