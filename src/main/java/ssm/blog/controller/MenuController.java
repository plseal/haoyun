package ssm.blog.controller;


import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ssm.blog.entity.CommonButton;
import ssm.blog.entity.ComplexButton;
import ssm.blog.entity.Menu;
import ssm.blog.service.MenuService;

/**
 * Menu管理
 */
@Controller
public class MenuController {
	
	private static Logger logger = Logger.getLogger(MenuService.class);
	
	@Resource(name="menuService")
	private MenuService menuService;
	

	
	@Value("#{setting[mainBtn1Name]}")
	private String mainBtn1Name; 
	
	@Value("#{setting[mainBtn2Name]}")
	private String mainBtn2Name; 
	
	@Value("#{setting[mainBtn3Name]}")
	private String mainBtn3Name; 
	
	@Value("#{setting[btn11Name]}")
	private String btn11Name; 
	
	@Value("#{setting[btn12Name]}")
	private String btn12Name;
	
	@Value("#{setting[btn13Name]}")
	private String btn13Name;
	
	@Value("#{setting[btn14Name]}")
	private String btn14Name;
	
	@Value("#{setting[btn15Name]}")
	private String btn15Name; 
	
	@Value("#{setting[btn21Name]}")
	private String btn21Name; 
	
	@Value("#{setting[btn22Name]}")
	private String btn22Name;
	
	@Value("#{setting[btn23Name]}")
	private String btn23Name;
	
	@Value("#{setting[btn24Name]}")
	private String btn24Name;
	
	@Value("#{setting[btn25Name]}")
	private String btn25Name; 
	
	@Value("#{setting[btn31Name]}")
	private String btn31Name; 
	
	@Value("#{setting[btn32Name]}")
	private String btn32Name;
	
	@Value("#{setting[btn33Name]}")
	private String btn33Name;
	
	@Value("#{setting[btn34Name]}")
	private String btn34Name;
	
	@Value("#{setting[btn35Name]}")
	private String btn35Name; 
	
	
	@Value("#{setting[haoyun_main_button1_name]}")
	private String haoyun_main_button1_name; 
	
	@Value("#{setting[haoyun_main_button2_name]}")
	private String haoyun_main_button2_name;
	
	@Value("#{setting[haoyun_main_button3_name]}")
	private String haoyun_main_button3_name; 
	
	@Value("#{setting[APPID]}")
	private String strAPPID; 
	
	@Value("#{setting[APPSECRET]}")
	private String strAPPSECRET; 
	
	@Value("#{setting[APPID_HAOYUN]}")
	private String strAPPID_HAOYUN; 
	
	@Value("#{setting[APPSECRET_HAOYUN]}")
	private String strAPPSECRET_HAOYUN; 
	
