package org.hotsix.contents;

import java.util.List;

import org.hotsix.page.Criteria;
import org.hotsix.page.PageMaker;
import org.springframework.stereotype.Service;

@Service
public interface ContentsService {
	
	//등록
	public void regContents (ContentsVO contents) throws Exception;
	//삭제
	public void deleteContents(ContentsVO vo)throws Exception;
	//조회
	public ContentsVO readContents(Integer no)throws Exception;
	//수정
	public void update(ContentsVO vo) throws Exception;
	//리스트
	public List<ContentsVO> listPaging(Criteria cri) throws Exception;
	//전체 게시물 카운트
	public PageMaker countPaging(Criteria cri)throws Exception;
	//Youtube ID삽입.
	public void insertVideoID(String link) throws Exception;	
}
