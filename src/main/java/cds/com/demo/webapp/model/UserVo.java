package cds.com.demo.webapp.model;

/**
 * @author edison
 * Created by edison on 2017/10/15.
 */
public class UserVo {
    /**
     * 用户ID值
     */
    private String value;
    /**
     * 用户显示标签
     */
    private String label;
    /**
     * 用户显示描述
     */
    private String desc;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
