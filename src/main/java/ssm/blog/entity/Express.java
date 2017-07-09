package ssm.blog.entity;

/**
 * 
 */
public class Express {
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getE_from() {
		return e_from;
	}
	public void setE_from(String e_from) {
		this.e_from = e_from;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getWechat_id() {
		return wechat_id;
	}
	public void setWechat_id(String wechat_id) {
		this.wechat_id = wechat_id;
	}
	public String getWechat_date() {
		return wechat_date;
	}
	public void setWechat_date(String wechat_date) {
		this.wechat_date = wechat_date;
	}
	private Integer id;//序号
	private String date;//日期
	private String name;//客户姓名
	private String number;//运单编号
	private String des;//目的地
	private String price;//运费
	private String content;//包裹内容
	private String e_from;//发货专区
	private String remark;//备注
	private String wechat_id;//
	private String wechat_date;//

}