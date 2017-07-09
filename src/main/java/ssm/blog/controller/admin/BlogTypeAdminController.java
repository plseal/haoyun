package ssm.blog.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ssm.blog.controller.BloggerController;
import ssm.blog.entity.BlogType;
import ssm.blog.entity.PageBean;
import ssm.blog.service.BlogService;
import ssm.blog.service.BlogTypeService;
import ssm.blog.util.ResponseUtil;

/**
 * @Description 
 * @author songml
 *
 */
@Controller
@RequestMapping("/admin/blogType")
public class BlogTypeAdminController {
	private static Logger logger = Logger.getLogger(BlogTypeAdminController.class);
	@Resource
	private BlogTypeService blogTypeService;
	@Resource
	private BlogService blogService;


	@RequestMapping("/listBlogType")
	public String listBlogType(
			@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows,
			HttpServletResponse response) throws Exception {
		logger.info("["+this.getClass()+"][listBlogType][start]");
		PageBean pageBean = new PageBean(Integer.parseInt(page),
				Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("start", pageBean.getStart());
		map.put("pageSize", pageBean.getPageSize());
		List<BlogType> blogTypeList = blogTypeService.listBlogType(map);
		Long total = blogTypeService.getTotal(map);

		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(blogTypeList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		logger.info("["+this.getClass()+"][listBlogType][end]");
		return null;
	}


	@RequestMapping("/save")
	public String save(BlogType blogType, HttpServletResponse response)
			throws Exception {

		int resultTotal = 0; //
		if (blogType.getId() == null) { //
			resultTotal = blogTypeService.addBlogType(blogType);
		} else { //
			resultTotal = blogTypeService.updateBlogType(blogType);
		}

		JSONObject result = new JSONObject();
		if (resultTotal > 0) {
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}

	//
	@RequestMapping("/delete")
	public String deleteBlog(
			@RequestParam(value = "ids", required = false) String ids,
			HttpServletResponse response) throws Exception {

		String[] idsStr = ids.split(",");
		JSONObject result = new JSONObject();
		for (int i = 0; i < idsStr.length; i++) {
			int id = Integer.parseInt(idsStr[i]);
			if(blogService.getBlogByTypeId(id) > 0) { //
				result.put("exist", "cannot delete");
			} else {
				blogTypeService.deleteBlogType(id);
			}		
		}
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
}
