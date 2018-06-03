package vo;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlText;

/**
 * Created by edison on 2018/5/7.
 */
public class TeacherType {
    @JacksonXmlProperty(isAttribute = true, localName = "type")
    private String type;

        @JacksonXmlText
    private String value;

    public TeacherType() {

    }

    public TeacherType(String type, String value) {
        this.type = type;
        this.value = value;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
