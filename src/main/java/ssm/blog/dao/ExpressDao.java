package ssm.blog.dao;

import java.util.List;

import ssm.blog.entity.Express;

public interface ExpressDao {




	public List<Express> get_by_name(String name);
	public List<Express> get_by_number(String number);
	public List<Express> get_by_wechat_id(String wechat_id);
	
	public Integer update(Express ep);
	public Integer update_wechat_info(Express ep);
	public Integer insert(Express ep);

	
}

