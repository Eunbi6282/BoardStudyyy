package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.BoardVO;
import kr.co.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Inject SqlSession sql;

	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return sql.selectList("replyMapper.readReply", bno);
	}

	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		System.out.println("dao작동");
		sql.insert("replyMapper.writeReply", vo);
		
	}

	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		sql.update("replyMapper.updateReply", vo);
		
	}

	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		sql.delete("replyMapper.deleteReply", vo);
		
	}

	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		return sql.selectOne("replyMapper.selectReply", rno);
	}
	
	//답변완료
	@Override
	public List<ReplyVO> tfReply(int bno) throws Exception {
		//게시판의 번호를 넣으면 단벼완료
		
		
		System.out.println(bno);
		return sql.selectList("replyMapper.replyTF", bno);
	}
	
	
	
	

}