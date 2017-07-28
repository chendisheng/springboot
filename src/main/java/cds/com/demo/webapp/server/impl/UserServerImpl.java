package cds.com.demo.webapp.server.impl;

import java.util.List;

import cds.com.demo.webapp.dao.IUserDao;
import cds.com.demo.webapp.server.UserServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cds.com.demo.webapp.model.User;

/**
 * 用户相关数据库操作实现类
 * @author Raye
 * @since 2016年10月11日19:29:02
 */
@Repository
public class UserServerImpl implements UserServer {
	@Autowired
	private IUserDao userDao;
	
	public boolean add(User user) {
		return userDao.insert(user) > 0;
	}

	public List<User> findAll() {
		return userDao.selectAll();
	}

}
