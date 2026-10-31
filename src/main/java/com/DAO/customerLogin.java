package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

import com.bean.CustomerLoginBean;


public class customerLogin {
public static CustomerLoginBean checkLogin(String uname,String upwd) {
	Connection con=DBConnection.getcon();
	CustomerLoginBean cb=null;
	try {
		PreparedStatement pstmt=con.prepareStatement("select * from customerdetail where USERNAME=? and PASSWORD=?");
		pstmt.setString(1, uname);
		pstmt.setString(2,upwd);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) {
			cb=new CustomerLoginBean();
			cb.setCuname(rs.getString(1));
			cb.setCpwd(rs.getString(2));
			cb.setCfname(rs.getString(3));
			cb.setClname(rs.getString(4));
			cb.setCaddr(rs.getString(5));
			cb.setCmid(rs.getString(6));
			
			
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return cb;
	
	
}
}
