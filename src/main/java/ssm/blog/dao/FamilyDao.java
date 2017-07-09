package ssm.blog.dao;

import java.util.List;

import ssm.blog.entity.Family;

public interface FamilyDao {




	public Family get_by_id(Integer id);
	public List<Family> get_all();
	
	public Integer update(Family fa);


	
}

