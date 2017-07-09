package ssm.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ssm.blog.entity.Family;
import ssm.blog.service.FamilyService;
import ssm.blog.dao.FamilyDao;
@Service("familyService")
public class FamilyServiceImpl implements FamilyService {
	private static Logger logger = Logger.getLogger(FamilyServiceImpl.class);
	
	@Resource
	private FamilyDao familyDao;
	
	public List<Family> get_all(){

    	return familyDao.get_all();


    }

	public Family get_by_id(Integer id){

    	return familyDao.get_by_id(id);


    }
	
	

	public Integer update(Family fa){

    	return familyDao.update(fa);


    }



	
	
}
