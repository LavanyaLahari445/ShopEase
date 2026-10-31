package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bean.ProductBean;

public class UpdateProduct {
    public int UpdateProduct(ProductBean pb) {
        int rowCount = 0;

        Connection con = DBConnection.getcon();

        try {
            PreparedStatement pstmt = con.prepareStatement(
                "update product set pprice=?, pqty=? where pcode=?"
            );

            pstmt.setString(1, pb.getPprice());
            pstmt.setString(2, pb.getPqty());
            pstmt.setString(3, pb.getPcode()); 

            rowCount = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowCount;
    }
}