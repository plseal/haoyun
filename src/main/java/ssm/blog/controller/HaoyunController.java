package ssm.blog.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONObject;
import ssm.blog.entity.Blog;
import ssm.blog.entity.BlogType;
import ssm.blog.entity.Comment;
import ssm.blog.entity.PageBean;
import ssm.blog.lucene.BlogIndex;
import ssm.blog.service.BlogService;
import ssm.blog.service.BlogTypeService;
import ssm.blog.service.CommentService;
import ssm.blog.util.PageUtil;
import ssm.blog.util.ResponseUtil;
import ssm.blog.util.StringUtil;
import ssm.blog.entity.Express;
import ssm.blog.service.ExpressService;
/**
 * @Description 
 * @author songml
 *
 */
@Controller
@RequestMapping("/haoyun")
public class HaoyunController {
	private static Logger logger = Logger.getLogger(HaoyunController.class);
	@Resource
	private BlogService blogService;
	@Resource
	private CommentService commentService;
	@Resource
	private BlogTypeService blogTypeService;
	
	@Resource(name="expressService")
	private ExpressService expressService;
	
	public static final int pagesize = 10;
	
	@Value("#{setting[STR1]}")
	private String STR1; 

	@Value("#{setting[STR2]}")
	private String STR2; 
	
	@Value("#{setting[STR3]}")
	private String STR3; 
	
	@Value("#{setting[STR4]}")
	private String STR4;
	
	private BlogIndex blogIndex = new BlogIndex();
	
	@RequestMapping("/get_express_by_name")
	public String get_express_by_name(
			String c_name,
			HttpServletRequest request) throws Exception {
		logger.info("["+this.getClass()+"][get_express_by_name][start]");
		logger.info("["+this.getClass()+"][get_express_by_name][c_name]"+c_name);

		List<Express> expresses = expressService.get_by_name(c_name);
		
		request.setAttribute("expresses", expresses);
		
		//ResponseUtil.write(response, result);
		logger.info("["+this.getClass()+"][get_express_by_name][end]");
		return "../../haoyun/check_express";
	}
	@RequestMapping("/building")
	public String building(
			HttpServletRequest request) throws Exception {
		logger.info("["+this.getClass()+"][building][start]");
		
		
		
		//ResponseUtil.write(response, result);
		logger.info("["+this.getClass()+"][building][end]");
		return "../../haoyun/building";
	}
	
	@RequestMapping("/get_wechat_id_by_name")
	public String get_wechat_id_by_name(
			String c_name,
			HttpServletRequest request) throws Exception {
		logger.info("["+this.getClass()+"][get_wechat_id_by_name][start]");
		logger.info("["+this.getClass()+"][get_wechat_id_by_name][c_name]"+c_name);

		List<Express> expresses = expressService.get_by_name(c_name);
		
		request.setAttribute("expresses", expresses);
		
		//ResponseUtil.write(response, result);
		logger.info("["+this.getClass()+"][get_wechat_id_by_name][end]");
		return "../../haoyun/check_express_c_info";
	}
	
	@RequestMapping("/get_express_by_number")
	public String get_express_by_number(
			String c_number,
			HttpServletRequest request) throws Exception {
		logger.info("["+this.getClass()+"][get_express_by_number][start]");
		logger.info("["+this.getClass()+"][get_express_by_number][c_number]"+c_number);

		List<Express> expresses = expressService.get_by_number(c_number);
		
		request.setAttribute("expresses", expresses);
		
		//ResponseUtil.write(response, result);
		logger.info("["+this.getClass()+"][get_express_by_number][end]");
		return "../../haoyun/check_express";
	}
	
