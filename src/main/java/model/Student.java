package model;

import java.util.Date;

public class Student {
	private int studentId;
	private String firstName;
	private String lastName;
	private Date dateOfBirth;
	private String gender;
	private String email;
	private String phone;
	private String address;
	private Date enrollmentDate;
	private String program;
	private int yearOfStudy;
	private String status;

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnrollmentDate() {
		return enrollmentDate;
	}

	public void setEnrollmentDate(Date enrollmentDate) {
		this.enrollmentDate = enrollmentDate;
	}

	public int getYearOfStudy() {
		return yearOfStudy;
	}

	public void setYearOfStudy(int yearOfStudy) {
		this.yearOfStudy = yearOfStudy;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setProgram(String program) {
		this.program = program;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	// Constructor
	public Student(int studentId, String firstName, String lastName, Date dateOfBirth, String gender, String email,
			String phone, String address, Date enrollmentDate, String program, int yearOfStudy, String status) {

		this.studentId = studentId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dateOfBirth = dateOfBirth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.enrollmentDate = enrollmentDate;
		this.program = program;
		this.yearOfStudy = yearOfStudy;
		this.status = status;
	}

	// Getters
	public int getStudentId() {
		return studentId;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getEmail() {
		return email;
	}

	public String getProgram() {
		return program;
	}

	public String getStatus() {
		return status;
	}

	@Override
	public String toString() {
		return studentId + " | " + firstName + " " + lastName + " | " + program + " | " + status;
	}
}
