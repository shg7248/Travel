package shop.model;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

@Component
public class ShopOrderDao {

	private final String PREFIX = "order:";
	
	@Autowired 
	private RedisTemplate<String, Object> redisTemplate;
	
	public String setOrder(ReserveBean reserveBean) {
		String hashKey = getRandomStr();
		redisTemplate.opsForHash()
			.put(PREFIX + hashKey, hashKey, reserveBean);
		return hashKey;
	}
	
	public ReserveBean getOrder(String hashKey) {
		return (ReserveBean) redisTemplate.opsForHash()
			.get(PREFIX + hashKey, hashKey);
	}
	
	public boolean hasKey(String hashKey) {
		return redisTemplate.hasKey(PREFIX + hashKey);
	}
	
	private String getRandomStr() {
		UUID uuid = UUID.randomUUID();
		return uuid.toString();
	}
}
