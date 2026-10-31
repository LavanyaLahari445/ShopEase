package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bean.ProductBean;

public class AddProductDDAO {
	public int addProduct(ProductBean pb) {
		Connection con=DBConnection.getcon();
		int rowCount=0;
		try {
			PreparedStatement pstmt=con.prepareStatement("insert into product values(?,?,?,?,?)");
			pstmt.setString(1, pb.getPcode());
			pstmt.setString(2, pb.getPname());
			pstmt.setString(3, pb.getPcompany());
			pstmt.setString(4, pb.getPprice());
			pstmt.setString(5, pb.getPqty());
			rowCount =pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rowCount;
		
	}

}
