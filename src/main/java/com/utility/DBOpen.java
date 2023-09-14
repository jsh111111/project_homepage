package com.utility;

import java.sql.*;

public class DBOpen {

   public static Connection open() {
      Connection con = null;

      try {
         Class.forName(Constant.DRIVE);
         con = DriverManager.getConnection(Constant.URL, Constant.USER, Constant.PASSWORD);
      } catch (ClassNotFoundException e) {
         // TODO Auto-generated catch block
         System.err.print("ClassNotFoundException: " + e.getMessage());
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         System.out.println("SQLException : " + e.getMessage());
      }

      return con;
   }

}
