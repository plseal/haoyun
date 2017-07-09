package ssm.blog.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ssm.blog.dao.ChildHealthRecordDao;
import ssm.blog.entity.*;
import ssm.blog.service.*;
import java.util.*;
/**
 * @Description 
 * @author songml
 *
 */
@Service("childHealthRecordService")
public class ChildHealthRecordServiceImpl implements ChildHealthRecordService {

	private static Logger logger = Logger.getLogger(ChildHealthRecordService.class);
	
	@Resource(name="childHealthRecordDao")
	private ChildHealthRecordDao childHealthRecordDao;
	


	public ChildHealthRecord get_chr(ChildHealthRecord chr) {
		
		logger.info("["+this.getClass().getName()+"][get_chr][start]");

		ChildHealthRecord childHealthRecord = childHealthRecordDao.get_chr(chr);
		
		
		logger.info("["+this.getClass().getName()+"][get_chr][end]");
		return childHealthRecord;
	}
	
	public ChildHealthRecord get_one_chr_byid(ChildHealthRecord chr_in) {
		
		logger.info("["+this.getClass().getName()+"][get_one_chr_byid][start]");

		ChildHealthRecord chr_out = childHealthRecordDao.get_one_chr_byid(chr_in);
		
		
		logger.info("["+this.getClass().getName()+"][get_one_chr_byid][end]");
		return chr_out;
	}
	
	public List<ChildHealthRecord> get_one_child_records(ChildHealthRecord chr) {
		
		logger.info("["+this.getClass().getName()+"][get_one_child_records][start]");
		//ChildHealthRecord chr = null;
		//childHealthRecord.setWeixin_openid(weixin_openid);
		List<ChildHealthRecord> chr_list = childHealthRecordDao.get_one_child_records(chr);

		//int _in = Integer.parseInt(accessToken.getExpires_in());
		
		
		logger.info("["+this.getClass().getName()+"][get_one_child_records][end]");
		return chr_list;
	}

	public Integer update_chr(ChildHealthRecord chr){
		logger.info("["+this.getClass().getName()+"][update_chr][start]");
		logger.info("["+this.getClass().getName()+"][update_chr][end]");
		return childHealthRecordDao.update_chr(chr);//更新数据
	}

	public Integer insert_chr(ChildHealthRecord chr){
		logger.info("["+this.getClass().getName()+"][insert_chr][start]");
		logger.info("["+this.getClass().getName()+"][insert_chr][end]");
		return childHealthRecordDao.insert_chr(chr);//insert数据
	}

	public Integer delete_chr(ChildHealthRecord chr){
		logger.info("["+this.getClass().getName()+"][delete_chr][start]");
		logger.info("["+this.getClass().getName()+"][delete_chr][end]");
		return childHealthRecordDao.delete_chr(chr);//delete数据
	}
}
