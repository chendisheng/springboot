package cds.com.demo.webapp.model;

import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.annotation.Id;

import java.io.Serializable;

/**
 * @author edison
 * 2017/7/28.
 */

@Configuration
@EnableCaching
public class DemoInfo  implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    private long id;
    private String name;
    private String pwd;
    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPwd() {
        return pwd;
    }
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Override
    public String toString() {
        return"DemoInfo [id=" + id + ", name=" + name + ", pwd=" + pwd + "]";
    }
}