package USER;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.jdbc.Driver;

public class userDAO {
	String url ="jdbc:mysql://3.34.115.33:3306/ID";
	String id = "Gina";
	String pass = "1111";
	String driver = "com.mysql.jdbc.Driver";
	
	public int login(String uid, String upass) {
		System.out.println("ID: "+ uid);
		System.out.println("PASS: "+ upass);
		
		String sql = "SELECT password FROM user WHERE ID =? ";
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id, pass);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, uid);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(upass)){
					return 1;  //로그인 성공
				}else {
					return 0; //password 틀림
				}
			}
			return -1; //가입되지 않았음
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //db 오류
	}
	
	public int join(userDTO ut) {
		String sql = "insert into user (ID, password, Name, Email, Address) values (?, ?, ?, 'gina@gmail.com' , ?)";
		
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id, pass);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, ut.getSignID());
			psmt.setString(2, ut.getSignPASS());
			psmt.setString(3, ut.getSignName());
			psmt.setString(4, ut.getSignAdd());
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
	
//	public String getName(String uid) {
//		System.out.println("ID: "+ uid);
//		
//		String sql = "SELECT name FROM USER WHERE ID =? ";
//		String name = "";
//		try {
//			Class.forName(driver);
//			Connection con = DriverManager.getConnection(url,id, pass);
//			PreparedStatement psmt = con.prepareStatement(sql);
//			psmt.setString(1, uid);
//			ResultSet rs = psmt.executeQuery();
//			
//			if(rs.next()) {
//				name = rs.getString(1);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return name;
//	}
}
