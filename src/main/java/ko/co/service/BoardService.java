package ko.co.service;

import java.util.List;

import ko.co.vo.BoardVO;
import ko.co.vo.Criteria;
import ko.co.vo.SearchCriteria;

public interface BoardService {
	
	//게시글 작성 
	public void write(BoardVO boardVo) throws Exception;
	
	//DAO와 연결되는 Service
	public List<BoardVO> list(SearchCriteria scri)throws Exception;
	
	//게시물 총 개수
	public int listCount(SearchCriteria scri) throws Exception;
	
	//게시물 목록 조회
	public BoardVO read(int bno) throws Exception;
	
	// 게시물 수정
	public void update(BoardVO boardVO) throws Exception;
	
	//게시물 삭제
	public void delete(int bno) throws Exception;





}
