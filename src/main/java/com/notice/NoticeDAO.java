package com.notice;

import java.sql.*;
import java.util.*;

import com.utility.DBClose;
import com.utility.DBOpen;

public class NoticeDAO {

//	public void upAnsnum(Map map) {
//		Connection con = DBOpen.open();
//		PreparedStatement pstmt = null;
//		StringBuffer sql = new StringBuffer();
//
//		int grpno = (Integer) map.get("grpno");
//		int ansnum = (Integer) map.get("ansnum");
//
//		sql.append(" update notice ");
//		sql.append(" set ansnum = ansnum + 1 ");
//		sql.append(" where grpno = ? ");
//		sql.append(" and ansnum > ? ");
//
//		try {
//			pstmt = con.prepareStatement(sql.toString());
//			pstmt.setInt(1, grpno);
//			pstmt.setInt(2, ansnum);
//			pstmt.executeUpdate();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			DBClose.close(pstmt, con);
//		}
//	}

	public boolean createReply(NoticeDTO dto) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" insert into notice(wname, title, content, passwd, rdate) ");
		sql.append(" values(?, ?, ?, ?, sysdate()) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

//	public NoticDTO readReply(int noticeno) {
//		NoticDTO dto = null;
//
//		Connection con = DBOpen.open();
//		PreparedStatement pstmt = null;
//		StringBuffer sql = new StringBuffer();
//		ResultSet rs = null;
//
//		sql.append(" select noticeno, grpno, indent, ansnum, title ");
//		sql.append(" from notice ");
//		sql.append(" where noticeno = ? ");
//
//		try {
//			pstmt = con.prepareStatement(sql.toString());
//			pstmt.setInt(1, noticeno);
//
//			rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				dto = new NoticDTO();
//				dto.setnoticeno(rs.getInt("noticeno"));
//				dto.setGrpno(rs.getInt("grpno"));
//				dto.setIndent(rs.getInt("indent"));
//				dto.setAnsnum(rs.getInt("ansnum"));
//				dto.setTitle(rs.getString("title"));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			DBClose.close(rs, pstmt, con);
//		}
//
//		return dto;
//	}

	public boolean delete(int noticeno) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" DELETE FROM notice ");
		sql.append(" WHERE noticeno=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, noticeno);

			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

	public boolean passCheck(Map map) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		ResultSet rs = null;

		int noticeno = (Integer) map.get("noticeno");
		String passwd = (String) map.get("passwd");

		sql.append(" SELECT COUNT(noticeno) as cnt ");
		sql.append(" FROM notice ");
		sql.append(" WHERE noticeno=? AND passwd=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, noticeno);
			pstmt.setString(2, passwd);

			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt("cnt");

			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return flag;
	}

	public boolean update(NoticeDTO dto) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE notice ");
		sql.append(" SET wname = ?, ");
		sql.append(" 	 title   = ?, ");
		sql.append(" 	 content = ? ");
		sql.append(" WHERE noticeno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getNoticeno());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

	public NoticeDTO read(int noticeno) {
		NoticeDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT noticeno, wname, title, content, cnt, rdate ");
		sql.append(" FROM notice ");
		sql.append(" WHERE noticeno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, noticeno);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new NoticeDTO();
				dto.setNoticeno(rs.getInt("noticeno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setRdate(rs.getString("rdate"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return dto;
	}

	public void upViewcnt(int noticeno) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" UPDATE notice ");
		sql.append(" SET cnt = cnt + 1 ");
		sql.append(" WHERE noticeno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, noticeno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

	}

	public int total(String col, String word) {
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from notice ");

		if (word.trim().length() > 0 && col.equals("title_content")) {
			sql.append(" where title concat('%',?,'%') ");
			sql.append(" or content like concat('%',?,'%') ");
		} else if (word.trim().length() > 0) {
			sql.append(" where " + col + " like concat('%',?,'%') ");
		}
		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0 && col.equals("title_content")) {
				pstmt.setString(1, word);
				pstmt.setString(2, word);
			} else if (word.trim().length() > 0) {
				pstmt.setString(1, word);
			}
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return total;
	}

	public boolean create(NoticeDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into notice(wname, title, content, passwd, rdate) ");
		sql.append(" values(?,?,?,?,sysdate()) ");
		// sql.append(" (select ifnull(max(grpno),0) + 1 FROM notice b)) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());

			int icnt = pstmt.executeUpdate();

			if (icnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

	public List<NoticeDTO> list(Map map) {
		List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (int) map.get("sno");
		int eno = (int) map.get("eno");

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT noticeno, title, wname, cnt, rdate");
		sql.append(" FROM notice ");
		if (word.trim().length() > 0 && col.equals("title_content")) {
			sql.append(" where title like concat('%' , ? , '%')  ");
			sql.append(" or content like concat('%' , ? , '%')  ");
		} else if (word.trim().length() > 0) {
			sql.append(" where " + col + " like concat('%' , ? , '%')  ");
		}

		try {
			pstmt = con.prepareStatement(sql.toString());
			int i = 0;
			if (word.trim().length() > 0 && col.equals("title_content")) {
				pstmt.setString(++i, word);
				pstmt.setString(++i, word);
			} else if (word.trim().length() > 0) {
				pstmt.setString(++i, word);
			}
//			pstmt.setInt(++i, sno);
//			pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				dto.setNoticeno(rs.getInt("noticeno"));
				dto.setTitle(rs.getString("title"));
				dto.setWname(rs.getString("wname"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setRdate(rs.getString("rdate"));

				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return list;
	}

	public List<NoticeDTO> list() {
		// TODO Auto-generated method stub
		return null;
	}
}
