package reply.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
}
