package cds.com.demo.webapp.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;


/**
 * Created by edison on 2017/8/2.
 */
@Controller
public class MainController {

    @Value("${application.message:Hello World}")
    private String message = "Hello World";

    @RequestMapping(value = "/index", method= RequestMethod.GET)
    public String welcome(ModelMap model) {
        model.put("time", new Date());
        model.put("message", this.message);
        return "index";
    }
    @RequestMapping(value = "/hello", method= RequestMethod.GET)
    public String hello(ModelMap model) {
        model.put("time", new Date());
        model.put("message", this.message);
        return "hello";
    }

    @RequestMapping(value = "/valid", method= RequestMethod.GET)
    public String validateForm(ModelMap model) {
        model.put("time", new Date());
        model.put("message", this.message);
        return "validateForm";
    }



}
