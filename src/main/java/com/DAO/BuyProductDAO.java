package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bean.CustomerLoginBean;
import com.bean.ProductBean;

public class BuyProductDAO {
	public ProductBean ProductDetails(String pcode) {
		Connection con=DBConnection.getcon();
		ProductBean pb=null;
		try {
			PreparedStatement pstmt=con.prepareStatement("select * from product where PCODE=?");
			pstmt.setString(1, pcode);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				pb=new ProductBean();
				pb.setPcode(rs.getString(1));
				pb.setPname(rs.getString(2));
				pb.setPcompany(rs.getString(3));
				pb.setPprice(rs.getString(4));
				pb.setPqty(rs.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pb;
		
	}
	

}
