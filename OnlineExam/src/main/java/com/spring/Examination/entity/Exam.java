package com.spring.Examination.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name = "exam")
public class Exam {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@NotEmpty(message = " * Please enter exam name")
	@Column(name = "exam_name")
	private String examName;

	@NotEmpty(message = " * Please enter exam date")
	@Column(name = "exam_date")
	private String examDate;

	@Digits(message = " * Must be 1 or 2 digit number", fraction = 0, integer = 2)
	@Min(value = 1, message = "Must be equal or greater than 1")
	@Max(value = 23, message = "Must be equal or less than 23")
	@Column(name = "exam_hour")
	private String examHour;

	@Digits(message = " * Must be 1 or 3 digit number", fraction = 0, integer = 2)
	@Min(value = 0, message = "Must be equal or greater than 0")
	@Max(value = 59, message = "Must be equal or less than 59")
	@Column(name = "exam_minute")
	private String examMinute;

	@Digits(message = " * Must be 1 or 3 digit number", fraction = 0, integer = 3)
	@Column(name = "duration_time")
	private String durationTime;

	@Digits(message = " * Must be 1 or 3 digit", fraction = 1, integer = 3)
	@Column(name = "pass_mark")
	private String passMark;

	@Column(name = "created_date_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdDateTime;

	@Column(name = "updated_date_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedDateTime;

	@ManyToMany
	@JoinTable(name = "exam_user", joinColumns = { @JoinColumn(name = "examId") }, inverseJoinColumns = {
			@JoinColumn(name = "userId") })
	private List<User> users = new ArrayList<>();

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "exam_id")
	private List<Question> questions = new ArrayList<>();

	public Exam() {
	}

	public Exam(String examName, String examDate, String examHour, String examMinute, String durationTime,
			String passMark, Date createdDateTime, Date updatedDateTime) {
		super();
		this.examName = examName;
		this.examDate = examDate;
		this.examHour = examHour;
		this.examMinute = examMinute;
		this.durationTime = durationTime;
		this.passMark = passMark;
		this.createdDateTime = createdDateTime;
		this.updatedDateTime = updatedDateTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public String getExamDate() {
		return examDate;
	}

	public void setExamDate(String examDate) {
		this.examDate = examDate;
	}

	public String getExamHour() {
		return examHour;
	}

	public void setExamHour(String examHour) {
		this.examHour = examHour;
	}

	public String getExamMinute() {
		return examMinute;
	}

	public void setExamMinute(String examMinute) {
		this.examMinute = examMinute;
	}

	public String getDurationTime() {
		return durationTime;
	}

	public void setDurationTime(String durationTime) {
		this.durationTime = durationTime;
	}

	public String getPassMark() {
		return passMark;
	}

	public void setPassMark(String passMark) {
		this.passMark = passMark;
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

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

}
