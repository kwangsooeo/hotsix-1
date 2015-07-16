package org.hotsix.client.qna;

import java.util.List;

import javax.inject.Inject;

import org.hotsix.mapper.QnAMapper;
import org.hotsix.page.Criteria;
import org.hotsix.page.PageMaker;
import org.hotsix.qna.QnAVO;
import org.springframework.stereotype.Service;

@Service
public class ClientQnAServiceImpl implements ClientQnAService {

	@Inject
	private QnAMapper mapper;


	@Override
	public void qna_userQnA(QnAVO qvo) throws Exception {
		mapper.createQnA(qvo);
		
	}
	@Override
	public int qna_userParent() throws Exception {
		// TODO Auto-generated method stub
		return mapper.createQnAParent();
	}
	@Override
	public void qna_userQnAParent(int parent) throws Exception {
		mapper.createQnAUpdate(parent);
		
	}
	@Override
	public void qna_ModifyUser(QnAVO qvo) throws Exception {
		mapper.updateUser(qvo);
		
	}
	@Override
	public QnAVO qna_userRead(int qnaNo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.read(qnaNo);
	}
	@Override
	public List<QnAVO> qna_List(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.aList(cri);
	}
	@Override
	public PageMaker total(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.total(cri);
	}
	@Override
	public void qna_userDelete(int qnaNo) throws Exception {
		mapper.delete(qnaNo);
		
	}
	@Override
	public QnAVO qna_userInfo(int memberNo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.memberInfo(memberNo);
	}
	@Override
	public List<QnAVO> qna_faqList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.faqList(cri);
	}
	@Override
	public PageMaker faqTotal(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.faqTotal(cri);
	}
}
