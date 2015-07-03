package org.hotsix.notice;

import java.util.Arrays;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {

      private int noticeNo;
      private int viewCnt;
      private String title;
      
      private String fileName;
      private String fileType;
      private long fileSize;
      private String dataURL;
      private String contents;
      private Date regdate;
      
      
      public String getFileName() {
         return fileName;
      }
      public void setFileName(String fileName) {
         this.fileName = fileName;
      }
      public String getFileType() {
         return fileType;
      }
      public void setFileType(String fileType) {
         this.fileType = fileType;
      }
      public long getFileSize() {
         return fileSize;
      }
      public void setFileSize(long fileSize) {
         this.fileSize = fileSize;
      }
      public String getDataURL() {
         return dataURL;
      }
      public void setDataURL(String dataURL) {
         this.dataURL = dataURL;
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
               + ", title=" + title + ", fileName=" + fileName
               + ", fileType=" + fileType + ", fileSize=" + fileSize
               + ", dataURL=" + dataURL + ", contents=" + contents
               + ", regdate=" + regdate + "]";
      }
      
      
   
}