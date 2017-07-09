package ssm.blog.util;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;
import ssm.blog.controller.FamilyController;
import ssm.blog.entity.Family;

import org.apache.log4j.Logger;
/**
 * 微信相关工具类
 */
public class JUHEUtil {
	private static Logger logger = Logger.getLogger(JUHEUtil.class);
	   public static final String DEF_CHATSET = "UTF-8";
	    public static final int DEF_CONN_TIMEOUT = 30000;
	    public static final int DEF_READ_TIMEOUT = 30000;
	    public static String userAgent =  "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.66 Safari/537.36";
	 
	    
	    //配置您申请的KEY
	    public static final String APPKEY ="094b9082fb833b87eac0e958c1e7162e";
	 
	    //1.获取当天的详细信息
	    public static Family getRequest1(String my_date){
	    	logger.info("[JUHEUtil][getRequest1][start]");
	    	logger.info("[JUHEUtil][getRequest1][my_date]"+my_date);
	    	Family fa = new Family();
	        String result =null;
	        String out =null;
	        String url ="http://v.juhe.cn/calendar/day";//请求接口地址
	        Map params = new HashMap();//请求参数
	            params.put("key",APPKEY);//您申请的appKey
	            params.put("date",my_date);//指定日期,格式为YYYY-MM-DD,如月份和日期小于10,则取个位,如:2012-1-1
	 
	        try {
	            result =net(url, params, "GET");
	            JSONObject object = 	JSONObject.fromObject(result);
	            if(object.getInt("error_code")==0){
	                //System.out.println(object.get("result"));
	                JSONObject data = 	JSONObject.fromObject(object.get("result"));
	                JSONObject data2 = 	JSONObject.fromObject(data.get("data"));
	                //System.out.println(data2.get("lunar"));
	                fa.setLunar_birth(data2.get("lunar").toString());
	                fa.setAnimals_year(data2.get("animalsYear").toString());
	                //System.out.println(out);
	            }else{
	                System.out.println(object.get("error_code")+":"+object.get("reason"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        logger.info("[JUHEUtil][getRequest1][end]");
	        return fa;
	    }
	 
	    //2.获取当月近期假期
	    public static void getRequest2(){
	        String result =null;
	        String url ="http://v.juhe.cn/calendar/month";//请求接口地址
	        Map params = new HashMap();//请求参数
	            params.put("key",APPKEY);//您申请的appKey
	            params.put("year-month","");//指定月份,格式为YYYY-MM,如月份和日期小于10,则取个位,如:2012-1
	 
	        try {
	            result =net(url, params, "GET");
	            JSONObject object = JSONObject.fromObject(result);
	            if(object.getInt("error_code")==0){
	                System.out.println(object.get("result"));
	            }else{
	                System.out.println(object.get("error_code")+":"+object.get("reason"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	 
	    //3.获取当年的假期列表
	    public static void getRequest3(){
	        String result =null;
	        String url ="http://v.juhe.cn/calendar/year";//请求接口地址
	        Map params = new HashMap();//请求参数
	            params.put("key",APPKEY);//您申请的appKey
	            params.put("year","");//指定年份,格式为YYYY,如:2015
	 
	        try {
	            result =net(url, params, "GET");
	            JSONObject object = JSONObject.fromObject(result);
	            if(object.getInt("error_code")==0){
	                System.out.println(object.get("result"));
	            }else{
	                System.out.println(object.get("error_code")+":"+object.get("reason"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	 
	 
	 
	    public static void main(String[] args) {
	    	System.out.println(getRequest1("1984-1-14"));
	    }
	 
	    /**
	     *
	     * @param strUrl 请求地址
	     * @param params 请求参数
	     * @param method 请求方法
	     * @return  网络请求字符串
	     * @throws Exception
	     */
	    public static String net(String strUrl, Map params,String method) throws Exception {
	        HttpURLConnection conn = null;
	        BufferedReader reader = null;
	        String rs = null;
	        try {
	            StringBuffer sb = new StringBuffer();
	            if(method==null || method.equals("GET")){
	                strUrl = strUrl+"?"+urlencode(params);
	            }
	            URL url = new URL(strUrl);
	            conn = (HttpURLConnection) url.openConnection();
	            if(method==null || method.equals("GET")){
	                conn.setRequestMethod("GET");
	            }else{
	                conn.setRequestMethod("POST");
	                conn.setDoOutput(true);
	            }
	            conn.setRequestProperty("User-agent", userAgent);
	            conn.setUseCaches(false);
	            conn.setConnectTimeout(DEF_CONN_TIMEOUT);
	            conn.setReadTimeout(DEF_READ_TIMEOUT);
	            conn.setInstanceFollowRedirects(false);
	            conn.connect();
	            if (params!= null && method.equals("POST")) {
	                try {
	                    DataOutputStream out = new DataOutputStream(conn.getOutputStream());
	                        out.writeBytes(urlencode(params));
	                } catch (Exception e) {
	                    // TODO: handle exception
	                }
	            }
	            InputStream is = conn.getInputStream();
	            reader = new BufferedReader(new InputStreamReader(is, DEF_CHATSET));
	            String strRead = null;
	            while ((strRead = reader.readLine()) != null) {
	                sb.append(strRead);
	            }
	            rs = sb.toString();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            if (reader != null) {
	                reader.close();
	            }
	            if (conn != null) {
	                conn.disconnect();
	            }
	        }
	        return rs;
	    }
	 
	    //将map型转为请求参数型
	    public static String urlencode(Map<String,Object>data) {
	        StringBuilder sb = new StringBuilder();
	        for (Map.Entry i : data.entrySet()) {
	            try {
	                sb.append(i.getKey()).append("=").append(URLEncoder.encode(i.getValue()+"","UTF-8")).append("&");
	            } catch (UnsupportedEncodingException e) {
	                e.printStackTrace();
	            }
	        }
	        return sb.toString();
	    }


}
