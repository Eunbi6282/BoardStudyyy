package ko.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ko.co.vo.BoardVO;
import ko.co.vo.Criteria;
import ko.co.vo.SearchCriteria;


@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSession sqlSession ;

	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);
		
	}
	
	//게시물 목록 
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		//boardMapper.xml에서 mapper의 namespace가 boardMapper이고 그중에 id가 list인 것을 가져와서 반환해라
		return sqlSession.selectList("boardMapper.listPage", scri);
	}
	
	// 총개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("boardMapper.listCount", scri);
	}
	
	
	// 게시물 조회
	@Override
	public BoardVO read(int bno) throws Exception {
		return sqlSession.selectOne("boardMapper.read", bno);
	}

	//게시물 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {
		sqlSession.update("boardMapper.update", boardVO);
		
	}
	
	//게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("boardMapper.delete", bno);
		
	}


	
}