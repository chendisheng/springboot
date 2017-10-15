package cds.com.demo.webapp.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author chendisheng
 */
@Api(value="用户相关的接口")
@RestController
@RequestMapping("/ajax")
public class AutoCompleteController {

	private static final Integer COUNT = 10;
	@RequestMapping("/jsonData")
	@ApiOperation(notes="查询JSON数据",value="查询JSON数据",httpMethod="GET")
	@ResponseBody
	public Object getJsonData(@RequestParam(required = false,value="term") String term){
		String query = "test";

		List<HashMap<String,Object>> list = new ArrayList<HashMap<String, Object>>();
		for(int i=0;i<COUNT;i++){
			HashMap<String,Object> temp = new HashMap<String, Object>(10);
			temp.put("value",query+"v"+i);
			temp.put("label","显示"+"v"+i);
			list.add(temp);
		}
		return list;
	}

	@RequestMapping("/arrayData")
	@ApiOperation(notes="查询Array数据",value="查询Array数据",httpMethod="GET")
	@ResponseBody
	public Object getArrayData(@RequestParam(required = false,value="term") String term){
		String query = "test";

		List<String> list = new ArrayList<String>();
		for(int i=0;i<COUNT;i++){
			list.add(query+"v"+i);
		}
		return list;
	}


}
