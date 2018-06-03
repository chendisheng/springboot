package vo;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamImplicit;

import java.util.List;

/**
 * Created by edison on 2018/5/7.
 */
@XStreamAlias("mail")
public class Mail {
    private String from;
    private String to;

//    @XStreamImplicit(itemFieldName="body")
    private List<MailBody> mailBody;

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public List<MailBody> getMailBody() {
        return mailBody;
    }

    public void setMailBody(List<MailBody> mailBody) {
        this.mailBody = mailBody;
    }
}
