package ssm.blog.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import ssm.blog.dao.AccessTokenDao;
import ssm.blog.entity.AccessToken;
import ssm.blog.service.AccessTokenService;
import ssm.blog.util.WeixinUtil;

/**
 * @Description 
 * @author songml
 *
 */
@Service("accessTokenService")
public class AccessTokenServiceImpl implements AccessTokenService {
	
	private static Logger logger = Logger.getLogger(AccessTokenService.class);
	
	@Resource(name="accessTokenDao")
	private AccessTokenDao accessTokenDao;
	
	@Value("#{setting[APPID]}")
	private String strAPPID; 
	
	@Value("#{setting[APPSECRET]}")
	private String strAPPSECRET; 
	
	@Value("#{setting[APPID_HAOYUN]}")
	private String strAPPID_HAOYUN; 
	
	@Value("#{setting[APPSECRET_HAOYUN]}")
	private String strAPPSECRET_HAOYUN; 
	
	/**
	 * 获取access_token
	 * 
	 * @param appid 凭证
	 * @param appsecret 密钥
	 * @return
	 */
	public AccessToken getAccessToken(String flg) {
		
		logger.info("["+this.getClass().getName()+"][getAccessToken][start]");
		logger.info("["+this.getClass().getName()+"][getAccessToken][flg]"+flg);
		
		AccessToken accessToken = null;
		
		//先从DB查找accessToken，存在并且没有过期的话，就不用去微信官方服务器取了
		if ("LINGZHU".equals(flg)) {
			accessToken = accessTokenDao.getAccessToken(1);
			accessToken.setId(1);
		} else {
			accessToken = accessTokenDao.getAccessToken(2);
			accessToken.setId(2);
		}

		//int _in = Integer.parseInt(accessToken.getExpires_in());
		long create_time = accessToken.getCreate_time();
		//7200秒有效，保险起见3600秒刷新一次
		if ((System.currentTimeMillis()-create_time)/1000 < 3600) {// 有效
			logger.info("["+this.getClass().getName()+"][getAccessToken][Get From URL is not necessary]");
			
		//过期的话，需要去微信官方服务器再取一次
		} else {
			//System.out.println("无效重新创建");
			WeixinUtil wu = new WeixinUtil();
			if ("LINGZHU".equals(flg)) {
				accessToken = wu.getAccessTokenFromURL(strAPPID, strAPPSECRET);
			} else {
				accessToken = wu.getAccessTokenFromURL(strAPPID_HAOYUN, strAPPSECRET_HAOYUN);
			}
			
			accessToken.setCreate_time(System.currentTimeMillis());
			
			update(accessToken);//更新数据库
		}
		
		logger.info("["+this.getClass().getName()+"][getAccessToken][end]");
		return accessToken;
	}

	public Integer update(AccessToken at){
		return accessTokenDao.update(at);//更新数据库
	}

}
