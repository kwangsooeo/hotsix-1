package org.hotsix.qna;

import java.util.List;

import javax.inject.Inject;

import org.hotsix.mapper.QnAMapper;
import org.hotsix.page.Criteria;
import org.hotsix.page.PageMaker;
import org.springframework.stereotype.Service;

@Service
public class QnAServiceImpl implements QnAService {
	
	@Inject
	private QnAMapper mapper;

	
	@Override
	public void qnaRemove(int qnaNo) throws Exception {
		mapper.delete(qnaNo);

	}
	@Override
	public void qnaRemoveWith(int qnaNo) throws Exception {
		mapper.deleteWith(qnaNo);
		
	}
	
	@Override
	public void qnaRegist(QnAVO qvo) throws Exception {
		mapper.create(qvo);

	}
	
	@Override
	public void qnaModify(QnAVO qvo) throws Exception {
		mapper.update(qvo);

	}

	@Override
	public PageMaker total(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.total(cri);
	}
	@Override
	public QnAVO qnaRead(int qnaNo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.read(qnaNo);
	}
	@Override
	public List<QnAVO> qna_aList(Criteria cri) throws Exception {
		
		return mapper.aList(cri);
	}
	@Override
	public List<QnAVO> qna_bList(int qnaNo) throws Exception {
		
		return mapper.bList(qnaNo);
	}

	@Override
	public void qna_cntplus(QnAVO qvo) throws Exception {
		mapper.cntplus(qvo);
	}

	@Override
	public void qna_cntminus(QnAVO qvo) throws Exception {
		mapper.cntminus(qvo);
		
	}
	@Override
	public void qna_delreply(QnAVO qvo) throws Exception {
		mapper.deletereply(qvo);
		
	}
	@Override
	public List<QnAVO> qna_notReplyList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.notreplyList(cri);
	}
	
	
}
