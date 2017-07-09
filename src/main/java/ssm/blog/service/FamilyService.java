package ssm.blog.service;

import java.util.List;

import ssm.blog.entity.Family;

/**
 * @Description 
 * @author songml
 *
 */
public interface FamilyService {

	public List<Family> get_all();
	public Family get_by_id(Integer id);

	
	public Integer update(Family fa);

	

}



