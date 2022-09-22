package reply.model;

import java.util.List;

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
	
	public List<ReplyBean> getReplyListByRnum(int rnum) {
		return sqlSessionTemplate.selectList(namespace + ".GetReplyListByRnum", rnum);
	}
	
	public List<ReplyBean> getReplyListByRnum(String rnum) {
		return sqlSessionTemplate.selectList(namespace + ".GetReplyListByRnum", rnum);
	}
}
