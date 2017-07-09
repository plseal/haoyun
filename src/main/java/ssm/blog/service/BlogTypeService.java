package ssm.blog.service;

import java.util.List;
import java.util.Map;

import ssm.blog.entity.BlogType;

/**
 * @Description 
 * @author songml
 *
 */
public interface BlogTypeService {

	public List<BlogType> getBlogTypeData();

	public List<BlogType> listBlogType(Map<String, Object> map);
	
	public BlogType findById(Integer i);

	public Long getTotal(Map<String, Object> map);
	
	public Integer addBlogType(BlogType blogType);
	
	public Integer updateBlogType(BlogType blogType);
	
	public Integer deleteBlogType(Integer id);
}
