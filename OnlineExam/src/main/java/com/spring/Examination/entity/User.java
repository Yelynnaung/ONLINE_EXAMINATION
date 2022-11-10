package com.spring.Examination.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Table(name = "user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@NotEmpty(message = " * Please enter username")
	@Column(name = "username")
	private String username;

	@NotEmpty(message = " * Please enter email")
	@Email(message = " * Email must be valid")
	@Column(name = "email")
	private String email;

	@Pattern(regexp = "^.*(?=.{6,})(?=.*[a-zA-Z])(?=.*\\d)(?=.*[!#$%&?@ \"]).*$", message = " * Password must contain number,char and special char more than 6")
	@Column(name = "password")
	private String password;

	@Pattern(regexp = "^[09]+[0-9]{9}$", message = " * Phone must be valid")
	@Column(name = "phone")
	private String phone;

	@Digits(message = " * Must be 1 or 2 digit number", fraction = 0, integer = 2)
	@Column(name = "age")
	private String age;

	@Column(name = "gender")
	private String gender;

	@NotEmpty(message = " * Please enter dob")
	@Column(name = "dob")
	private String dob;

	@NotEmpty(message = " * Please enter address")
	@Size(max = 100, message = "No more than 100 character")
	@Column(name = "address")
	private String address;

	@Column(name = "role")
	private String role;

	@Column(name = "photo")
	private String photo;

	@Column(name = "created_date_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdDateTime;

	@Column(name = "updated_date_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedDateTime;

	@ManyToMany(mappedBy = "users", fetch = FetchType.EAGER)
	private List<Exam> exams = new ArrayList<>();

	public User() {
	}

	public User(String name, String username, String password, String confirmPassword, String email, String phone,
			String age, String gender, String dob, String address, String role, String photo, Date createdDateTime,
			Date updatedDateTime) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.age = age;
		this.gender = gender;
		this.dob = dob;
		this.address = address;
		this.role = role;
		this.photo = photo;
		this.createdDateTime = createdDateTime;
		this.updatedDateTime = updatedDateTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Date getCreatedDateTime() {
		return createdDateTime;
	}

	public void setCreatedDateTime(Date createdDateTime) {
		this.createdDateTime = createdDateTime;
	}

	public Date getUpdatedDateTime() {
		return updatedDateTime;
	}

	public void setUpdatedDateTime(Date updatedDateTime) {
		this.updatedDateTime = updatedDateTime;
	}

	public List<Exam> getExams() {
		return exams;
	}

	public void setExams(List<Exam> exams) {
		this.exams = exams;
	}
}
