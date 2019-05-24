package com.exerc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.exerc.Multi;

public class MultiDao {
	
	public static String concat(String s1, String s2)
	{
		return s1 + s2;
	}
	
	public int registerMulti(Multi multi) throws ClassNotFoundException {
		String INSERT_MULTI_SQL = "INSERT INTO TaskDB" 
	            + "  (email,skillneed, payment,skillneed1, payment1,skillneed2, payment2, description,remote,multtype) VALUES "
				+ " (?,?,?,?,?,?,?,?,?,?);";

		int result = 0;
		Class.forName("com.mysql.jdbc.Driver");
		
		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:8889/mysql_database?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MULTI_SQL)) {
			
			preparedStatement.setString(1, multi.getemail());
			preparedStatement.setString(2, multi.getskillneed());
			preparedStatement.setString(3, multi.getpayment());
			preparedStatement.setString(4, multi.getskillneed1());
			preparedStatement.setString(5, multi.getpayment1());
			preparedStatement.setString(6, multi.getskillneed2());
			preparedStatement.setString(7, multi.getpayment2());
			preparedStatement.setString(8, concat("From Multi-assignment:", multi.getdescription() ));
			preparedStatement.setBoolean(9,multi.getremote());
			preparedStatement.setInt(10,multi.getmulttype());

			
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			result = preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		return result;
	}
	
	private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
