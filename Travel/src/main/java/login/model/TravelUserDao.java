package login.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
@Component("user")
public class TravelUserDao {
	private String namespace = "login.model.Login";
	@Autowired
	private SqlSessionTemplate sst;
	
	public int insert(TravelUserBean tubean) {
		return sst.insert(namespace+".UserInsert", tubean);
	}

	public int emailCheck(String email) {
		int cnt = -1;
		cnt = sst.selectOne(namespace+".UserEmail", email);
		System.out.println("email :" + email);
		System.out.println("cnt: " + cnt);
		return cnt;
	}

	public TravelUserBean getMember(String email) {
		TravelUserBean loginEmail = sst.selectOne(namespace+".UserLogin", email);
		return loginEmail;
	}
	
}
