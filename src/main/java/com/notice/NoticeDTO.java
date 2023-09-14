package com.notice;

public class NoticeDTO {
	private int noticeno;// 글 번호
	private String title;// 제목
	private String content;// 내용
	private String wname;// 작성자
	private String passwd;// 패스워드
	private int cnt;// 조회수
	private String rdate;// 등록일

	public NoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticeDTO(int noticeno, String title, String content, String wname, String passwd, int cnt, String rdate) {
		super();
		this.noticeno = noticeno;
		this.title = title;
		this.content = content;
		this.wname = wname;
		this.passwd = passwd;
		this.cnt = cnt;
		this.rdate = rdate;
	}

	@Override
	public String toString() {
		return "NoticDTO [noticeno=" + noticeno + ", title=" + title + ", content=" + content + ", wname=" + wname
				+ ", passwd=" + passwd + ", cnt=" + cnt + ", rdate=" + rdate + "]";
	}

	public int getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
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

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

}
