package ko.co.service;

import java.util.List;

import ko.co.vo.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> readReply (int bno) throws Exception;
}
