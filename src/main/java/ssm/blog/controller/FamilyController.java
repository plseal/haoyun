package ssm.blog.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ssm.blog.entity.Family;
import ssm.blog.service.FamilyService;
import ssm.blog.util.JUHEUtil;
import ssm.blog.util.LunarCalendar;
/**
 * @Description 
 * @author songml
 *
 */
@Controller
@RequestMapping("/family")
public class FamilyController {
	private static Logger logger = Logger.getLogger(FamilyController.class);

	
	@Resource(name="familyService")
	private FamilyService familyService;
	
	public static final int pagesize = 10;
	
	@Value("#{setting[STR1]}")
	private String STR1; 

	@Value("#{setting[STR2]}")
	private String STR2; 
	
	@Value("#{setting[STR3]}")
	private String STR3; 
	
	@Value("#{setting[STR4]}")
	private String STR4;
	
	
	@RequestMapping("/get_all")
	public String get_all(
			String c_name,
			HttpServletRequest request) throws Exception {
		logger.info("["+this.getClass()+"][get_all][start]");
		

		List<Family> families = familyService.get_all();
		LunarCalendar.solarToLunar(1984,10,30);
		request.setAttribute("families", families);
		
		//ResponseUtil.write(response, result);
		logger.info("["+this.getClass()+"][get_all][end]");
		return "../../family/main";
	}
	
	@RequestMapping("/update")
	public String update(
			Integer id,
			HttpServletRequest request) throws Exception {
		logger.info("["+this.getClass()+"][update][start]");
		logger.info("["+this.getClass()+"][update][id]"+id);
		Family fa = familyService.get_by_id(id);
		String birth = fa.getBirth();
		logger.info("["+this.getClass()+"][update][birth]"+birth);
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int birth_year = Integer.parseInt(birth.substring(0, 4));
		logger.info("["+this.getClass()+"][update][birth_year]"+birth_year);
		int i_age = year - birth_year;
		String age = String.valueOf(i_age); 
		logger.info("["+this.getClass()+"][update][age]"+age);
		logger.info("["+this.getClass()+"][update][lunar_birth]"+fa.getLunar_birth());
		if (fa.getLunar_birth() == null || fa.getAnimals_year() == null) {
			Family fa2 = JUHEUtil.getRequest1(birth);
			fa.setLunar_birth(fa2.getLunar_birth());
			fa.setAnimals_year(fa2.getAnimals_year());
		}
		
		//lunar_birth2 
		if (fa.getLunar_birth2() == null) {
			int my_year,my_month,my_day;
			my_year = Integer.parseInt(fa.getBirth().split("-")[0]);
			my_month = Integer.parseInt(fa.getBirth().split("-")[1]);
			my_day = Integer.parseInt(fa.getBirth().split("-")[2]);
			logger.info("["+this.getClass()+"][update][my_year]"+my_year);
			logger.info("["+this.getClass()+"][update][my_month]"+my_month);
			logger.info("["+this.getClass()+"][update][my_day]"+my_day);
			int[] out = LunarCalendar.solarToLunar(my_year, my_month, my_day);
			String lunar_birth2 = String.valueOf(out[0] + "-" + out[1] + "-" + out[2]);
			logger.info("["+this.getClass()+"][update][lunar_birth2]"+lunar_birth2);
			fa.setLunar_birth2(lunar_birth2);
		}
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String today = df.format(date);
		fa.setM_date(today);
		
		fa.setAge(age);
		familyService.update(fa);
		
		List<Family> families = familyService.get_all();
		
		request.setAttribute("families", families);
		
		//ResponseUtil.write(response, result);
		logger.info("["+this.getClass()+"][update][end]");
		return "../../family/main";
	}

	
}
