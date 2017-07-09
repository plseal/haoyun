package ssm.blog.controller;


import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ssm.blog.entity.Message;
import ssm.blog.entity.Reply;
import ssm.blog.util.WeixinUtil;


@Controller()
public class WeixinController {
	private static Logger logger = Logger.getLogger(WeixinController.class);
	private static final String TOKEN = "LINGZHU2017";
	
	public static int pagesize = 10;
	
	@Value("#{setting[WELCOME_CONTENT]}")
	private String WELCOME_CONTENT; 
	
	@Value("#{setting[WELCOME_CONTENT_HAOYUN]}")
	private String WELCOME_CONTENT_HAOYUN; 	
	
	//接收微信公众号接收的消息，处理后再做相应的回复
	@RequestMapping(value="/weixin",method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String replyMessage(HttpServletRequest request){
		logger.info("["+this.getClass().getName()+"][replyMessage][start111]"); 
		//仅处理微信服务端发的请求
		if (checkWeixinReques(request)) {
			//logger.info("["+this.getClass().getName()+"][replyMessage][start checkWeixinReques OK]");
			
			Map<String, String> requestMap = WeixinUtil.parseXml(request);
			Message message = WeixinUtil.mapToMessage(requestMap);
			logger.info("["+this.getClass().getName()+"][replyMessage][message.getFromUserName()]"+message.getFromUserName());
			request.getSession().setAttribute("open_id", message.getFromUserName());
			//weixinService.addMessage(message);//保存接受消息到数据库
			String replyContent = WELCOME_CONTENT;
			String type = message.getMsgType();
			logger.info("["+this.getClass().getName()+"][replyMessage][message type]"+type);
			if (type.equals(Message.TEXT)) {//仅处理文本回复内容
				String content = message.getContent();//消息内容
				String [] cs = content.split("_");//消息内容都以下划线_分隔
				if(cs.length == 2){
					int studentid ;//学生编号
					String process = cs[1];//操作
					try {
						studentid = Integer.parseInt(cs[0]);
						if("考试".equals(process)){
						} 
					} catch (NumberFormatException e) {
						replyContent = Reply.ERROR_CONTENT;
					}
				}
			} else if (type.equals(Message.EVENT)) {//自定义菜单点击事件  
				logger.info("["+this.getClass().getName()+"][replyMessage][event]");
				 // 事件类型  
                String eventType = requestMap.get("Event");  
                logger.info("["+this.getClass().getName()+"][replyMessage][eventType]"+eventType);
                // 自定义菜单点击事件  
                if (eventType.equals(Message.EVENT_TYPE_CLICK)) {  
	                // 事件KEY值，与创建自定义菜单时指定的KEY值对应  
	                String eventKey = requestMap.get("EventKey");  
	                logger.info("["+this.getClass().getName()+"][replyMessage][eventKey:]"+eventKey);
	                if (eventKey.equals("11")) {  
	                	replyContent = "快乐孕检被点击！";  
	                } else if (eventKey.equals("12")) {  
	                	replyContent = "健康潮流被点击！";  
	                } else if (eventKey.equals("13")) {  
	                	//replyContent = "周边搜索菜单项被点击！";  
	                } else if (eventKey.equals("14")) {  
	                	//replyContent = "历史上的今天菜单项被点击！";  
	                } else if (eventKey.equals("21")) {  
	                	replyContent = "成长点滴被点击！";  
	                } else if (eventKey.equals("22")) {  
	                	replyContent = "快乐体检被点击！";  
	                } else if (eventKey.equals("23")) {  
	                	//replyContent = "美女电台菜单项被点击！";  
	                } else if (eventKey.equals("24")) {  
	                	//replyContent = "人脸识别菜单项被点击！";  
	                } else if (eventKey.equals("25")) {  
	                	//replyContent = "聊天唠嗑菜单项被点击！";  
	                } else if (eventKey.equals("31")) {  
	                	replyContent = "直接咨询被点击！";  
	                } else if (eventKey.equals("32")) {  
	                	replyContent = "了解我们被点击！";  
	                } else if (eventKey.equals("33")) {  
	                	replyContent = "联系我们被点击！";  
	                } 
                }
			}
			//拼装回复消息
			Reply reply = new Reply();
			reply.setToUserName(message.getFromUserName());

			reply.setFromUserName(message.getToUserName());
			
			reply.setCreateTime(new Date());
			reply.setMsgType(Reply.TEXT);
			reply.setContent(replyContent);
			logger.info("["+this.getClass().getName()+"][replyMessage][replyContent]"+replyContent);
			//weixinService.addReply(reply);//保存回复消息到数据库
			//将回复消息序列化为xml形式
			String back = WeixinUtil.replyToXml(reply);
			//System.out.println(back);
			logger.info("["+this.getClass().getName()+"][replyMessage][end]");
			return back;
			
		}else{
			logger.info("["+this.getClass().getName()+"][replyMessage][end]");
			return "error";
			
		}
		
	}
	//接收微信公众号接收的消息，处理后再做相应的回复
	@RequestMapping(value="/weixin_haoyun",method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String weixin_haoyun(HttpServletRequest request){
		logger.info("["+this.getClass().getName()+"][weixin_haoyun][start111]"); 
		//仅处理微信服务端发的请求
		if (checkWeixinReques(request)) {
			//logger.info("["+this.getClass().getName()+"][replyMessage][start checkWeixinReques OK]");
			
			Map<String, String> requestMap = WeixinUtil.parseXml(request);
			Message message = WeixinUtil.mapToMessage(requestMap);
			logger.info("["+this.getClass().getName()+"][weixin_haoyun][message.getFromUserName()]"+message.getFromUserName());
			request.getSession().setAttribute("open_id", message.getFromUserName());
			//weixinService.addMessage(message);//保存接受消息到数据库
			String replyContent = WELCOME_CONTENT_HAOYUN;
			String type = message.getMsgType();
			logger.info("["+this.getClass().getName()+"][weixin_haoyun][message type]"+type);
			if (type.equals(Message.TEXT)) {//仅处理文本回复内容
				String content = message.getContent();//消息内容
				String [] cs = content.split("_");//消息内容都以下划线_分隔
				if(cs.length == 2){
					int studentid ;//学生编号
					String process = cs[1];//操作
					try {
						studentid = Integer.parseInt(cs[0]);
						if("考试".equals(process)){
						} 
					} catch (NumberFormatException e) {
						replyContent = Reply.ERROR_CONTENT;
					}
				}
			} else if (type.equals(Message.EVENT)) {//自定义菜单点击事件  
				logger.info("["+this.getClass().getName()+"][weixin_haoyun][event]");
				 // 事件类型  
                String eventType = requestMap.get("Event");  
                logger.info("["+this.getClass().getName()+"][weixin_haoyun][eventType]"+eventType);
                // 自定义菜单点击事件  
                if (eventType.equals(Message.EVENT_TYPE_CLICK)) {  
	                // 事件KEY值，与创建自定义菜单时指定的KEY值对应  
	                String eventKey = requestMap.get("EventKey");  
	                logger.info("["+this.getClass().getName()+"][weixin_haoyun][eventKey:]"+eventKey);
	                if (eventKey.equals("11")) {  
	                	replyContent = "快乐孕检被点击！";  
	                } else if (eventKey.equals("12")) {  
	                	replyContent = "健康潮流被点击！";  
	                } else if (eventKey.equals("13")) {  
	                	//replyContent = "周边搜索菜单项被点击！";  
	                } else if (eventKey.equals("14")) {  
	                	//replyContent = "历史上的今天菜单项被点击！";  
	                } else if (eventKey.equals("21")) {  
	                	replyContent = "成长点滴被点击！";  
	                } else if (eventKey.equals("22")) {  
	                	replyContent = "快乐体检被点击！";  
	                } else if (eventKey.equals("23")) {  
	                	//replyContent = "美女电台菜单项被点击！";  
	                } else if (eventKey.equals("24")) {  
	                	//replyContent = "人脸识别菜单项被点击！";  
	                } else if (eventKey.equals("25")) {  
	                	//replyContent = "聊天唠嗑菜单项被点击！";  
	                } else if (eventKey.equals("31")) {  
	                	replyContent = "直接咨询被点击！";  
	                } else if (eventKey.equals("32")) {  
	                	replyContent = "了解我们被点击！";  
	                } else if (eventKey.equals("33")) {  
	                	replyContent = "联系我们被点击！";  
	                } 
                }
			}
			//拼装回复消息
			Reply reply = new Reply();
			reply.setToUserName(message.getFromUserName());

			reply.setFromUserName(message.getToUserName());
			
			reply.setCreateTime(new Date());
			reply.setMsgType(Reply.TEXT);
			reply.setContent(replyContent);
			logger.info("["+this.getClass().getName()+"][weixin_haoyun][replyContent]"+replyContent);
			//weixinService.addReply(reply);//保存回复消息到数据库
			//将回复消息序列化为xml形式
			String back = WeixinUtil.replyToXml(reply);
			//System.out.println(back);
			logger.info("["+this.getClass().getName()+"][weixin_haoyun][end]");
			return back;
			
		}else{
			logger.info("["+this.getClass().getName()+"][weixin_haoyun][end]");
			return "error";
			
		}
		
	}
	
	
	//微信公众平台验证url是否有效使用的接口
	@RequestMapping(value="/weixin_haoyun",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String weixin_haoyun_get(HttpServletRequest request){
		String echostr = request.getParameter("echostr");
		if (checkWeixinReques(request) && echostr != null) {
			return echostr;
		}else{
			return "error_haoyun";
		}
	}
	//微信公众平台验证url是否有效使用的接口
	@RequestMapping(value="/weixin",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String initWeixinURL(HttpServletRequest request){
		String echostr = request.getParameter("echostr");
		if (checkWeixinReques(request) && echostr != null) {
			return echostr;
		}else{
			return "error111";
		}
	}
	
	
	/**
	 * 根据token计算signature验证是否为weixin服务端发送的消息
	 */
	private boolean checkWeixinReques(HttpServletRequest request){
		//logger.info("["+this.getClass().getName()+"][checkWeixinReques][start]");
		String signature = request.getParameter("signature");
		String timestamp = request.getParameter("timestamp");
		String nonce = request.getParameter("nonce");
		if (signature != null && timestamp != null && nonce != null ) {
			String[] strSet = new String[] { TOKEN, timestamp, nonce };
			java.util.Arrays.sort(strSet);
			String key = "";
			for (String string : strSet) {
				key = key + string;
			}
			String pwd = WeixinUtil.sha1(key);
			//logger.info("["+this.getClass().getName()+"][checkWeixinReques][pwd]"+pwd);
			//logger.info("["+this.getClass().getName()+"][checkWeixinReques][signature]"+signature);
			//logger.info("["+this.getClass().getName()+"][checkWeixinReques][end]");
			
			return pwd.equals(signature);
		}else {
			return false;
		}
	}
	
	
	
	
	
}
