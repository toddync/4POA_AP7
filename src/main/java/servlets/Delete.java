package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

//import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Students
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final String URL = "jdbc:mariadb://localhost:3306/4poa_ap6";
	private static final String USER = "POA";
	private static final String PASSWORD = "PROF_MIGUEL";

	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public Delete() {
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");

		if (id != null) {
			try {
				deleteStudent(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		response.sendRedirect(request.getContextPath() + "/List");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
	}

	public boolean deleteStudent(String id) throws SQLException {
		String sql = "DELETE FROM Students WHERE Student_ID = " + id;

		try {
			Class.forName("org.mariadb.jdbc.Driver");

			try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
					PreparedStatement stmt = conn.prepareStatement(sql)) {

				int rowsAffected = stmt.executeUpdate();

				return rowsAffected > 0; // true if at least one row deleted
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
	}

}
