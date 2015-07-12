package org.hotsix.contents;

import java.util.Date;

import org.hotsix.job.JobVO;

/*
 * 
 * create table tbl_contents(

     contentsNo int not null auto_increment,
     regdate CURRENT_TIMESTAMP not null default NOW,
	 jobNo int not null,
	 FOREGIN KEY(jobNo) REFERENCES tbl_job(jobNo)
     )
 */
public class ContentsVO extends JobVO{
	
	private int jobNo;
	private int contentsNo;
	private String link;
	private Date regdate;
	
	
	
	@Override
	public int getJobNo() {
		// TODO Auto-generated method stub
		return super.getJobNo();
	}
	@Override
	public void setJobNo(int jobNo) {
		// TODO Auto-generated method stub
		super.setJobNo(jobNo);
	}
	public int getContentsNo() {
		return contentsNo;
	}
	public void setContentsNo(int contetnsNo) {
		this.contentsNo = contetnsNo;
	}
	
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "ContentsVO [jobNo=" + jobNo + ", contentsNo=" + contentsNo
				+ ", link=" + link + ", regdate=" + regdate + "]";
	}
	
	

}
