package ssm.blog.controller;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ssm.blog.entity.ChildHealthRecord;
import ssm.blog.entity.Message;
import ssm.blog.entity.SexType;
import ssm.blog.service.BlogTypeService;
import ssm.blog.service.ChildHealthRecordService;
import ssm.blog.util.WeixinUtil;

/**
 * @Description Controller
 * @author songml
 *
 */
@Controller
@RequestMapping("/child_health_record")
public class ChildHealthRecordController {
	private static Logger logger = Logger.getLogger(ChildHealthRecordController.class);
	@Resource
	private ChildHealthRecordService childHealthRecordService;
	@Resource
	private BlogTypeService blogTypeService;
	/**
	 * @Description 
	 * @return
	 */
	@RequestMapping("/to_child_health_record_manage")
	public ModelAndView to_child_health_record_manage(
			@RequestParam(value = "typeId", required = false) String typeId,
			@RequestParam(value = "releaseDateStr", required = false) String releaseDateStr,
			HttpServletRequest request) throws Exception {
		
		logger.info("["+this.getClass()+"][to_child_health_record_manage][start]");
		
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String openid = (String)session.getAttribute("openid");
		logger.info("["+this.getClass()+"][to_child_health_record_manage][openid]"+openid);

		String hid_flg = request.getParameter("hid_flg");
		String id = request.getParameter("id");
		logger.info("["+this.getClass()+"][to_child_health_record_manage][hid_flg]"+hid_flg);
		ChildHealthRecord chr = new ChildHealthRecord();
		chr.setWeixin_openid(openid);
		chr.setId(id);
		chr.setChild_name(request.getParameter("child_name"));
		chr.setChild_sex(request.getParameter("child_sex"));
		chr.setChild_birth(request.getParameter("hid_child_birth"));
		chr.setChild_age(request.getParameter("child_age"));
		chr.setChild_height(request.getParameter("child_height"));
		chr.setChild_weight(request.getParameter("child_weight"));
		chr.setUpdate_date(request.getParameter("update_date"));
		
		if ("update".equals(hid_flg)) {
			childHealthRecordService.update_chr(chr);
		} else if ("insert".equals(hid_flg)) {
			childHealthRecordService.insert_chr(chr);
		}
		//init情况下什么也不做
		
		
		mv.setViewName("child_health_record_manage");
		
		
		
		
		
		List<ChildHealthRecord> child_health_record_list = childHealthRecordService.get_one_child_records(chr);

		mv.addObject("child_health_record_list", child_health_record_list);
		mv.addObject("openid", openid);
		logger.info("["+this.getClass()+"][to_child_health_record_manage][end]");
		return mv;

	}
	
	/**
	 * @Description 
	 * @return
	 */
	@RequestMapping("/to_insert_chr")
	public ModelAndView to_insert_chr(
			@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "typeId", required = false) String typeId,
			@RequestParam(value = "releaseDateStr", required = false) String releaseDateStr,
			HttpServletRequest request) throws Exception {
		
		logger.info("["+this.getClass()+"][to_insert_chr][start]");

		
		ModelAndView mv = new ModelAndView();
		

		//性别
		List<SexType> sexTypeList = new ArrayList<SexType>();
		SexType sexType = new SexType();
		sexType.setId(1);
		sexType.setTypeName("男");
		sexTypeList.add(sexType);
		SexType sexType2 = new SexType();
		sexType2.setId(0);
		sexType2.setTypeName("女");
		sexTypeList.add(sexType2);
		mv.addObject("sexTypeList", sexTypeList);
		HttpSession session = request.getSession();
		String openid = (String)session.getAttribute("openid");
		logger.info("["+this.getClass()+"][to_insert_chr][openid]"+openid);

		mv.setViewName("child_health_record_insert");
		
		
		
		logger.info("["+this.getClass()+"][to_insert_chr][end]");
		return mv;

	}
	
	/**
	 * @Description 
	 * @return
	 */
	@RequestMapping("/to_update_chr")
	public ModelAndView to_update_chr(
			@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "chr_id", required = false) String chr_id,
			@RequestParam(value = "releaseDateStr", required = false) String releaseDateStr,
			HttpServletRequest request) throws Exception {
		
		logger.info("["+this.getClass()+"][to_update_chr][start]");
		logger.info("["+this.getClass()+"][to_update_chr][chr_id]"+chr_id);
		
		
		ModelAndView mv = new ModelAndView();
		ChildHealthRecord chr_in = new ChildHealthRecord();
		chr_in.setId(chr_id);
		ChildHealthRecord chr_out = childHealthRecordService.get_one_chr_byid(chr_in);

		mv.addObject("chr_out", chr_out);

		//性别
		List<SexType> sexTypeList = new ArrayList<SexType>();
		SexType sexType = new SexType();
		sexType.setId(1);
		sexType.setTypeName("男");
		sexTypeList.add(sexType);
		SexType sexType2 = new SexType();
		sexType2.setId(0);
		sexType2.setTypeName("女");
		sexTypeList.add(sexType2);
		mv.addObject("sexTypeList", sexTypeList);
		HttpSession session = request.getSession();
		String openid = (String)session.getAttribute("openid");
		logger.info("["+this.getClass()+"][to_insert_chr][openid]"+openid);
		mv.setViewName("child_health_record_update");
		
		
		
		logger.info("["+this.getClass()+"][to_update_chr][end]");
		return mv;

	}
	
	/**
	 * @Description 
	 * @return
	 */
	@RequestMapping("/to_delete_chr")
	public ModelAndView to_delete_chr(
			@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "chr_id", required = false) String chr_id,
			@RequestParam(value = "releaseDateStr", required = false) String releaseDateStr,
			HttpServletRequest request) throws Exception {
		
		logger.info("["+this.getClass()+"][to_delete_chr][start1]");
		ModelAndView mv = new ModelAndView();
		
		logger.info("["+this.getClass()+"][to_delete_chr][chr_id]"+chr_id);
		
		
		HttpSession session = request.getSession();
		String openid = (String)session.getAttribute("openid");
		logger.info("["+this.getClass()+"][to_insert_chr][openid]"+openid);
		mv.setViewName("forward:to_child_health_record_manage.do");
		ChildHealthRecord chr = new ChildHealthRecord();
		chr.setId(chr_id);
		chr.setWeixin_openid(openid);
		childHealthRecordService.delete_chr(chr);
		
		logger.info("["+this.getClass()+"][to_delete_chr][end1]");
		return  mv;

	}
}
