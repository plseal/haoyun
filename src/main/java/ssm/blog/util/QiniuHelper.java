package ssm.blog.util;

import java.io.File;
import java.util.UUID;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

/**
 * 七牛上传帮助类
 */
public class QiniuHelper {
	
    /**
     * 空间名
     */
    private static String Scope = "myblog";
    
    /**
     * 域名
     */
    private static String Url = "ompc075ll.bkt.clouddn.com";
    
    /**
     * 公钥
     */
    private static String ACCESS_KEY = "FePw9gPrPXM0w1jlI4EhO8gK60EFCZFNuWJ-kfiX";
    
    private static String SECRET_KEY = "luyUSd3wGpAbn1aSYtw1-q_5INWuecJuPmxIQFqb";
    
    /**
     * 上传附件
     * @throws QiniuException 
     */
    public static String UploadFile(File file) throws QiniuException {
    	
    	String key = UUID.randomUUID().toString().replaceAll("-", "");
    	
    	try {
	    	//创建上传对象
	    	UploadManager uploadManager = new UploadManager();
	    	
	    	//密钥配置
	    	Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
	    	
	    	//上传文件
	    	Response res = uploadManager.put(file, key, auth.uploadToken(Scope, key));
    	} catch (Exception e) {
    		return "";
    	}
    	return key;
    }
    
    /**
     * 获得url地址
     */
    public static String GetUrl(String key)
    {
        return String.format ("http://%s/%s", Url, key);
    }
}