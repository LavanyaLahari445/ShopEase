package com.DAO;

public interface DBInfo {

    static String driver = "oracle.jdbc.OracleDriver";

    static String DBurl = "jdbc:oracle:thin:@localhost:1521:free";

    static String DBUname = System.getenv("ORACLE_DB_USER");

    static String DBUpwd = System.getenv("ORACLE_DB_PASSWORD");
}