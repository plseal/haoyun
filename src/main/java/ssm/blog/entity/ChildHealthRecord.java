package ssm.blog.entity;

import java.sql.Time;

/**
 * 
 * 
 */
public class ChildHealthRecord {
	
	public String getWeixin_openid() {
		return weixin_openid;
	}

	public void setWeixin_openid(String weixin_openid) {
		this.weixin_openid = weixin_openid;
	}

	public String getChild_name() {
		return child_name;
	}

	public void setChild_name(String child_name) {
		this.child_name = child_name;
	}

	public String getChild_sex() {
		return child_sex;
	}

	public void setChild_sex(String child_sex) {
		this.child_sex = child_sex;
	}

	public String getChild_birth() {
		return child_birth;
	}

	public void setChild_birth(String child_birth) {
		this.child_birth = child_birth;
	}

	public String getChild_age() {
		return child_age;
	}

	public void setChild_age(String child_age) {
		this.child_age = child_age;
	}

	public String getChild_height() {
		return child_height;
	}

	public void setChild_height(String child_height) {
		this.child_height = child_height;
	}

	public String getChild_weight() {
		return child_weight;
	}

	public void setChild_weight(String child_weight) {
		this.child_weight = child_weight;
	}


	// ID
	private String id;
	
	private String weixin_openid;
	// 
	private String child_name;
	
	// 
	private String child_sex;
	
	private String child_birth;
	
	private String child_age;
	
	private String child_height;
	
	private String child_weight;
	
	private String update_date;

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}