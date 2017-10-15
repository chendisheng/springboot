package cds.com.demo.webapp.controller;

import cds.com.demo.webapp.model.User;
import cds.com.demo.webapp.model.UserVo;
import cds.com.demo.webapp.service.IUserService;
import com.alibaba.druid.util.StringUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api(value="用户相关的接口")
@RestController
@RequestMapping("/selectize")
public class SelectController {
	@Autowired
	private IUserService server;
	/**
	 * 添加用户
	 * @param user 用户对象
	 * @since 2016年9月21日21:01:50
	 */
	@RequestMapping("/getUser2")
	@ApiOperation(notes="添加用户",value="添加一个用户",httpMethod="POST")
	public String add(@ApiParam(name="user",value="user对象") @RequestBody User user){
		return "hello "+server.add(user);
	}
	
	/**
	 * 查询所有用户
	 * @since 2016年9月22日20:32:43
	 * @return
	 */
	@RequestMapping("/getUser")
	@ApiOperation(notes="查询所有用户",value="查询所有有，目前只返回数量",httpMethod="GET")
	@ResponseBody
	public List<User> find(@RequestParam(required = false) String userId){
		return server.findAll();
	}
	/**
	 * 查询所有用户
	 * @since 2016年9月22日20:32:43
	 * @return
	 */
	@RequestMapping("/getUserById")
	@ApiOperation(notes="查询所有用户",value="查询所有有，目前只返回数量",httpMethod="GET")
	@ResponseBody
	public List<User> findById(@RequestParam(required = false) String userId){
		return server.findById(userId);
	}

	/**
	 * 查询批量用户 自动补全
	 * @since 2016年9月22日20:32:43
	 * @return
	 */
	@RequestMapping("/getByMulIds")
	@ApiOperation(notes="查询批量用户 自动补全",value="查询批量用户 自动补全",httpMethod="GET")
	@ResponseBody
	public List<UserVo> autoFindByMulId(@RequestParam(required = false) String userId){
		if(StringUtils.isEmpty(userId)){
			return null;
		}
		return server.autofindByIds(userId.replaceAll(";",","));
	}

	/**
	 * 查询批量用户 自动补全
	 * @since 2016年9月22日20:32:43
	 * @return
	 */
	@RequestMapping("/getByLike")
	@ApiOperation(notes="查询批量用户 自动补全",value="查询批量用户 自动补全",httpMethod="GET")
	@ResponseBody
	public List<UserVo> autoFindById(@RequestParam(required = false,value="term") String term){
		if(StringUtils.isEmpty(term)){
			return null ;
		}
		return server.autofindByIds(term.replaceAll(";",","));
	}
}
