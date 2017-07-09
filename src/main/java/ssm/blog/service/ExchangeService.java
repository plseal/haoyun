package ssm.blog.service;

import java.io.IOException;
import java.net.MalformedURLException;

import ssm.blog.entity.Exchange;

/**
 * @Description 
 * @author songml
 *
 */
public interface ExchangeService {

	public Exchange getExchange() throws MalformedURLException, IOException;
	public Integer update(Exchange ex);

}
