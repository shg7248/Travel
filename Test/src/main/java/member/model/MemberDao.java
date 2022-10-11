package member.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import product.model.ProductBean;
import utility.Paging;

@Component("MemberDao")
public class MemberDao {
	String namespace = "member.model.Member";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void registerMember(MemberBean mb) {
		int insert = sqlSessionTemplate.insert(namespace+".RegisterMember",mb);
		System.out.println("insert="+insert);
	}

	public int getTotalCount(Map<String, String> map) {
		int result = sqlSessionTemplate.selectOne(namespace+".GetTotalCount", map);
		return result;

	}

	public List<MemberBean> getMemberList(Paging pageInfo, Map<String, String> map) {
		List<MemberBean> lists=new ArrayList<MemberBean>();

		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		lists=sqlSessionTemplate.selectList(namespace+".GetMemberList",map,rowBounds);
		System.out.println(lists.size());
		return lists;


	}

	public MemberBean getMember(String id) {
		MemberBean mbean = null;
		mbean = sqlSessionTemplate.selectOne(namespace+".GetMember", id);
		return mbean;

	}

	public void updateMpoint(String id, int mpoint) {
		MemberBean mb = new MemberBean();
		mb.setId(id);
		mb.setMpoint(mpoint);
		sqlSessionTemplate.update(namespace+".UpdateMpoint",mb);

	}

}
