package comp.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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

	public AccomBean getAccomByCnum(int cnum) {
		return sqlSessionTemplate.selectOne(namespace + ".GetAccomByCnum", cnum);
	}

}
