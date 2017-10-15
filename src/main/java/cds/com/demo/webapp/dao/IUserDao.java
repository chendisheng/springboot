package cds.com.demo.webapp.dao;

import cds.com.demo.webapp.model.UserVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import cds.com.demo.webapp.model.User;

import java.util.List;

/**
 * @author edison
 */
@Repository
public interface IUserDao {
    /**
     * 插入用户
     * @param record
     * @return
     */
    int insert(@Param("user") User record);

    /**
     * 查询用户
     * @return
     */
    List<User> selectAll();

    /**
     * 根据用户ID查询用户列表
     * @param ids
     * @return
     */
    List<User> selectByIds(@Param("ids") List<String> ids);

    /**
     * 根据用户ID 多个查用户列表 自动补全
     * @param ids
     * @return
     */
    List<UserVo> selectAutoByIds(@Param("ids") List<String> ids);

    /**
     * 根据用户ID 模糊 查用户列表 自动补全
     * @param id
     * @return
     */
    List<UserVo> selectAutoById(@Param("id") String id);

    /**
     * 根据用户name 模糊 查用户列表 自动补全
     * @param name
     * @return
     */
    List<UserVo> selectAutoByName(@Param("name") String name);

}
