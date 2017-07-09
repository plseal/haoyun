package ssm.blog.controller;


import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller()
public class LoginController {
	
	private static final String USERNAME = "zhiyun";
	private static final String PASSWORD = "123456";
	
	private static Logger logger = Logger.getLogger(LoginController.class);
	
	@RequestMapping("/")
	public String index(){
		return "login";
	}
	
	@RequestMapping(value="/login")
	public ModelAndView login(HttpServletRequest request){
		
		logger.info("["+this.getClass()+"][login][start]");
		
		ModelAndView mv=new ModelAndView("");

		mv.setViewName("login");

		logger.info("["+this.getClass()+"][login][end]");
		
		return mv;
	}
	
	@RequestMapping(value="/login_validate")
	public ModelAndView login_validate(String username,String password,HttpServletRequest request){
		
		logger.info("["+this.getClass()+"][login_validate][start]");
		
		ModelAndView mv=new ModelAndView("");
		if( USERNAME.equals(username)&& PASSWORD.equals(password)){
			request.getSession().setAttribute("user", username);
			mv.setViewName("redirect:/manager/students");
		}else{
			mv.setViewName("forward:/");
			mv.addObject("username",username);
			mv.addObject("message", "username or password error ");
		}
		logger.info("["+this.getClass()+"][login_validate][end]");
		
		return mv;
	}
	
	
	@RequestMapping(value="/loginout",method=RequestMethod.POST)
	public ModelAndView loginOut(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/");
		request.getSession().removeAttribute("user");
		return mv;
	}

}
