package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bean.AdminLoginBean;

public class AdminLoginDAO {
	AdminLoginBean ab=null;
	public AdminLoginBean checkLogin(String uname,String password) {
		Connection con=DBConnection.getcon();
		try {
			PreparedStatement pstmt =con.prepareStatement("select * from Admin where uname=? and pword=?");
			pstmt.setString(1,uname);
			pstmt.setString(2,password);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				ab=new AdminLoginBean();
				ab.setUname(rs.getString(1));
				ab.setPwd(rs.getString(2));
				ab.setFname(rs.getString(3));
				ab.setLname(rs.getString(4));
				ab.setAddr(rs.getString(5));
				ab.setMid(rs.getString(6));
				ab.setPhno(rs.getString(7));
				
				
			}
			
		} catch (SQLException e) {
			IO.println("problem");
			e.printStackTrace();
		}
		IO.println("all good");
		
		return ab;
		
		
	}
}
