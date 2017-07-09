package ssm.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ssm.blog.entity.Express;
import ssm.blog.service.ExpressService;
import ssm.blog.dao.BloggerDao;
import ssm.blog.dao.ExpressDao;
@Service("expressService")
public class ExpressServiceImpl implements ExpressService {
	private static Logger logger = Logger.getLogger(ExpressServiceImpl.class);
	
	@Resource
	private ExpressDao expressDao;
	
	public List<Express> get_by_name(String name){

    	return expressDao.get_by_name(name);


    }
	public List<Express> get_by_number(String number){

    	return expressDao.get_by_number(number);


    }
	public List<Express> get_by_wechat_id(String wechat_id){

    	return expressDao.get_by_wechat_id(wechat_id);


    }
	
	

	public Integer update(Express ep){

    	return expressDao.update(ep);


    }

	public Integer update_wechat_info(Express ep){

    	return expressDao.update_wechat_info(ep);


    }
	public Integer insert(Express ep){

    	return expressDao.insert(ep);


    }
	
	
}
