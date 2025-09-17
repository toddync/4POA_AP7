package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

//import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;

/**
 * Servlet implementation class Students
 */
@WebServlet("/List")
public class List extends HttpServlet {
	private static final String URL = "jdbc:mariadb://localhost:3306/4poa_ap6";
	private static final String USER = "POA";
	private static final String PASSWORD = "PROF_MIGUEL";

	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public List() {
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			ArrayList<Student> students = listAllStudents();
			request.setAttribute("students", students);
		
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
	}

	public ArrayList<Student> listAllStudents() throws SQLException {
		ArrayList<Student> students = new ArrayList<>();
		String sql = "SELECT * FROM Students";

		try {
			Class.forName("org.mariadb.jdbc.Driver");

			try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(sql)) {

				while (rs.next()) {
					Student s = new Student(rs.getInt("Student_ID"), rs.getString("First_Name"),
							rs.getString("Last_Name"), rs.getDate("Date_of_Birth"), rs.getString("Gender"),
							rs.getString("Email"), rs.getString("Phone"), rs.getString("Address"),
							rs.getDate("Enrollment_Date"), rs.getString("Program"), rs.getInt("Year_of_Study"),
							rs.getString("Status"));
					students.add(s);
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return students;
	}
}
