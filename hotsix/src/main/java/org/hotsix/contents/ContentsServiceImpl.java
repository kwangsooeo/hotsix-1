package org.hotsix.contents;

import java.util.List;

import javax.inject.Inject;

import org.hotsix.mapper.ContentsMapper;
import org.hotsix.page.Criteria;
import org.hotsix.page.PageMaker;
import org.springframework.stereotype.Service;

@Service
public class ContentsServiceImpl implements ContentsService {

	@Inject
	private ContentsMapper mapper;
	
	
	@Override
	public void regContents(ContentsVO contents) throws Exception {
		// TODO Auto-generated method stub
		mapper.regContents(contents);
	}

	@Override
	public void deleteContents(ContentsVO vo) throws Exception {
		// TODO Auto-generated method stub
		mapper.deleteContents(vo);
		
	}

	@Override
	public ContentsVO readContents(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.read(no);
	}

//	@Override
//	public List<ContentsVO> list() throws Exception {
//		// TODO Auto-generated method stub
//		return mapper.list();
//	}

	@Override
	public void update(ContentsVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		mapper.update(vo);
	}

	@Override
	public List<ContentsVO> listPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.listPaging(cri);
	}
	
	@Override
	public PageMaker countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.countPaging(cri);
	}

	@Override
	public void insertVideoID(int contentsNo, String link) throws Exception {
		// TODO Auto-generated method stub
		mapper.insertVideoID(contentsNo, link);
	}

	

}
