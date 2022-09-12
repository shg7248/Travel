package travel.controller;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TravelRedisTestController {

	@Autowired
	private RedisTemplate<String, String> redisTemplate;
	
	private final String command = "/redisTest.tra";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetMethod() throws InterruptedException {
		
		
		
		final String key = "a";
		final String value = "b";
		
		ValueOperations<String, String> valueOperations = redisTemplate.opsForValue();
		valueOperations.set(key, value);
		redisTemplate.expire(key, 300, TimeUnit.SECONDS);
		
		System.out.println(valueOperations.get(key));
		
		Thread.sleep(6000);
		
		System.out.println(valueOperations.get(key));
		
		return null;
	}
}
