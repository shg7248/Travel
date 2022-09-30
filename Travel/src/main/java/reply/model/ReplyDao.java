package reply.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import util.Paging;

@Component
public class ReplyDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace = "reply.model.Reply";
	
	public void insertReply(ReplyBean replyBean) {
		sqlSessionTemplate.insert(namespace + ".InsertReply", replyBean);
	}
	
	public List<ReplyBean> getReplyListByAnum(int anum) {
		return sqlSessionTemplate.selectList(namespace + ".GetReplyListByRnum", anum);
	}
	
	public List<ReplyBean> getReplyListByAnum(String anum) {
		return sqlSessionTemplate.selectList(namespace + ".GetReplyListByRnum", anum);
	}

	public List<ReplyBean> getReplyListByAnum(Map<String, Object> param) {
		return sqlSessionTemplate.selectList(namespace + ".GetReplyListByRnum", param);
	}

	public int getReplyTotalCountByRnum(Map<String, Object> param) {
		return sqlSessionTemplate.selectOne(namespace + ".GetReplyTotalCountByRnum", param);
	}

	public int getReplyTotalCountByCnum(Map<String, String> map) {
		return sqlSessionTemplate.selectOne(namespace + ".GetReplyTotalCountByCnum", map);
	}
	
	public List<ReplyBean> getReplyListByCnum(Map<String, String> map, Paging pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		return sqlSessionTemplate.selectList(namespace + ".GetReplyListByCnum", map, rowBounds);
	}

	public ReplyBean getReplyByRvnum(String rvnum) {
		return sqlSessionTemplate.selectOne(namespace + ".GetReplyByRvnum", rvnum);
	}

	public int updateReplyByRvnum(ReplyBean replyBean) {
		return sqlSessionTemplate.update(namespace + ".UpdateReplyByRvnum", replyBean);
	}

	public void deleteReplyByRvnum(String rvnum) {
		sqlSessionTemplate.update(namespace + ".DeleteReplyByRvnum", rvnum);
	}
}
