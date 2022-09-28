package mem.model;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import login.model.TravelUserBean;
import shop.model.OrdersBean;
import shop.model.PointBean;
import util.Paging;


@Component
public class TravelMemberDao {
	private String namespace = "mem.model.Mem";
	@Autowired
	SqlSessionTemplate sst;
	
	//맴버 비밀번호변경
	public void updateMemPwd(TravelUserBean tubean) {
		int cnt = -1;
		cnt = sst.update(namespace+".UpdateMemberPwd", tubean);
		System.out.println("cnt: "+cnt);
	}
	
	//맴버 계좌번호 추가
	public void insertAccount(TravelAccountBean tabean) {
		int cnt = -1;
		cnt = sst.insert(namespace+".InsertAccountMember", tabean);
		System.out.println("cnt: "+cnt);
	}

	//맴버 계좌 리스트
	public List<TravelAccountBean> accountList(int mnum) {
		List<TravelAccountBean> lists = sst.selectList(namespace+".SelectAccountList",mnum);
		return lists;
	}

	//
	public List<OrdersBean> orderList(int mnum) {
		List<OrdersBean> lists = sst.selectList(namespace+".selectOrder", mnum);
		return lists;
	}

	public int seachAccount(String accnum) {
		int cnt = -1;
		cnt = sst.selectOne(namespace+".SearchAccount", accnum);
		System.out.println("cnt: "+cnt);
		return cnt;
	}

	public void deleteMember(int mnum) {
		int cnt = -1;
		cnt = sst.delete(namespace+".DeleteMember", mnum);
		System.out.println("cnt: "+cnt);
	}

	public void deleteAccnum(String accnum) {
		int cnt = -1;
		cnt = sst.delete(namespace+".DeleteAccnum", accnum);
		System.out.println("cnt: "+cnt);
	}

	public void deleteOrder(String onum) {
		int cnt = -1;
		cnt = sst.delete(namespace+".DeleteOrder", onum);
		System.out.println("cnt: "+cnt);
	}

	public int getMemberPointTotalCountByMnum(int mnum) {
		System.out.println(mnum);
		return sst.selectOne(namespace + ".GetMemberPointTotalCountByMnum", mnum);
	}

	public List<PointBean> getMemberPointListByMnum(Paging pageInfo, int mnum) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		return sst.selectList(namespace + ".GetMemberPointListByMnum", mnum, rowBounds);
	}

	public TravelUserBean getUserInfoByMnum(int mnum) {
		return sst.selectOne(namespace + ".GetUserInfoByMnum", mnum);
	}
	
	
}
