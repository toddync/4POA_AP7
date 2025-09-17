package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final String URL = "jdbc:mariadb://localhost:3306/4poa_ap6";
	private static final String USER = "POA";
	private static final String PASSWORD = "PROF_MIGUEL";

	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public Update() {
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");

		if (id != null) {
			Student student = null;
			try {
				student = getStudent(id);
				request.setAttribute("student", student);
				request.getRequestDispatcher("/update.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.sendRedirect(request.getContextPath() + "/List");
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/List");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Handle form submission to insert a student (POST)
		request.setCharacterEncoding("UTF-8");

		int id = Integer.parseInt(request.getParameter("id"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String dob = request.getParameter("dateOfBirth");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String enrollmentDate = request.getParameter("enrollmentDate");
		String program = request.getParameter("program");
		String yearOfStudyStr = request.getParameter("yearOfStudy");
		String status = request.getParameter("status");

		// Minimal validation
		if (firstName == null || firstName.isEmpty() || lastName == null || lastName.isEmpty() || email == null
				|| email.isEmpty() || program == null || program.isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required fields");
			return;
		}

		int yearOfStudy = 0;
		try {
			if (yearOfStudyStr != null && !yearOfStudyStr.isEmpty())
				yearOfStudy = Integer.parseInt(yearOfStudyStr);
		} catch (NumberFormatException e) {
			yearOfStudy = 0;
		}

		String updateSql = "UPDATE Students SET First_Name = ?, Last_Name = ?, Date_of_Birth = ?, Gender = ?, Email = ?, Phone = ?, Address = ?, Enrollment_Date = ?, Program = ?, Year_of_Study = ?, Status = ? WHERE Student_ID = ?";

		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
				PreparedStatement ps = conn.prepareStatement(updateSql)) {

			ps.setString(1, firstName);
			ps.setString(2, lastName);
			if (dob != null && !dob.isEmpty())
				ps.setDate(3, java.sql.Date.valueOf(dob));
			else
				ps.setNull(3, java.sql.Types.DATE);

			// Normalize gender to DB enum labels: Male, Female, Other
			// Debug log raw and normalized gender
			String rawGender = request.getParameter("gender");
			getServletContext().log("Raw gender param: '" + rawGender + "'");
			if (gender != null) {
				String g = gender.trim().toLowerCase();
				if (g.startsWith("m")) {
					gender = "Male";
				} else if (g.startsWith("f")) {
					gender = "Female";
				} else if (g.startsWith("o")) {
					gender = "Other";
				} else {
					gender = null;
				}
			}
			getServletContext().log("Normalized gender to: '" + gender + "'");
			if (gender != null) {
				ps.setString(4, gender);
			} else {
				ps.setNull(4, java.sql.Types.VARCHAR);
			}
			ps.setString(5, email);
			ps.setString(6, phone);
			ps.setString(7, address);
			if (enrollmentDate != null && !enrollmentDate.isEmpty())
				ps.setDate(8, java.sql.Date.valueOf(enrollmentDate));
			else
				ps.setNull(8, java.sql.Types.DATE);
			ps.setString(9, program);
			ps.setInt(10, yearOfStudy);
			if (status != null && !status.isEmpty()) {
				ps.setString(11, status);
			} else {
				ps.setNull(11, java.sql.Types.VARCHAR);
			}

			ps.setInt(12, id);

			ps.executeUpdate();

			// Redirect to GET to show updated list (Post/Redirect/Get)
			response.sendRedirect(request.getContextPath() + "/List");

		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}

	public Student getStudent(String id) throws SQLException {
		Student student = null;
		String sql = "SELECT * FROM Students WHERE Student_ID = " + id;

		try {
			Class.forName("org.mariadb.jdbc.Driver");

			try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(sql)) {

				while (rs.next()) {
					student = new Student(rs.getInt("Student_ID"), rs.getString("First_Name"),
							rs.getString("Last_Name"), rs.getDate("Date_of_Birth"), rs.getString("Gender"),
							rs.getString("Email"), rs.getString("Phone"), rs.getString("Address"),
							rs.getDate("Enrollment_Date"), rs.getString("Program"), rs.getInt("Year_of_Study"),
							rs.getString("Status"));
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return student;
	}
}
