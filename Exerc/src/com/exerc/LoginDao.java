package com.exerc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.exerc.LoginBean;

public class LoginDao {
	public boolean validate(LoginBean loginBean) throws ClassNotFoundException {
		boolean status = false;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:8889/mysql_database?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
			.prepareStatement("select * from UserDB where email = ? and pass = ? ")) {
			preparedStatement.setString(1, loginBean.getUsername());
			preparedStatement.setString(2, loginBean.getPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();
			String sql ="set global time_zone='+3:00'"; // xoris auto to query den ginete sosto database connection logo timezone error
			PreparedStatement ps = null;
			ps = connection.prepareStatement(sql);
			ps.executeUpdate();

		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		return status;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
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
