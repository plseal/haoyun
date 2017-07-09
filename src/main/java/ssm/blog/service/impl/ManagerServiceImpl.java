package ssm.blog.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;
import ssm.blog.entity.AccessToken;
import ssm.blog.entity.Menu;
import ssm.blog.service.AccessTokenService;
import ssm.blog.service.ManagerService;
import ssm.blog.service.MenuService;
import ssm.blog.util.WeixinUtil;
@Service("managerService")
public class ManagerServiceImpl implements ManagerService {
	private static Logger logger = Logger.getLogger(ManagerServiceImpl.class);
	
	@Resource(name="accessTokenService")
	private AccessTokenService accessTokenService;

	// 获取用户基本信息(UnionID机制)
	public static String str_union_id_url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
	
   /**
	* 描述:菜单管理器类 </br>
	* 发布版本：V1.0  </br>
	 */
    //public JSONObject get_union_id(String str_union_id_url ,String str_open_id) {
	public String get_union_id(String str_union_id_url ,String str_open_id) {
    	logger.info("["+this.getClass().getName()+"][get_union_id][start]");

        // 调用接口获取access_token



        logger.info("["+this.getClass().getName()+"][get_union_id][end]");
        return "";
    }

	
	
	
}
