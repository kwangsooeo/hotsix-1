package org.hotsix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.hotsix.page.Criteria;
import org.hotsix.page.PageMaker;
import org.hotsix.qna.QnAVO;

public interface QnAMapper {

	@Select("select qnaNo,memberNo,title,contents,regdate,qna_type,qna_status,parent,depth from tbl_qna "
			+ "order by qnaNo desc limit 0, 40")
	public List<QnAVO> allList(Criteria cri) throws Exception;
	
	@Select("select qnaNo,memberNo,qna_type,title,contents,regdate,parent,depth,qna_status from tbl_qna "
			+ "where qnaNo=#{qnaNo}")
	public QnAVO read(int qnaNo) throws Exception;

	@Delete("delete from tbl_qna where qnaNo=#{qnaNo}")
	public void delete(int qnaNo) throws Exception;
	
	@Delete("delete from tbl_qna where parent=#{qnaNo} and depth='b' and qnaNo>0")
	public void deleteWith(int qnaNo) throws Exception;
	
	@Insert("insert into tbl_qna (memberNo,qna_type,title,contents,parent,depth)"
			+ " values(0,'reply','답변 드립니다^^', #{contents}, #{qnaNo},'b')")
	public void create(QnAVO qvo) throws Exception;
	
	
	@Update("update tbl_qna set contents=#{contents} where qnaNo=#{qnaNo}")
	public void update(QnAVO qvo) throws Exception;
	
	@Select("select count(*) totalCount from tbl_qna")
	public PageMaker total(Criteria cri) throws Exception; 
}
