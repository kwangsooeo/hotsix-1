package org.hotsix.qna;

import java.sql.Date;

import org.hotsix.member.MemberVO;

public class QnAVO extends MemberVO{
	private int qnaNo;
	private int memberNo;
	private String title;
	private String contents;
	private Date regdate;
	private String qna_type;
	private int parent;
	private String depth;
	private int replycnt;

	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getQna_type() {
		return qna_type;
	}
	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	@Override
	public String toString() {
		return "QnAVO [qnaNo=" + qnaNo + ", memberNo=" + memberNo + ", title="
				+ title + ", contents=" + contents + ", regdate=" + regdate
				+ ", qna_type=" + qna_type + ", parent=" + parent + ", depth="
				+ depth + ", replycnt=" + replycnt + "]";
	}

}
