package shop.controller;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import reply.model.ReplyBean;
import reply.model.ReplyDao;

@Controller
public class ReplyGetReplyListController {
	
	@Autowired
	private ReplyDao replyDao;
	
	private final String command = "/getReply.shop";
	
	@ResponseBody
	@RequestMapping(value = command, method = RequestMethod.POST)
	public JSONObject doPostAction(Model model, @RequestBody Map<String, Object> param) throws JsonProcessingException, ParseException {
		
		
		JSONObject obj1 = new JSONObject();
		JSONParser parser = new JSONParser();
		ObjectMapper om = new ObjectMapper();
		
		List<ReplyBean> replyBean = replyDao.getReplyListByAnum(param);
		
		int totalCount = replyDao.getReplyTotalCountByRnum(param);
		
		JSONArray ja1 = new JSONArray();
		for(ReplyBean i : replyBean) {
			String jsonStr = om.writeValueAsString(i);
			ja1.add(parser.parse(jsonStr));
		}
		
		obj1.put("totalCount", totalCount);
		obj1.put("lists", ja1);
		
		return obj1;
	}
}