	@RequestMapping("/get_express_by_wechat_id")
	public String get_express_by_wechat_id(
			String wechat_id,
			HttpServletRequest request) throws Exception {
		logger.info("["+this.getClass()+"][get_express_by_wechat_id][start]");
		logger.info("["+this.getClass()+"][get_express_by_wechat_id][wechat_id]"+wechat_id);

		List<Express> expresses = expressService.get_by_wechat_id(wechat_id);
		
		request.setAttribute("expresses", expresses);
		
		//ResponseUtil.write(response, result);
		logger.info("["+this.getClass()+"][get_express_by_wechat_id][end]");
		return "../../haoyun/check_express_get";
	}
	
	@RequestMapping("/get_express_by_number_first")
	public String get_express_by_number_first(
			String c_number,
			String wechat_id,
			HttpServletRequest request) throws Exception {
		logger.info("["+this.getClass()+"][get_express_by_number_first][start]");
		logger.info("["+this.getClass()+"][get_express_by_number_first][c_number]"+c_number);
		logger.info("["+this.getClass()+"][get_express_by_number_first][wechat_id]"+wechat_id);
		
		List<Express> expresses = expressService.get_by_number(c_number);
		
		request.setAttribute("expresses", expresses);
		request.setAttribute("wechat_id", wechat_id);
		
		if(expresses.size() > 0) {
			request.setAttribute("okflg", "ok");
			request.setAttribute("express_id", expresses.get(0).getId());
		}
		
		//ResponseUtil.write(response, result);
		logger.info("["+this.getClass()+"][get_express_by_number_first][end]");
		return "../../haoyun/check_express_first";
	}
	@RequestMapping("/c_first_confirm")
	public String c_first_confirm(
			Integer id,
			String wechat_id,
			HttpServletRequest request) throws Exception {
		logger.info("["+this.getClass()+"][c_first_confirm][start]");
		logger.info("["+this.getClass()+"][c_first_confirm][id]"+id);
		logger.info("["+this.getClass()+"][c_first_confirm][wechat_id]"+wechat_id);
		Express express = new Express();
		express.setId(id);
		express.setWechat_id(wechat_id);
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String todayyyyMMddHHmmss = df.format(date);
		express.setWechat_date(todayyyyMMddHHmmss);
		
		expressService.update_wechat_info(express);
		

		request.setAttribute("wechat_id", wechat_id);
		//request.setAttribute("express_id", expresses.get(0).getId());
		
		
		//ResponseUtil.write(response, result);
		logger.info("["+this.getClass()+"][c_first_confirm][end]");
		return "../../haoyun/check_express_first_result";
	}
	
	@RequestMapping("/c_express.do")
	public String c_express(
			String wechat_id,
			HttpServletRequest request) throws Exception {
		logger.info("["+this.getClass()+"][c_express][start]");
		logger.info("["+this.getClass()+"][c_express][wechat_id]"+wechat_id);
		
		//HttpSession session = request.getSession();
		//String wechat_id = (String)session.getAttribute("openid_haoyun");
		//logger.info("["+this.getClass()+"][c_express][wechat_id]"+wechat_id);
		
		List<Express> expresses =  expressService.get_by_wechat_id(wechat_id);
		

		request.setAttribute("wechat_id", wechat_id);
		//request.setAttribute("express_id", expresses.get(0).getId());
		
		
		//ResponseUtil.write(response, result);
		logger.info("["+this.getClass()+"][c_express][end]");
		if (expresses.size() == 0){
			return "../../haoyun/check_express_first";
		} else {
			request.setAttribute("expresses", expresses);
			return "../../haoyun/check_express_get";
		}
		
	}
	
	@RequestMapping("/to_modifyBlog")
	public ModelAndView to_modifyBlog(
			String pagenum,
			String blog_id
			) throws Exception {
		logger.info("["+this.getClass()+"][to_modifyBlog][start]");
		ModelAndView mv=new ModelAndView();

		logger.info("["+this.getClass()+"][to_modifyBlog][pagenum]"+pagenum);
		logger.info("["+this.getClass()+"][to_modifyBlog][blog_id]"+blog_id);
	    List<BlogType> blogTypeList = blogTypeService.getBlogTypeData();
		
		mv.setViewName("modifyBlog");
		mv.addObject("sidebar","modifyBlog");
		mv.addObject("blog_id",blog_id);
		mv.addObject("blogTypeList",blogTypeList);
		mv.addObject("pagenum",pagenum);

		logger.info("["+this.getClass()+"][to_modifyBlog][end]");
		return mv;
	}
	

