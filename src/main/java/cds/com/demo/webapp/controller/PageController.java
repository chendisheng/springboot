package cds.com.demo.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by edison on 2018/1/20.
 */
@Controller
@RequestMapping("/html")
public class PageController {
    @RequestMapping("/user/list")
    public String pageUserList(){
        return "users/list";
    }
}
