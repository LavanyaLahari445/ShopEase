package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteProductDAO {
	public int DeleteProduct(String pcode) {
		Connection con=DBConnection.getcon();
		int rowCount=0;
		try {
			PreparedStatement pstmt=con.prepareStatement("delete from product where pcode=?");
			pstmt.setString(1, pcode);
			rowCount=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rowCount;
		
	}

}
