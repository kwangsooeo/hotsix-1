package org.hotsix.notice;

import java.util.Arrays;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {

		private int noticeNo;
		private int viewCnt;
		private String title;
		private String filename;
		private byte[] fileDate;
		private String contents;
		private Date regdate;
		MultipartFile file;
		
		
		
		
		public MultipartFile getFile() {
			return file;
		}
		public void setFile(MultipartFile file) {
			this.file = file;
		}
		public byte[] getFileDate() {
			return fileDate;
		}
		public void setFileDate(byte[] fileDate) {
			this.fileDate = fileDate;
		}
		public int getNoticeNo() {
			return noticeNo;
		}
		public void setNoticeNo(int noticeNo) {
			this.noticeNo = noticeNo;
		}
		public int getViewCnt() {
			return viewCnt;
		}
		public void setViewCnt(int viewCnt) {
			this.viewCnt = viewCnt;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getFilename() {
			return filename;
		}
		public void setFilename(String filename) {
			this.filename = filename;
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
		@Override
		public String toString() {
			return "NoticeVO [noticeNo=" + noticeNo + ", viewCnt=" + viewCnt
					+ ", title=" + title + ", filename=" + filename
					+ ", fileDate=" + Arrays.toString(fileDate) + ", contents="
					+ contents + ", regdate=" + regdate + ", file=" + file
					+ "]";
		}
		
		
	
}
