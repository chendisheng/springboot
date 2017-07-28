package cds.com.demo.webapp.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import cds.com.demo.webapp.model.User;

import java.util.List;

/**
 * Created by edison on 2017/7/22.
 */
@Repository("userDao")
public interface IUserDao {
    int insert(@Param("user") User record);
    List<User> selectAll();
}
