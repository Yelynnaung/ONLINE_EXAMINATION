package com.spring.Examination.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.Examination.entity.Exam;
import com.spring.Examination.entity.ExamResult;
import com.spring.Examination.service.ExamResultService;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Controller
@RequestMapping("/examResult")
public class ExamResultController {

	@Autowired
	private ExamResultService examResultService;

	@GetMapping("/")
	public String examResult(Model model) {
		List<ExamResult> examResultList = examResultService.getExamResultList();
		model.addAttribute("exam", new Exam());
		model.addAttribute("examResultList", examResultList);
		return "examResults";
	}

	@GetMapping("/viewResult/{examId}/{examDate}/{hour}/{min}")
	private String viewResult(@PathVariable("examId") int examId, @PathVariable("examDate") String date,
			@PathVariable("hour") int hour, @PathVariable("min") int min, Model model,HttpSession session) {

		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		@SuppressWarnings("deprecation")
		String examDate = dateFormat.format(new Date(date)).toString();
		List<ExamResult> examResultList = examResultService.getExamResultListByExamIdAndExamDateAndHourAndMin(examId,
				examDate, Integer.toString(hour), Integer.toString(min));

		
		model.addAttribute("examResultList", examResultList);
		session.setAttribute("examResultList", examResultList);
		return "examResult";
	}
	
	@PostMapping("/search")
	public String exam(@ModelAttribute("exam") Exam exam, Model model) {		
		List<ExamResult> examResultList = examResultService.getExamResultByConditions(exam.getExamName(),exam.getExamDate());
		model.addAttribute("examResultList", examResultList);
		return "examResults";
	}

	@SuppressWarnings("unchecked")
	@GetMapping("/exportPDF")
	public void exportPDF(HttpSession session , HttpServletResponse response) throws JRException, IOException {
		List<ExamResult> examResultList = (List<ExamResult>) session.getAttribute("examResultList");
		//param
		HashMap<String, Object> params = new HashMap<String, Object	>();
		params.put("title", "Exam Report");
		//cds
		JRBeanCollectionDataSource cds = new JRBeanCollectionDataSource(examResultList);
		//Jprint
		JasperReport jasperReport =  JasperCompileManager.compileReport(new FileInputStream("src/main/resources/exam_report.jrxml"));
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params ,cds);
		//out
		response.setContentType("application/x-download");
		response.setHeader("Content-Disposition", String.format("attachent;filename=\"exam_report.pdf\""));		
		OutputStream out = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, out);  
	}
}
