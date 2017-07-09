package ssm.blog.service;

import ssm.blog.entity.AccessToken;

/**
 * @Description 
 * @author songml
 *
 */
public interface AccessTokenService {

	public AccessToken getAccessToken(String flg);
	public Integer update(AccessToken at);

}
