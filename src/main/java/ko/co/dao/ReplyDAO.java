package ko.co.dao;

import java.util.List;

import ko.co.vo.ReplyVO;

public interface ReplyDAO {
	// 댓글 조회
	public List<ReplyVO> readReply(int bno) throws Exception;
	
}
