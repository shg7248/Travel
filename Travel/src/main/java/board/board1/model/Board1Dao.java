package board.board1.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("board1Dao")
public class Board1Dao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace="board.model.Board";
	
	public void insert(Board1Bean bb) {
		sqlSessionTemplate.insert(namespace+".Insert", bb);
	}

	public List<Board1Bean> getBoard1NoticeList() {
		List<Board1Bean> list= new ArrayList<Board1Bean>();
		list = sqlSessionTemplate.selectList(namespace+".GetBoard1NoticeList");
		return list;
	}
	
	public List<Board1Bean> getBoard1EventList() {
		List<Board1Bean> list= new ArrayList<Board1Bean>();
		list = sqlSessionTemplate.selectList(namespace+".GetBoard1EventList");
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
	
	
	
	
}
