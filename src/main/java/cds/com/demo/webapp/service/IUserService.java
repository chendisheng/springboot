package cds.com.demo.webapp.service;

import java.util.List;

import cds.com.demo.webapp.model.User;
import cds.com.demo.webapp.model.UserVo;

/**
 * 用户服务
 * @author Raye
 * @since 2016年9月21日20:57:39
 */
public interface IUserService {
	/**
	 * 添加一个用户
	 * @param user 用户对象
	 * @since 2016年9月21日20:58:17
	 * @return 是否添加成功
	 */
	public boolean add(User user);
	/**
	 * 查询所有用户
	 * @return
	 */
	public List<User> findAll();

	/**
	 * get user list by id
	 * @param ids
	 * @return
	 */
	public List<User> findById(String ids);


	/**
	 * get user list by id
	 * @param ids
	 * @return
	 */
	List<UserVo> autofindByIds(String ids);

	/**
	 * get user list by id
	 * @param ids
	 * @return
	 */
	List<UserVo> autoFindById(String ids);

	/**
	 * get user list by name
	 * @param name
	 * @return
	 */
	List<UserVo>  autoFindByName(String name);


}
