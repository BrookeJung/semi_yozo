package com.que_board.dto;

import java.sql.Date;

public class QueBoardDto {
	private int boardno;
	private int groupno;
	private int groupsq;
	private int replyno;
	private String secflag;
	private String writer;
	private String title;
	private String content;
	private Date regdate;
	
	
	
	public QueBoardDto() {
		super();
	}
	public QueBoardDto(int boardno, int groupno, int groupsq, int replyno, String secflag, String writer, String title,
			String content, Date regdate) {
		super();
		this.boardno = boardno;
		this.groupno = groupno;
		this.groupsq = groupsq;
		this.replyno = replyno;
		this.secflag = secflag;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public int getGroupno() {
		return groupno;
	}
	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}
	public int getGroupsq() {
		return groupsq;
	}
	public void setGroupsq(int groupsq) {
		this.groupsq = groupsq;
	}
	public int getReplyno() {
		return replyno;
	}
	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}
	public String getSecflag() {
		return secflag;
	}
	public void setSecflag(String secflag) {
		this.secflag = secflag;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
