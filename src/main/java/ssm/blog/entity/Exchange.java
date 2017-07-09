package ssm.blog.entity;

import java.sql.Time;

/**
 * 
 */
public class Exchange {
	public String getExchange() {
		return exchange;
	}
	public void setExchange(String exchange) {
		this.exchange = exchange;
	}
	public Long getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Long create_time) {
		this.create_time = create_time;
	}
	public long getExpires_in() {
		return expires_in;
	}
	public void setExpires_in(long l) {
		this.expires_in = l;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	//
	private Integer id;
	//
	private String exchange;
	

	private Long create_time;
	//
	private long expires_in;

	
}