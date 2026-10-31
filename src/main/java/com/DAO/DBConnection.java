package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static Connection con =null;
    static {
    	try {
			Class.forName(DBInfo.driver);
			con=DriverManager.getConnection(DBInfo.DBurl,DBInfo.DBUnmae,DBInfo.DBupwd);
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
    }
    public static Connection getcon() {
		return con;
	}
	

}
