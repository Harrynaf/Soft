package com.exerc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.exerc.Task;


public class TaskDao {
	
	public int registerTask(Task task) throws ClassNotFoundException {
		String INSERT_TASKS_SQL = "INSERT INTO TaskDB" 
	            + "  (email,skillneed, payment, description,remote) VALUES "
				+ " (?,?, ?, ?,?);";

		int result = 0;
		Class.forName("com.mysql.jdbc.Driver");
		
		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:8889/mysql_database?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TASKS_SQL)) {
			preparedStatement.setString(1, task.getemail());
			preparedStatement.setString(2, task.getskillneed());
			preparedStatement.setString(3, task.getpayment());
			preparedStatement.setString(4, task.getdescription());
			preparedStatement.setBoolean(5, task.getremote());

			
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
