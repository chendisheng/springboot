package cds.com.demo.webapp.controller;

import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import cds.com.demo.webapp.model.User;
import cds.com.demo.webapp.service.IUserService;

import java.util.List;

/**
 * @author edison
 */
@Api(value="用户相关的接口")
@RestController
@RequestMapping("/user")
public class UserController {
	@Autowired
	private IUserService server;
	/**
	 * 添加用户
	 * @param user 用户对象
	 * @since 2016年9月21日21:01:50
	 */
	@RequestMapping("/add")
	@ApiOperation(notes="添加用户",value="添加一个用户",httpMethod="POST")
	public String add(@ApiParam(name="user",value="user对象") @RequestBody User user){
		return "hello "+server.add(user);
	}
	
	/**
	 * 查询所有用户
	 * @since 2016年9月22日20:32:43
	 * @return
	 */
	@RequestMapping("/all")
	@ApiOperation(notes="查询所有用户",value="查询所有有，目前只返回数量",httpMethod="GET")
	@ResponseBody
	public List<User> find(){
		return server.findAll();
	}
}
