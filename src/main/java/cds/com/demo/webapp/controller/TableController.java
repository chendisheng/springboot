package cds.com.demo.webapp.controller;

import cds.com.demo.webapp.model.PageDto;
import cds.com.demo.webapp.model.ServiceData;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


/**
 * Created by edison on 2017/8/2.
 */
@RequestMapping("/data")
@Controller
public class TableController {

    @Value("${application.message:Hello World}")
    private String message = "Hello World";



    @RequestMapping(value="getList", method= RequestMethod.GET)
    @ResponseBody
    public Object hello() {
//        model.put("time", new Date());
//        model.put("message", this.message);

        ServiceData sd = new ServiceData();
        List<HashMap<String,String>> list = new ArrayList<HashMap<String,String>>();

        for(int i = 0 ; i< 5 ; i++){
            HashMap<String,String> hashMap = new HashMap<String, String>();
            hashMap.put("JX_NAME","JX_NAME"+i);
            hashMap.put("JX_ORG","JX_ORG"+i);
            hashMap.put("JX_TIME","JX_TIME"+i);
            hashMap.put("JX_RANK","JX_RANK"+i);
            hashMap.put("rowNo","rowNo"+i);
            list.add(hashMap);
        }

        PageDto page = new PageDto();
        page.setTotal(list.size());
        page.setRecords(list);
        sd.setBo(page);
        return sd;
    }

    /**
     * asdfasdfas
     * @return
     */
    @RequestMapping(value="/getList2", method= RequestMethod.GET)
    @ResponseBody
    public Object hello2() {

        ServiceData sd = new ServiceData();

        List<HashMap<String,String>> list = new ArrayList<HashMap<String,String>>();

        for(int i = 0 ; i< 5 ; i++){
            HashMap<String,String> hashMap = new HashMap<String, String>();
            hashMap.put("ZSCQ_XS","ZSCQ_XS"+i);
            hashMap.put("ZSCQ_NAME","ZSCQ_NAME"+i);
            hashMap.put("ZSCQ_CODE","ZSCQ_CODE"+i);
            hashMap.put("ZSCQ_TIME","ZSCQ_TIME"+i);
            hashMap.put("rowNo","rowNo"+i);
            list.add(hashMap);
        }

        PageDto page = new PageDto();
        page.setTotal(list.size());
        page.setRecords(list);
        sd.setBo(page);
        return sd;
    }

}
