package login.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
@Component("company")
public class TravelCompanyDao {
	private String namespace = "login.model.Login";
	@Autowired
	private SqlSessionTemplate sst;
	
	//사업자 회원가입-insert
	public void insert(TravelCompanyBean tcbean) {
		int cnt = -1;
		cnt = sst.insert(namespace+".CompanyInsert", tcbean);
		System.out.println("cnt: " + cnt);
	}

	//사업자 회원가입-이메일 하나 조회
	public int emailCheck(String email) {
		int cnt = -1;
		cnt = sst.selectOne(namespace+".CompanyEmail", email);
		System.out.println("email :" + email);
		System.out.println("CompanyEmail cnt: " + cnt);
		return cnt;
	}

	//사업자 로그인-이메일 하나 조회
	public TravelCompanyBean getMember(String email) {
		TravelCompanyBean loginEmail = sst.selectOne(namespace+".CompanyLogin", email);
		return loginEmail;
	}
	
	//사업자 회원가입 - 사업자 번호 하나 조회
	public int cnumCheck(String cnum) {
		int cnt = -1;
		cnt = sst.selectOne(namespace+".CompanyCnum", cnum);
		System.out.println("cnt: " + cnt);
		return cnt;
	}
}
