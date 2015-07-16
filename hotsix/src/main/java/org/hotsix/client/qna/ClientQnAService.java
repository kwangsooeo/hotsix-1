package org.hotsix.client.qna;

import java.util.List;

import org.hotsix.page.Criteria;
import org.hotsix.page.PageMaker;
import org.hotsix.qna.QnAVO;

public interface ClientQnAService {

	public List<QnAVO> qna_List(Criteria cri) throws Exception;
	public QnAVO qna_userRead(int qnaNo) throws Exception;
	public PageMaker total(Criteria cri) throws Exception; 
	public void qna_userDelete(int qnaNo) throws Exception;

	public QnAVO qna_userInfo(int memberNo) throws Exception;
	public void qna_userQnA(QnAVO qvo) throws Exception;
	public int qna_userParent() throws Exception;
	public void qna_userQnAParent(int parent) throws Exception;
	public void qna_ModifyUser(QnAVO qvo) throws Exception;
	public List<QnAVO> qna_faqList(Criteria cri) throws Exception;
	public PageMaker faqTotal(Criteria cri) throws Exception; 
	
}
