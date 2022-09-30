package board.board1.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import util.Paging;

@Component("board1Dao")
public class Board1Dao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace="board.model.Board";
	
	public void insert(Board1Bean bb) {
		sqlSessionTemplate.insert(namespace+".Insert", bb);
	}
	public void insertNotice(Board1Bean bb) {
		sqlSessionTemplate.insert(namespace+".InsertNotice", bb);
	}

	public List<Board1Bean> getBoard1NoticeList(Paging pageInfo) {
		List<Board1Bean> list= new ArrayList<Board1Bean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		list = sqlSessionTemplate.selectList(namespace+".GetBoard1NoticeList",null,rowBounds);
		return list;
	}
	
	public List<Board1Bean> getBoard1EventList(Paging pageInfo) {
		List<Board1Bean> list= new ArrayList<Board1Bean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		list = sqlSessionTemplate.selectList(namespace+".GetBoard1EventList",null,rowBounds);
		return list;
	}

	public void deleteBoard1ByNnum(String nnum) {
		sqlSessionTemplate.delete(namespace+".DeleteBoard1ByNnum",nnum);
	}

	public Board1Bean getBoard1ByNnum(String nnum) {
		Board1Bean bb = sqlSessionTemplate.selectOne(namespace+".GetBoard1ByNnum",nnum);
		return bb;
	}

	public void updateBoard1ByNnum(Board1Bean bb) {
		sqlSessionTemplate.selectOne(namespace+".UpdateBoard1ByNnum",bb);
	}
	public void updateBoard1NoticeByNnum(Board1Bean bb) {
		sqlSessionTemplate.selectOne(namespace+".UpdateBoard1NoticeByNnum",bb);
	}

	public int getTotalNoticeCount() {
		int result = sqlSessionTemplate.selectOne(namespace+".GetTotalNoticeCount");
		return result;
	}

	public int getTotalEventCount() {
		int result = sqlSessionTemplate.selectOne(namespace+".GetTotalEventCount");
		return result;
	}

	public Board1Bean getBoard1FirstEvent() {
		Board1Bean bb = sqlSessionTemplate.selectOne(namespace+".GetBoard1FirstEvent");
		return bb;
	}
	
	
	
	
}
