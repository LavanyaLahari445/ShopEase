package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bean.CustomerLoginBean;

public class customerRegistrationDAO {
	public int customerRegistration(CustomerLoginBean cb) {
		Connection con=DBConnection.getcon();
		int row=0;
		try {
			PreparedStatement pstmt=con.prepareStatement("insert into customerdetail values(?,?,?,?,?,?)");
			pstmt.setString(1, cb.getCuname());
			pstmt.setString(2, cb.getCpwd());
			pstmt.setString(3, cb.getCfname());
			pstmt.setString(4, cb.getClname());
			pstmt.setString(5, cb.getCaddr());
			pstmt.setString(6, cb.getCmid());
			row=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row;
		
	}

}
