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
	
//	@Select("select qnaNo,memberNo,title,contents,regdate,qna_type,qna_status,parent,depth,replycnt from tbl_qna "
//			+ "where depth='a' order by parent desc limit #{pageStart}, #{perPageNum}")
	public List<QnAVO> aList(Criteria cri) throws Exception;
	
	@Select("select qnaNo,memberNo,title,contents,regdate,qna_type,qna_status,parent,depth,replycnt from tbl_qna "
			+ "where parent = #{qnaNo} and depth='b'")
	public List<QnAVO> bList(int qnaNo) throws Exception;
	
	@Select("select qnaNo,memberNo,qna_type,title,contents,regdate,parent,depth,qna_status,replycnt from tbl_qna "
			+ "where qnaNo=#{qnaNo}")
	public QnAVO read(int qnaNo) throws Exception;

	@Delete("delete from tbl_qna where qnaNo=#{qnaNo}")
	public void delete(int qnaNo) throws Exception;
	
	@Delete("delete from tbl_qna where parent=#{qnaNo} and depth='b' and qnaNo>0")
	public void deleteWith(int qnaNo) throws Exception;
	
	@Insert("insert into tbl_qna (memberNo,qna_type,title,contents,parent,depth)"
			+ " values(0,'reply','답변 드립니다^^', #{contents}, #{qnaNo},'b')")
	public void create(QnAVO qvo) throws Exception;
	
	@Update("update tbl_qna set replycnt=replycnt+1, regdate=regdate, qna_status=qna_status+1 where qnaNo=#{qnaNo}")
	public void cntplus(QnAVO qvo) throws Exception;
	
	@Update("update tbl_qna set replycnt=replycnt-1, regdate=regdate, qna_status=qna_status-1 where qnaNo=#{parent}")
	public void cntminus(QnAVO qvo) throws Exception;
	
	@Delete("delete from tbl_qna where qnaNo=#{qnaNo}")
	public void deletereply(QnAVO qvo) throws Exception;
	
	@Update("update tbl_qna set contents=#{contents} where qnaNo=#{qnaNo}")
	public void update(QnAVO qvo) throws Exception;
	
//	@Select("select count(*) totalCount from tbl_qna where depth='a'")
	public PageMaker total(Criteria cri) throws Exception; 
}
