package cds.com.demo.webapp.service.impl;

import cds.com.demo.webapp.dao.IUserDao;
import cds.com.demo.webapp.model.User;
import cds.com.demo.webapp.model.UserVo;
import cds.com.demo.webapp.service.IUserService;
import com.alibaba.druid.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Arrays;
import java.util.List;

/**
 * 用户相关数据库操作实现类
 * @author Raye
 * @since 2016年10月11日19:29:02
 */
@Repository
public class UserServiceImpl implements IUserService {
	@Autowired
	private IUserDao userDao;

	/**
	 * 添加
	 * @param user 用户对象
	 * @return
	 */
	@Override
	public boolean add(User user) {
		return userDao.insert(user) > 0;
	}
	@Override
	public List<User> findAll() {
		return userDao.selectAll();
	}

	/**
	 * 根据 用户 IDs 查询列表
	 * @param ids
	 * @return
	 */
	@Override
	public List<User> findById(String ids) {
		String[] idArray = ids.split(",");
		List<String> list =  Arrays.asList(idArray);
		return userDao.selectByIds(list);
	}

	/**
	 * 根据用户ID（多个）查询 用户列表
	 * @param param
	 * @return
	 */
	@Override
	public List<UserVo> autofindByIds(String param) {
		List<UserVo> userList ;
		if(param != null && param.contains(",")){
			String[] idArray = param.split(",");
			List<String> list =  Arrays.asList(idArray);
			userList = userDao.selectAutoByIds(list);
		}else if(StringUtils.isNumber(param)){
			userList = userDao.selectAutoById(param);
		}else {
			userList = userDao.selectAutoByName(param);
		}

		return userList;
	}

	/**
	 * 根据用户ID（多个）查询 用户列表
	 * @param param
	 * @return
	 */
	@Override
	public List<User> findUserByIds(String param) {
		List<User> userList ;
		if(param != null && param.contains(",")){
			String[] idArray = param.split(",");
			List<String> list =  Arrays.asList(idArray);
			userList = userDao.findAutoByIds(list);
		}else if(StringUtils.isNumber(param)){
			userList = userDao.findAutoById(param);
		}else {
			userList = userDao.findAutoByName(param);
		}

		return userList;
	}

	/**
	 * 根据用户name 模糊查询 用户列表
	 * @param ids
	 * @return
	 */
	@Override
	public List<User> findUserById(String ids) {
		return userDao.findAutoById(ids);
	}

	/**
	 * 根据用户name 模糊查询 用户列表
	 * @param name
	 * @return
	 */
	@Override
	public List<User> findUserByName(String name) {
		return userDao.findAutoByName(name);
	}


	/**
	 * 根据用户name 模糊查询 用户列表
	 * @param name
	 * @return
	 */
	@Override
	public List<UserVo> autoFindByName(String name) {
		return userDao.selectAutoByName(name);
	}


	/**
	 * 根据用户ID 模糊查询 用户列表
	 * @param id
	 * @return
	 */
	@Override
	public List<UserVo> autoFindById(String id){
		return userDao.selectAutoById(id);
	}
}
