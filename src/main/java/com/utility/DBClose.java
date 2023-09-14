package com.utility;

import java.sql.*;

public class DBClose {

   public static void close(Connection con) {
      try {
         if (con != null) {
            con.close();
         }

      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public static void close(PreparedStatement pstat, Connection con) {
      try {
         if (pstat != null) {
            pstat.close();
         }

         if (con != null) {
            con.close();
         }

      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public static void close(ResultSet rs, PreparedStatement pstat, Connection con) {
      try {
         if (rs != null) {
            rs.close();
         }

         if (pstat != null) {
            pstat.close();
         }

         if (con != null) {
            con.close();
         }

      } catch (Exception e) {
         e.printStackTrace();
      }

   }
}
