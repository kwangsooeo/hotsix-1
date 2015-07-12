package org.hotsix.contents;

import java.util.List;

import org.hotsix.page.Criteria;
import org.hotsix.page.PageMaker;
import org.springframework.stereotype.Service;

@Service
public interface ContentsService {
	
	public void regContents (ContentsVO contents) throws Exception;
	
	public void deleteContents(ContentsVO vo)throws Exception;
	
	public ContentsVO readContents(Integer no)throws Exception;
	
//	public List<ContentsVO> list() throws Exception;
	
	public void update(ContentsVO vo) throws Exception;
	
	public List<ContentsVO> listPaging(Criteria cri) throws Exception;
	
	public PageMaker countPaging(Criteria cri)throws Exception;
}
