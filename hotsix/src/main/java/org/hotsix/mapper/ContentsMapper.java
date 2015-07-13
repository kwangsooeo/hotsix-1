package org.hotsix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.hotsix.contents.ContentsVO;
import org.hotsix.page.Criteria;
import org.hotsix.page.PageMaker;

public interface ContentsMapper {
	
	//생성
	@Insert("insert into tbl_contents (title, link, jobNo) values(#{title}, #{link}, #{jobNo})")
	public void regContents(ContentsVO contents)throws Exception;
	
	//삭제
	@Delete("delete from tbl_contents where contentsNo=#{contentsNo}")
	public void deleteContents(ContentsVO vo)throws Exception;
	
	//조회
	@Select("select jobNo, contentsNo, title, link from tbl_contents where contentsNo=#{no}")
	public ContentsVO read(Integer no)throws Exception;	
	
	//수정
	@Update("update tbl_contents set title=#{title}, link=#{link} where contentsNo=#{contentsNo}")
	public void update(ContentsVO vo)throws Exception;
	
	//페이징
//	@Select("SELECT tc.contentsNo, tj.jobNo, tj.jobName, tc.regdate FROM tbl_contents AS tc INNER JOIN tbl_job AS tj ON tc.jobNo = tj.jobNo order by jobNo desc limit #{pageStart}, #{perPageNum}")
	public List<ContentsVO> listPaging(Criteria cri)throws Exception;
	
	//전체 게시물 카운트
//	@Select("select count(contentsNo) totalCount from tbl_contents where contentsNo > 0")
	public PageMaker countPaging(Criteria cri)throws Exception;
	
	
}
