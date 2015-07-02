package org.hotsix.mento;

import java.util.List;

import javax.inject.Inject;

import org.hotsix.mapper.MentoMapper;
import org.hotsix.page.Criteria;
import org.hotsix.page.PageMaker;
import org.springframework.stereotype.Service;

@Service
public class MentoServiceImp implements MentoService {

	@Inject
	private MentoMapper mapper;
	
	@Override
	public List<MentoVO> listMento(Criteria cri) throws Exception {
		mapper.listMento(cri);
		return mapper.listMento(cri);
	}

/*	멘토카운트*/
	@Override
	public PageMaker totalCount(Criteria cri) throws Exception {
		return mapper.countPaging(cri);
	}
	
/*	멘토등록대기중 카운트*/
	@Override
	public PageMaker mentoCount(Criteria cri) throws Exception {
		return mapper.mentoCount(cri);
	}

	@Override
	public void registMento(int MentoNo) throws Exception {
		mapper.registmento(MentoNo);
	}



}
