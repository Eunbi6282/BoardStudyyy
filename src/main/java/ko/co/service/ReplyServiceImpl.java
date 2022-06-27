package ko.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ko.co.dao.ReplyDAO;
import ko.co.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO dao;

	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

}
