package ssm.blog.service;

import ssm.blog.entity.Menu;

/**
 * @Description 
 * @author songml
 *
 */
public interface MenuService {

	public void createMenu(Menu menu,String flg);
	public String getMenu(String flg);

}



