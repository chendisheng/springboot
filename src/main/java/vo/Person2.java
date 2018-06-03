package vo;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamAsAttribute;

import java.util.List;

/**
 * Created by edison on 2018/5/7.
 */
@XStreamAlias("person")
public class Person2 {
    private String name;
    @XStreamAsAttribute
    private int age;

    List<String> girlFriends;

    public List<String> getGirlFriends() {
        return girlFriends;
    }

    public void setGirlFriends(List<String> girlFriends) {
        this.girlFriends = girlFriends;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }
}