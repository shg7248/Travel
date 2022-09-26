package travel.controller;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class TravelRedisTestController {


	@Autowired 
	private RedisTemplate<String, String> redisTemplate;

	private String redisKey = "key:study";
	private String redisHashKey = "unique:key";
	private String redisHashKey2 = "unique:key2";
	private Data redisHashValue = new Data(0, 1L, "name");
	private Data redisHashValue2 = new Data(0, 1L, "name2");
	private Data redisHashValue3 = new Data(0, 1L, "name3");

	private final String command = "/redisTest.tra";

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetMethod() throws InterruptedException {

		/*
		 * UUID uuid = UUID.randomUUID(); System.out.println(uuid.toString());
		 * 
		 * redisTemplate.opsForHash().put(redisKey, redisHashKey, redisHashValue); Data
		 * data = (Data) redisTemplate.opsForHash().get(redisKey, redisHashKey);
		 * System.out.println("data3 : " + data.data3);
		 * 
		 * redisTemplate.opsForHash().put(redisKey, redisHashKey2, redisHashValue2);
		 * Data data2 = (Data) redisTemplate.opsForHash().get(redisKey, redisHashKey2);
		 * System.out.println("data3 : " + data2.data3);
		 * 
		 * redisTemplate.opsForHash().put(redisKey, redisHashKey, redisHashValue3);
		 * redisTemplate.expire(redisKey, 5, TimeUnit.SECONDS); Data data3 = (Data)
		 * redisTemplate.opsForHash().get(redisKey, redisHashKey);
		 * System.out.println("data3 : " + data3.data3);
		 * 
		 * System.out.println(getRandom()); System.out.println(getRandom());
		 * System.out.println(getRandom());
		 * 
		 * Thread.sleep(7000);
		 * 
		 * Data data4 = (Data) redisTemplate.opsForHash().get(redisKey, redisHashKey);
		 * System.out.println(data4);
		 */

		 final String key = "a"; final String value = "b";
		 ValueOperations<String, String> valueOperations =
				 redisTemplate.opsForValue(); valueOperations.set(key, value);
	redisTemplate.expire(key, 5, TimeUnit.SECONDS);
	 
	
	System.out.println(redisTemplate.hasKey("c"));
	System.out.println(valueOperations.get(key));
			 
	Thread.sleep(6000);

	 System.out.println(valueOperations.get(key));
	

		return null;
	}
	
	public String getRandom() {
		UUID uuid = UUID.randomUUID();
		return uuid.toString();
	}

}
