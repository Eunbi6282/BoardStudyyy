package ko.co.dao;

import java.util.List;

import ko.co.vo.ReplyVO;

public interface ReplyDAO {
	// 댓글 조회
	public List<ReplyVO> readReply(int bno) throws Exception;
	
	// 댓글 작성
	public void writeReply(ReplyVO vo) throws Exception;
	
	// 댓글 수정
	public void updateReply(ReplyVO vo) throws Exception;
	
	// 댓글 삭제
	public void deleteReply(ReplyVO vo) throws Exception;
	
	// 댓글 조회
	public ReplyVO selectReply (int rno) throws Exception;
	
	// 답변완료
	public int tfReply(int bno) throws Exception;
	
	
}
