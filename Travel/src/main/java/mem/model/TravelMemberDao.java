package mem.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class TravelMemberDao {
	private String namespace = "mem.model.Mem";
	@Autowired
	SqlSessionTemplate sst;
	
	//맴버 비밀번호변경
	public void updateMemPwd(TravelMemberBean tmbean) {
		int cnt = -1;
		cnt = sst.update(namespace+".UpdateMemberPwd", tmbean);
		System.out.println("cnt: "+cnt);
	}
	
	//맴버 계좌번호 추가
	public void insertAccount(TravelAccountBean tabean) {
		int cnt = -1;
		cnt = sst.insert(namespace+".InsertAccountMember", tabean);
		System.out.println("cnt: "+cnt);
	}

	public List<TravelAccountBean> accountList(int mnum) {
		List<TravelAccountBean> lists = sst.selectList(namespace+".SelectAccountList",mnum);
		return lists;
	}
	
	
}
