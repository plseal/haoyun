package ssm.blog.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ssm.blog.entity.Blog;
import ssm.blog.entity.BlogType;
import ssm.blog.entity.PageBean;
import ssm.blog.entity.SexType;
import ssm.blog.entity.ChildHealthRecord;

import ssm.blog.service.BlogService;
import ssm.blog.service.BlogTypeService;
import ssm.blog.service.ChildHealthRecordService;

import ssm.blog.util.PageUtil;
import ssm.blog.util.StringUtil;

/**
 * @Description Controller
 * @author songml
 *
 */
@Controller
@RequestMapping("/")
public class IndexController {
	private static Logger logger = Logger.getLogger(IndexController.class);
	@Resource
	private BlogService blogService;
	@Resource
	private BlogTypeService blogTypeService;
	@Resource
	private ChildHealthRecordService childHealthRecordService;
	/**
	 * @Description 
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView index(
			@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "typeId", required = false) String typeId,
			@RequestParam(value = "releaseDateStr", required = false) String releaseDateStr,
			HttpServletRequest request) throws Exception {
		
		logger.info("["+this.getClass()+"][index][start]");
		
		ModelAndView modelAndView = new ModelAndView();

		if (StringUtil.isEmpty(page)) {
			page = "1";
		}

		PageBean pageBean = new PageBean(Integer.parseInt(page), 10); 
		if (typeId == null) {
			typeId ="1";
		} 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", pageBean.getStart());
		map.put("pageSize", pageBean.getPageSize());
		map.put("typeId", typeId);
		map.put("releaseDateStr", releaseDateStr);


		List<Blog> blogList = blogService.listBlog(map);		

		for(Blog blog : blogList) {
			List<String> imageList = blog.getImageList();
			String blogInfo = blog.getContent(); 
			Document doc = Jsoup.parse(blogInfo); 
			Elements jpgs = doc.select("img");
			for(int i = 0; i < jpgs.size(); i++) {
				Element jpg = jpgs.get(i); 
				logger.info("["+this.getClass()+"][index][jpg.toString()]"+jpg.toString());
				imageList.add(jpg.toString()); 
				if(i == 0)
					break; 
			}
		}
		

		StringBuffer param = new StringBuffer();

		if(StringUtil.isNotEmpty(typeId)) {
			param.append("typeId=" + typeId + "&");
		}
		if(StringUtil.isNotEmpty(releaseDateStr)) {
			param.append("releaseDateStr=" + releaseDateStr + "&");
		}
		modelAndView.addObject("pageCode", PageUtil.genPagination( 
				request.getContextPath() + "/index.html", 
				blogService.getTotal(map), 
				Integer.parseInt(page), 10,
				param.toString()));
		BlogType blogType = blogTypeService.findById(Integer.parseInt(typeId));
		modelAndView.addObject("blogList", blogList);
		
		modelAndView.addObject("blogTypeName",blogType.getTypeName() );
		modelAndView.addObject("commonPage", "foreground/blog/blogList.jsp");
		modelAndView.addObject("title", "home");
		//成长点滴
		logger.info("["+this.getClass()+"][index][typeId]"+typeId);
		if ("10".equals(typeId)) {

			//测试入口
			String weixin_openid ="test_o08GJwa_rYPdbwV6jDi2ZTaXyJ6s";
			
			ChildHealthRecord chr = new ChildHealthRecord();
			chr.setWeixin_openid(weixin_openid);
			List<ChildHealthRecord> child_health_record_list = childHealthRecordService.get_one_child_records(chr);

			modelAndView.addObject("child_health_record_list", child_health_record_list);
			modelAndView.setViewName("child_health_record_manage");
		} else {
			modelAndView.setViewName("mainTemp");
		}
			
		
		logger.info("["+this.getClass()+"][index][end]");
		return modelAndView;

	}

}
