package cds.com.demo.webapp.service;

import cds.com.demo.webapp.model.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Profile;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * Created by edison on 2017/8/19.
 */
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@Profile("test")
public class UserServiceTest {
    @Autowired
    private IUserService userService;

    @Test
    public void testAddUser(){
        User user = new User();
        user.setUsername("user02");
        user.setPsw("123");
        userService.add(user);

    }

}
