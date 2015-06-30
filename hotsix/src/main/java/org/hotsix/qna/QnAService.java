package org.hotsix.qna;

import java.util.List;

import org.hotsix.page.Criteria;
import org.hotsix.page.PageMaker;

public interface QnAService {
	
	public List<QnAVO> qnaList(Criteria cri) throws Exception;
	public void qnaRemove(int qnaNo) throws Exception;
	public void qnaRemoveWith(int qnaNo) throws Exception;
	
	public void qnaRegist(QnAVO qvo) throws Exception;
	public void qnaModify(QnAVO qvo) throws Exception;
	public PageMaker total(Criteria cri) throws Exception;
}
