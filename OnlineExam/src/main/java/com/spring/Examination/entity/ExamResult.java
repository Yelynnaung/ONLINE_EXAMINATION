package com.spring.Examination.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "exam_result")
public class ExamResult {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private int examId;

	private int userId;

	private String userName;

	private String examName;

	private String examDate;

	private String examHour;

	private String examMin;

	private String durationTime;

	private String passMark;

	private String marks;

	private String passStatus;

	public ExamResult() {
	}

	public ExamResult(int examId, int userId, String userName, String examName, String examDate, String examHour,
			String examMin, String durationTime, String passMark, String marks, String passStatus) {
		super();
		this.examId = examId;
		this.userId = userId;
		this.userName = userName;
		this.examName = examName;
		this.examDate = examDate;
		this.examHour = examHour;
		this.examMin = examMin;
		this.durationTime = durationTime;
		this.passMark = passMark;
		this.marks = marks;
		this.passStatus = passStatus;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public String getExamMin() {
		return examMin;
	}

	public void setExamMin(String examMin) {
		this.examMin = examMin;
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

	public String getMarks() {
		return marks;
	}

	public void setMarks(String marks) {
		this.marks = marks;
	}

	public String getPassStatus() {
		return passStatus;
	}

	public void setPassStatus(String passStatus) {
		this.passStatus = passStatus;
	}

}
