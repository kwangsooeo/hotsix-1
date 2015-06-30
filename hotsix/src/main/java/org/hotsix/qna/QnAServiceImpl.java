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
	public List<QnAVO> qnaList(Criteria cri) throws Exception {
		
		return mapper.allList(cri);
	}
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
	
	


}