	@RequestMapping("/save")
	public String save(Blog blog, HttpServletResponse response) throws Exception {
		logger.info("["+this.getClass()+"][save][start]");
		logger.info("["+this.getClass()+"][save][blog.getId()]"+blog.getId());
		logger.info("["+this.getClass()+"][save][blog.getTitle()]"+blog.getTitle());
		logger.info("["+this.getClass()+"][save][blog.getBlogTypeId()]"+blog.getBlogTypeId());
		logger.info("["+this.getClass()+"][save][blog.getContentNoTag()]"+blog.getContentNoTag());
		
		
		int resultTotal = 0; 
		if(blog.getId() == null) { 
			resultTotal = blogService.addBlog(blog);
			blogIndex.addIndex(blog); 
		} else { 
			resultTotal = blogService.update(blog);
			blogIndex.updateIndex(blog);
		}
		
		JSONObject result = new JSONObject();
		if(resultTotal > 0) {
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		logger.info("["+this.getClass()+"][save][end]");
		return null;
	}
	
	@RequestMapping(value="/to_test")
	public ModelAndView to_test(
			
			
			) throws Exception{
		logger.info("["+this.getClass()+"][to_test][start]");
		

		ModelAndView mv=new ModelAndView();

		
		
		mv.setViewName("test");
		mv.addObject("sidebar","test");
		
		logger.info("["+this.getClass()+"][to_test][end]");
		return mv;
	}
	
	
	@RequestMapping("/articles/{id}")
	public ModelAndView articles(@PathVariable("id") Integer id,
			HttpServletRequest request) {
		logger.info("["+this.getClass()+"][articles][start]");
		ModelAndView modelAndView = new ModelAndView();
		Blog blog = blogService.findById(id); 

		String keyWords = blog.getKeyWord();
		if (StringUtil.isNotEmpty(keyWords)) {
			String[] strArray = keyWords.split(" ");
			List<String> keyWordsList = StringUtil.filterWhite(Arrays
					.asList(strArray));
			modelAndView.addObject("keyWords", keyWordsList);
		} else {
			modelAndView.addObject("keyWords", null);
		}

		modelAndView.addObject("blog", blog);
		blog.setClickHit(blog.getClickHit() + 1); 
		blogService.update(blog); 

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("blogId", blog.getId());
		map.put("state", 1);
		List<Comment> commentList = commentService.getCommentData(map);

		modelAndView.addObject("commentList", commentList);
		
		modelAndView.addObject("title", blog.getTitle() + " ");

		modelAndView.addObject("pageCode", getPrevAndNextPageCode(
				blogService.getPrevBlog(id), blogService.getNextBlog(id),
				request.getServletContext().getContextPath()));

		modelAndView.setViewName("blogDetail");
		logger.info("["+this.getClass()+"][articles][end]");
		return modelAndView;
	}

	@RequestMapping("/search")
	public ModelAndView search(
			@RequestParam(value = "q", required = false) String q,
			@RequestParam(value = "page", required = false) String page,
			HttpServletRequest request) throws Exception {

		int pageSize = 10;
		ModelAndView modelAndView = new ModelAndView();
		List<Blog> blogIndexList = blogIndex.searchBlog(q);
		if(page == null) { 
			page = "1";
		}
		int fromIndex = (Integer.parseInt(page) - 1) * pageSize; 
		int toIndex = blogIndexList.size() >= Integer.parseInt(page) * pageSize ? Integer
				.parseInt(page) * pageSize
				: blogIndexList.size();
		modelAndView.addObject("blogIndexList", blogIndexList.subList(fromIndex, toIndex));
		modelAndView.addObject("pageCode", PageUtil.getUpAndDownPageCode(
				Integer.parseInt(page), blogIndexList.size(), q, pageSize,
				request.getServletContext().getContextPath()));
		modelAndView.addObject("q", q); 
		modelAndView.addObject("resultTotal", blogIndexList.size()); 
		modelAndView.addObject("commonPage", "foreground/blog/searchResult.jsp");
		modelAndView.addObject("title", "search'" + q + "'result");
		modelAndView.setViewName("mainTemp");
		return modelAndView;
	}
	
	@RequestMapping(value="/to_writeBlog",method=RequestMethod.GET)
	public ModelAndView writeBlog(){
		logger.info("["+this.getClass()+"][to_writeBlog][start]");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("writeBlog");
	    List<BlogType> blogTypeList = blogTypeService.getBlogTypeData();
		mv.addObject("blogTypeList",blogTypeList);
		mv.addObject("sidebar","writeBlog");
		logger.info("["+this.getClass()+"][to_writeBlog][end]");
		return mv;
	}
	
	@RequestMapping(value="/to_blogManage")
	public ModelAndView to_blogManage(
			String pagenum,
			String blog_id
			) throws Exception{
		logger.info("["+this.getClass()+"][to_blogManage][start]");
		
		//delete blog
		if (blog_id != null) {
			int id = Integer.parseInt(blog_id);
			logger.info("["+this.getClass()+"][to_blogManage][delete][start]");
			logger.info("["+this.getClass()+"][to_blogManage][delete][blog_id]"+id);
			commentService.deleteCommentByBlogId(id);
			blogService.deleteBlog(id);
			blogIndex.deleteIndex(blog_id);
			logger.info("["+this.getClass()+"][to_blogManage][delete][end]");
		}
		ModelAndView mv=new ModelAndView();

		logger.info("["+this.getClass()+"][to_blogManage][pagenum]"+pagenum);
		PageBean pageBean = new PageBean(Integer.parseInt(pagenum), pagesize);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", pageBean.getStart());
		map.put("pageSize", pageBean.getPageSize());
		List<Blog> blogList = blogService.listBlog(map);
		for (int i=0 ; i< blogList.size();i++) {
			  SimpleDateFormat dateformat1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			  blogList.get(i).setReleaseDateStr(dateformat1.format(blogList.get(i).getReleaseDate()));
		}
		//logger.info("["+this.getClass()+"][to_blogManage][blogList]"+blogList.size());
		mv.setViewName("blogManage");
		mv.addObject("sidebar","blogManage");
		mv.addObject("blogList", blogList);
		mv.addObject("length", blogList.size());
		mv.addObject("pagenum", pagenum);
		logger.info("["+this.getClass()+"][to_blogManage][end]");
		return mv;
	}
	private String getPrevAndNextPageCode(Blog prev, Blog next, String projectContent) {
		//logger.info("[PageUtil][getPrevAndNextPageCode][start]");
		StringBuffer pageCode = new StringBuffer();
		if(prev == null || prev.getId() == null) {
			pageCode.append("<p>" + STR1 + "</P>");
		} else {
			pageCode.append("<p>" + STR2 +"<a href='" + projectContent + "/blog/articles/" + prev.getId() + ".html'>" + prev.getTitle() + "</a></p>");
		}
		
		if(next == null || next.getId() == null) {
			pageCode.append("<p>" + STR3 + "</P>");
		} else {
			pageCode.append("<p>" + STR4 + "<a href='" + projectContent + "/blog/articles/" + next.getId() + ".html'>" + next.getTitle() + "</a></p>");
		}
		logger.info("[PageUtil][getPrevAndNextPageCode][pageCode.toString()]"+pageCode.toString());
		//logger.info("[PageUtil][getPrevAndNextPageCode][end]");
		return pageCode.toString();
	}

	
}