	@RequestMapping(value="/manager/create-menu",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView createMenu(){
		
		logger.info("["+this.getClass()+"][createMenu][start]");
		
		
		Menu menu = getMenu();
		
		ModelAndView mv=new ModelAndView();
		menuService.createMenu(menu,"LINGZHU");
		mv.addObject("sidebar","create-menu");
        mv.setViewName("result");
        
        mv.addObject("strResult", menuService.getMenu("LINGZHU"));
		
		logger.info("["+this.getClass().getName()+"][createMenu][end]"); 
		return mv;
	}
	
	@RequestMapping(value="/manager/create_menu_haoyun",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView createMenu_haoyun(){
		
		logger.info("["+this.getClass()+"][createMenu_haoyun][start]");
		
		
		Menu menu = getMenu_haoyun();
		
		ModelAndView mv=new ModelAndView();
		menuService.createMenu(menu,"HAOYUN");
		mv.addObject("sidebar","createMenu_haoyun");
        mv.setViewName("result");
        
        mv.addObject("strResult", menuService.getMenu("HAOYUN"));
		
		logger.info("["+this.getClass().getName()+"][createMenu_haoyun][end]"); 
		return mv;
	}
	
    /**
     * 组装菜单数据
     * 
     * @return
     */
    private Menu getMenu() {

    	
    	logger.info("["+this.getClass().getName()+"][getMenu][start]");
        CommonButton btn11 = new CommonButton();
        btn11.setName(btn11Name);
        btn11.setType("view");
        btn11.setKey("11");
        btn11.setUrl("http://www.plseal.com/Blog/index.html?typeId=1");

        CommonButton btn12 = new CommonButton();
        btn12.setName(btn12Name);
        btn12.setType("view");
        btn12.setKey("12");
        btn12.setUrl("http://www.plseal.com/Blog/index.html?typeId=2");
        
        CommonButton btn13 = new CommonButton();
        btn13.setName(btn13Name);
        btn13.setType("view");
        btn13.setKey("13");
        btn13.setUrl("http://www.plseal.com/Blog/index.html?typeId=3");
        
        CommonButton btn14 = new CommonButton();
        btn14.setName(btn14Name);
        btn14.setType("view");
        btn14.setKey("14");
        btn14.setUrl("http://www.plseal.com/Blog/index.html?typeId=4");
        
        CommonButton btn15 = new CommonButton();
        btn15.setName(btn15Name);
        btn15.setType("view");
        btn15.setKey("15");
        btn15.setUrl("http://www.plseal.com/Blog/index.html?typeId=5");

        CommonButton btn21 = new CommonButton();
        btn21.setName(btn21Name);
        btn21.setType("view");
        btn21.setKey("21");
        btn21.setUrl("http://www.plseal.com/Blog/index.html?typeId=6");

        CommonButton btn22 = new CommonButton();
        btn22.setName(btn22Name);
        btn22.setType("view");
        btn22.setKey("22");
        btn22.setUrl("http://www.plseal.com/Blog/index.html?typeId=7");
        
        CommonButton btn23 = new CommonButton();
        btn23.setName(btn23Name);
        btn23.setType("view");
        btn23.setKey("23");
        btn23.setUrl("http://www.plseal.com/Blog/index.html?typeId=8");
        
        
        CommonButton btn24 = new CommonButton();
        btn24.setName(btn24Name);
        btn24.setType("view");
        btn24.setKey("24");
        //snsapi_base不弹出授权页面，直接跳转，只能获取用户openid
        String strURL ="https://open.weixin.qq.com/connect/oauth2/authorize?appid="+strAPPID+"&redirect_uri=http://www.lingzhu-med.com/Blog/weixin_oauth2/get_code.do&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
        //String strURL ="http://www.plseal.com/Blog/index.html?typeId=9";
        //logger.info("["+this.getClass().getName()+"][getMenu][strURL]"+strURL);
        btn24.setUrl(strURL);
        
        CommonButton btn25 = new CommonButton();
        btn25.setName(btn25Name);
        btn25.setType("view");
        btn25.setKey("25");
        btn25.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+strAPPID+"&redirect_uri=http://www.lingzhu-med.com/Blog/weixin_oauth2/get_code.do&response_type=code&scope=snsapi_base&state=1#wechat_redirect");
        
        CommonButton btn31 = new CommonButton();
        btn31.setName(btn31Name);
        btn31.setType("view");
        btn31.setKey("31");
        btn31.setUrl("http://www.plseal.com/Blog/index.html?typeId=11");

        CommonButton btn32 = new CommonButton();
        btn32.setName(btn32Name);
        btn32.setType("view");
        btn32.setKey("32");
        btn32.setUrl("http://www.plseal.com/Blog/index.html?typeId=12");
        
        CommonButton btn33 = new CommonButton();
        btn33.setName(btn33Name);
        btn33.setType("view");
        btn33.setKey("33");
        btn33.setUrl("http://www.plseal.com/Blog/index.html?typeId=13");

        CommonButton btn34 = new CommonButton();
        btn34.setName(btn34Name);
        btn34.setType("view");
        btn34.setKey("34");
        btn34.setUrl("http://www.plseal.com/Blog/index.html?typeId=14");
        
        CommonButton btn35 = new CommonButton();
        btn35.setName(btn35Name);
        btn35.setType("view");
        btn35.setKey("35");
        btn35.setUrl("http://www.plseal.com/Blog/index.html?typeId=15");
        /**
         * 微信：  mainBtn1,mainBtn2,mainBtn3底部的三个一级菜单。
         */
        
        ComplexButton mainBtn1 = new ComplexButton();
        mainBtn1.setName(mainBtn1Name);
        //一级下有2个子菜单
        mainBtn1.setSub_button(new CommonButton[] { btn11, btn12, btn13, btn14, btn15 });
        //mainBtn1.setSub_button(new CommonButton[] { btn11 });

        
        ComplexButton mainBtn2 = new ComplexButton();
        mainBtn2.setName(mainBtn2Name);
        mainBtn2.setSub_button(new CommonButton[] { btn21, btn22, btn23, btn24, btn25 });
        //mainBtn2.setSub_button(new CommonButton[] { btn21 });
        
        ComplexButton mainBtn3 = new ComplexButton();
        mainBtn3.setName(mainBtn3Name);
        mainBtn3.setSub_button(new CommonButton[] { btn31, btn32, btn33, btn34, btn35 });
        //mainBtn3.setSub_button(new CommonButton[] { btn31 });

        
        /**
         * 封装整个菜单
         */
        Menu menu = new Menu();
        menu.setButton(new ComplexButton[] { mainBtn1, mainBtn2, mainBtn3 });
        logger.info("["+this.getClass().getName()+"][getMenu][end]");
        return menu;
    }
    /**
     * 组装菜单数据
     * 
     * @return
     */
    private Menu getMenu_haoyun() {

    	
    	logger.info("["+this.getClass().getName()+"][getMenu_haoyun][start]");
        
        /**
         * 微信：  mainBtn1,mainBtn2,mainBtn3底部的三个一级菜单。
         */
        
        CommonButton mainBtn1 = new CommonButton();
        //快递查询
        mainBtn1.setName(haoyun_main_button1_name);
        mainBtn1.setType("view");
        mainBtn1.setKey("01");
        //snsapi_base不弹出授权页面，直接跳转，只能获取用户openid
        String strURL ="https://open.weixin.qq.com/connect/oauth2/authorize?appid="+strAPPID_HAOYUN+"&redirect_uri=http://www.lingzhu-med.com/Blog/weixin_oauth2/get_code_haoyun.do&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
        mainBtn1.setUrl(strURL);


        CommonButton mainBtn2 = new CommonButton();
        mainBtn2.setName(haoyun_main_button2_name);
        mainBtn2.setType("view");
        mainBtn2.setKey("02");
        mainBtn2.setUrl("http://www.plseal.com/Blog/haoyun/building.do");
        
        CommonButton mainBtn3 = new CommonButton();
        mainBtn3.setName(haoyun_main_button3_name);
        mainBtn3.setType("view");
        mainBtn3.setKey("03");
        mainBtn3.setUrl("http://www.plseal.com/Blog/haoyun/building.do");

        
        /**
         * 封装整个菜单
         */
        Menu menu = new Menu();
        menu.setButton(new CommonButton[] { mainBtn1, mainBtn2, mainBtn3 });
        logger.info("["+this.getClass().getName()+"][getMenu_haoyun][end]");
        return menu;
    }
	

	
}
