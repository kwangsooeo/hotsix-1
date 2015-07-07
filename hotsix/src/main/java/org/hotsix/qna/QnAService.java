package org.hotsix.qna;

import java.util.List;

import org.hotsix.page.Criteria;
import org.hotsix.page.PageMaker;

public interface QnAService {
	
	public List<QnAVO> qna_aList(Criteria cri) throws Exception;
	public List<QnAVO> qna_bList(int qnaNo) throws Exception;
	public void qnaRemove(int qnaNo) throws Exception;
	public void qnaRemoveWith(int qnaNo) throws Exception;
	public PageMaker total(Criteria cri) throws Exception;
	
	public void qnaRegist(QnAVO qvo) throws Exception;
	public void qnaModify(QnAVO qvo) throws Exception;
	public QnAVO qnaRead(int qnaNo) throws Exception;
	
	public void qna_cntplus(QnAVO qvo) throws Exception;
	public void qna_cntminus(QnAVO qvo) throws Exception;
	public void qna_delreply(QnAVO qvo) throws Exception;
}
