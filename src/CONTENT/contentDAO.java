package CONTENT;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class contentDAO {
	String url ="jdbc:mysql://3.34.115.33:3306/ID";
	String id = "Gina";
	String pass = "1111";
	String driver = "com.mysql.jdbc.Driver";
	
	//게시글 목록 조회
		public ArrayList<contentDTO> getList(int page, String field, String query) {
			System.out.println("page : " + page);
			System.out.println("field : " + field);
			System.out.println("query" + query);
			
			int start = 1+(page - 1 )*10;  //(1-1)*10    1  
			int end = 10*page;
			System.out.println("start : "+start);
			System.out.println("end : "+end);
			
			String sql = " SELECT *  "
					+ "  	 FROM (SELECT @rownum:=@rownum+1 num, n.* "
					+ "	  	         FROM  (SELECT * "
					+ "	                      FROM CONTENT "
					+ "						 WHERE AVAILABLE = 1 "
					+ "						   AND "+field+" like ? "
					+ "				         ORDER BY REGDATE DESC)n, "
					+ "	           		   (SELECT @rownum:=0)row)t "
					+ "      WHERE t.num between ? and ? ";

			ArrayList<contentDTO> list = new ArrayList<contentDTO>();
			try {
				Class.forName(driver);
				Connection con = DriverManager.getConnection(url,id, pass);
				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setString(1, "%"+query+"%");
				psmt.setInt(2, start);
				psmt.setInt(3, end);
				System.out.println("sql :" + psmt);
				ResultSet rs = psmt.executeQuery();
				
				while(rs.next()) {
					contentDTO ct = new contentDTO();
					ct.setContentID(rs.getInt("CONTENTID"));
					ct.setTitle(rs.getString("TITLE"));
					ct.setUserID(rs.getString("USERID"));
					ct.setRegdate(rs.getDate("REGDATE"));
					ct.setHit(rs.getInt("HIT"));
					list.add(ct);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list; 
		}
		
		public int getCount(String field, String query) {
			int count =0;
			String sql = " SELECT count(t.CONTENTID)as cnt  "
					+ "  	 FROM (SELECT @rownum:=@rownum+1 num, n.* "
					+ "	  	         FROM  (SELECT * "
					+ "	                      FROM CONTENT "
					+ "						 WHERE AVAILABLE = 1 "
					+ "						   AND "+field+" like ? "
					+ "				         ORDER BY REGDATE DESC)n, "
					+ "	           		   (SELECT @rownum:=0)row)t ";

		
			try {
				Class.forName(driver);
				Connection con = DriverManager.getConnection(url,id, pass);
				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setString(1, "%"+query+"%");
				System.out.println("sql :" + psmt);
				ResultSet rs = psmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt("cnt");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return count; 
		}
		
		//게시글 조회 getContent
		public contentDTO  getContent(int contentID) {		
			String sql = "SELECT * FROM CONTENT WHERE CONTENTID=?";
			contentDTO ct = null;
			try {
				Class.forName(driver);
				Connection con = DriverManager.getConnection(url,id, pass);
				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setInt(1, contentID);
				ResultSet rs = psmt.executeQuery();
				
				if(rs.next()) {
					ct = new contentDTO();
					ct.setContentID(rs.getInt("CONTENTID"));
					ct.setTitle(rs.getString("TITLE"));
					ct.setUserID(rs.getString("USERID"));
					ct.setRegdate(rs.getDate("REGDATE"));
					ct.setContent(rs.getString("CONTENT"));
					ct.setHit(rs.getInt("HIT"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return ct;
		}
		
		//hit 수 증가
		public void addHit(int hit, int contentID) {		
			String sql = "UPDATE CONTENT SET HIT = ?  WHERE CONTENTID = ?";
			int result =0;
			try {
				Class.forName(driver);
				Connection con = DriverManager.getConnection(url,id, pass);
				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setInt(1, hit+1);
				psmt.setInt(2, contentID);
				result = psmt.executeUpdate();
				
				System.out.println(result);
				
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		
		
		//글쓰기 writeContent
		public int writeContent(String userID, String title, String content) {
			String sql = "INSERT INTO CONTENT(TITLE, USERID, CONTENT) VALUES(?, ?, ?)";
			int result =0;
			try {
				Class.forName(driver);
				Connection con = DriverManager.getConnection(url,id, pass);
				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setString(1,title);
				psmt.setString(2,userID);
				psmt.setString(3,content);
				result = psmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
		//글 수정 updateContent
		public int updateContent(int contentID, String title, String content) {	
			System.out.println("c :" + contentID);
			System.out.println("t :" + title);
			System.out.println("cc :" + content);
			String sql = "UPDATE CONTENT SET TITLE = ?, CONTENT= ?  WHERE CONTENTID = ?";
			int result =0;
			try {
				Class.forName(driver);
				Connection con = DriverManager.getConnection(url,id, pass);
				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setString(1, title);
				psmt.setString(2, content);
				psmt.setInt(3, contentID);
				result = psmt.executeUpdate();
				
				System.out.println(result);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
		
		//게시글 삭제 delContent
		public int delContent(int contentID) {		
			String sql = "UPDATE CONTENT SET AVAILABLE = 2 WHERE CONTENTID = ?";
			int result =0;
			try {
				Class.forName(driver);
				Connection con = DriverManager.getConnection(url,id, pass);
				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setInt(1, contentID);
				result = psmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
	}
