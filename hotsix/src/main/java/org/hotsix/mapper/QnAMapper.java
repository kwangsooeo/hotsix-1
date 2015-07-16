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
	
//	@Select("select qnaNo,memberNo,title,contents,regdate,qna_type,parent,depth,replycnt from tbl_qna "
//			+ "where depth='a' order by parent desc limit #{pageStart}, #{perPageNum}")
	public List<QnAVO> aList(Criteria cri) throws Exception;
	
	@Select("select qnaNo,memberNo,title,contents,regdate,qna_type,parent,depth,replycnt from tbl_qna "
			+ "where parent = #{qnaNo} and depth='b'")
	public List<QnAVO> bList(int qnaNo) throws Exception;

	@Delete("delete from tbl_qna where qnaNo=#{qnaNo}")
	public void delete(int qnaNo) throws Exception;	//공통
	
	@Delete("delete from tbl_qna where parent=#{qnaNo} and depth='b' and qnaNo>0")
	public void deleteWith(int qnaNo) throws Exception;
	
	@Insert("insert into tbl_qna (memberNo,qna_type,title,contents,parent,depth)"
			+ " values(34,'reply','�亯 �帳�ϴ�^^', #{contents}, #{qnaNo},'b')")
	public void create(QnAVO qvo) throws Exception;
	
	@Insert("insert into tbl_qna (memberNo,qna_type,title,contents,parent,depth)"
			+ " values(34,#{qna_type},#{title}, #{contents}, #{parent},'a')")
	public void createFaq(QnAVO qvo) throws Exception;
	
	@Update("update tbl_qna set replycnt=replycnt+1, regdate=regdate where qnaNo=#{qnaNo}")
	public void cntplus(QnAVO qvo) throws Exception;
	
	@Update("update tbl_qna set replycnt=replycnt-1, regdate=regdate where qnaNo=#{parent}")
	public void cntminus(QnAVO qvo) throws Exception;
	
	@Delete("delete from tbl_qna where qnaNo=#{qnaNo}")
	public void deletereply(QnAVO qvo) throws Exception;
	
	@Update("update tbl_qna set contents=#{contents} where qnaNo=#{qnaNo}")
	public void update(QnAVO qvo) throws Exception;
	
//	@Select("select count(*) totalCount from tbl_qna where depth='a'")
	public PageMaker total(Criteria cri) throws Exception; 
	
	@Select("select tbl_qna.qnaNo qnaNo, tbl_qna.memberNo memberNo, tbl_member.id id, tbl_member.name name, tbl_qna.qna_type qna_type, tbl_qna.title title,"
			+" tbl_qna.contents contents, tbl_qna.regdate regdate, tbl_qna.parent parent, tbl_qna.depth depth, tbl_qna.replycnt replycnt "
			+"from tbl_qna inner join tbl_member on tbl_qna.memberNo = tbl_member.memberNo "
			+ "where qnaNo=#{qnaNo}")
	public QnAVO read(int qnaNo) throws Exception;	//����
	
	//UserMapper
	@Select("select tbl_qna.qnaNo qnaNo, tbl_qna.memberNo memberNo, tbl_member.id id, tbl_member.name name "
			+"from tbl_qna inner join tbl_member on tbl_qna.memberNo = tbl_member.memberNo "
			+"where tbl_member.memberNo=#{memberNo} limit 1")
	public QnAVO memberInfo(int memberNo) throws Exception;
	
	@Insert("insert into tbl_qna (memberNo,qna_type,title,contents,parent,depth) "
			+ "values(#{memberNo},#{qna_type},#{title},#{contents},#{parent},'a')")
	public void createQnA(QnAVO qvo) throws Exception;
	
	@Select("select qnaNo from tbl_qna order by qnaNo desc limit 1")
	public int createQnAParent() throws Exception;
	
	@Update("update tbl_qna set parent=#{parent} where qnaNo=#{parent}")
	public void createQnAUpdate(int parent) throws Exception;
	
	@Update("update tbl_qna set qna_type=#{qna_type}, title=#{title}, contents=#{contents} where qnaNo=#{qnaNo}")
	public void updateUser(QnAVO qvo) throws Exception;
	
	public List<QnAVO> faqList(Criteria cri) throws Exception;
	
	public PageMaker faqTotal(Criteria cri) throws Exception; 
}
