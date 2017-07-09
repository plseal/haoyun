package ssm.blog.dao;

import ssm.blog.entity.AccessToken;

public interface AccessTokenDao {




	public AccessToken getAccessToken(Integer id);


	public Integer update(AccessToken at);

	
}

