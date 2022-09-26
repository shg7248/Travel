package travel.controller;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

@Component
public class RedisAuth {

	ValueOperations<String, String> valueOperations;
	
	@Autowired 
	private RedisTemplate<String, String> redisTemplate;
	
	public void setKeyValue(String key, String value, int expire) {
		valueOperations = redisTemplate.opsForValue();
		valueOperations.set(key, value);
		redisTemplate.expire(key, expire, TimeUnit.SECONDS);
	}
	
	public String getValue(String key) {
		if(hasKey(key)) {
			return valueOperations.get(key);
		}
		return null;
	}
	
	public boolean hasKey(String key) {
		return redisTemplate.hasKey(key);
	}
}
