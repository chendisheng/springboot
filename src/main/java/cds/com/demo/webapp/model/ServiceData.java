package cds.com.demo.webapp.model;

import java.util.Map;

/**
 * @author edison
 * Created by edison on 2017/8/4.
 */
public class ServiceData {
    private Code retCode;
    private Object bo;
    private Map<String,Object> map;

    public Code getRetCode() {
        return retCode;
    }

    public void setRetCode(Code retCode) {
        this.retCode = retCode;
    }

    public Object getBo() {
        return bo;
    }

    public void setBo(Object bo) {
        this.bo = bo;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
