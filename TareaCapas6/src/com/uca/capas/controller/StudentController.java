package com.uca.capas.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.dao.StudentDAO;
import com.uca.capas.domain.Student;

@Controller
public class StudentController {
	
	@Autowired
	private StudentDAO studentDao;
	
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public ModelAndView insert() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("student",new Student());
		mav.setViewName("form");
		return mav;
	}
	
	@RequestMapping("/formData")
	public ModelAndView save(@ModelAttribute Student s){
		ModelAndView mav = new ModelAndView();
		List<Student> students = null;
		try {
		 studentDao.save(s,1);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		students = studentDao.findAll();
		mav.addObject("students",students);
		mav.setViewName("main");
		return mav;
	}
	

	@RequestMapping(value="/saveStudent", method = RequestMethod.POST)
	public ModelAndView saveCliente(@Valid @ModelAttribute("student") Student s, BindingResult r){
		ModelAndView mav = new ModelAndView();
		if(r.hasErrors()){
			mav.addObject("resultado", 0);
			mav.setViewName("editStudent");
		}
		else{
			studentDao.save(s,0); 
			mav.addObject("resultado", 1);
			mav.setViewName("editStudent");
		}
		return mav;
	}
	
	@RequestMapping("/editarEstudiante")
	public ModelAndView editarCliente(@RequestParam("cStudent") Integer cStudent){
		ModelAndView mav = new ModelAndView();
		Student student = studentDao.findOne(cStudent);
		mav.addObject("student", student);
		mav.setViewName("editStudent");
		return mav;
	}
	
	
}
