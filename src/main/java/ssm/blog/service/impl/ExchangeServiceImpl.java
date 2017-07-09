package ssm.blog.service.impl;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import ssm.blog.dao.AccessTokenDao;
import ssm.blog.dao.ExchangeDao;
import ssm.blog.entity.AccessToken;
import ssm.blog.entity.Exchange;
import ssm.blog.service.AccessTokenService;
import ssm.blog.service.ExchangeService;
import ssm.blog.util.WeixinUtil;

/**
 * @Description 
 * @author songml
 *
 */
@Service("exchangeService")
public class ExchangeServiceImpl implements ExchangeService {
	
	private static Logger logger = Logger.getLogger(ExchangeService.class);
	
	@Resource(name="exchangeDao")
	private ExchangeDao exchangeDao;
	
	
	@Value("#{setting[NOWAPI_APPKEY]}")
	private String str_nowapi_appkey; 
	
	@Value("#{setting[NOWAPI_SIGN]}")
	private String str_nowapi_sign; 
	
	/**
	 * 获取access_token
	 * 
	 * @param appid 凭证
	 * @param appsecret 密钥
	 * @return
	 * @throws IOException 
	 */
	public Exchange getExchange() throws IOException {
		
		logger.info("["+this.getClass().getName()+"][getExchange][start]");
		Exchange ex = null;
		
		//先从DB查找accessToken，存在并且没有过期的话，就不用去服务器取了
		
		ex = exchangeDao.getExchange(1);

		//int _in = Integer.parseInt(accessToken.getExpires_in());
		long create_time = ex.getCreate_time();
		//7200刷新一次
		if ((System.currentTimeMillis()-create_time)/1000 < 7200) {// 有效
			logger.info("["+this.getClass().getName()+"][getExchange][Get From URL is not necessary]");
			
		//过期的话，需要去服务器再取一次
		} else {
			//System.out.println("无效重新创建");
			
			String str_url = "http://api.k780.com:88/?app=finance.rate_cnyquot&curno=JPY&&appkey=NOWAPI_APPKEY&sign=NOWAPI_SIGN&format=json";

	        String requestUrl = str_url.replace("NOWAPI_APPKEY", str_nowapi_appkey);
	               requestUrl = requestUrl.replace("NOWAPI_SIGN", str_nowapi_sign);
	        logger.info("["+this.getClass().getName()+"][getExchange][requestUrl]"+requestUrl); 
	        URL u=new URL(requestUrl);
	        InputStream in=u.openStream();
	        ByteArrayOutputStream out=new ByteArrayOutputStream();
	        try {
	            byte buf[]=new byte[1024];
	            int read = 0;
	            while ((read = in.read(buf)) > 0) {
	                out.write(buf, 0, read);
	            }
	        }  finally {
	            if (in != null) {
	                in.close();
	            }
	        }
	        byte b[]=out.toByteArray( );
	        String strResult = new String(b,"utf-8");
	        //logger.info("["+this.getClass().getName()+"][getExchange][strResult]"+strResult);
			
			ex.setExchange(strResult);
			ex.setExpires_in(System.currentTimeMillis());
			
			ex.setCreate_time(System.currentTimeMillis());
			
			update(ex);//更新数据库
		}
		
		logger.info("["+this.getClass().getName()+"][getExchange][end]");
		return ex;
	}

	public Integer update(Exchange ex){
		return exchangeDao.update(ex);//更新数据库
	}

}
