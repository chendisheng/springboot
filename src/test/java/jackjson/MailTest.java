package jackjson;

import com.thoughtworks.xstream.XStream;
import org.junit.Test;
import vo.Mail;
import vo.MailBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by edison on 2018/5/7.
 */
public class MailTest {

    @Test
    public void testBean2Xml(){
        XStream xstream = new XStream();
        XStream.setupDefaultSecurity(xstream);
        xstream.autodetectAnnotations(true);
        List<MailBody> list = new ArrayList<MailBody>();
        MailBody body1 = new MailBody();
        body1.setId("cn");
        body1.setSysCode("sysCode1");
        body1.setSysName("sysName1");
        list.add(body1);

        MailBody body2 = new MailBody();
        body2.setId("en");
        body2.setSysCode("sysCode2");
        body2.setSysName("sysName2");
        list.add(body2);

        Mail mail = new Mail();
        mail.setFrom("123");
        mail.setTo("45p6");
        mail.setMailBody(list);

        System.out.println(xstream.toXML(mail));
    }

    @Test
    public void testXmlToBean(){
        XStream xstream = new XStream();
        XStream.setupDefaultSecurity(xstream);
        xstream.autodetectAnnotations(true);
        List<MailBody> list = new ArrayList<MailBody>();
        MailBody body1 = new MailBody();
        body1.setId("cn");
        body1.setSysCode("sysCode1");
        body1.setSysName("sysName1");
        list.add(body1);

        MailBody body2 = new MailBody();
        body2.setId("en");
        body2.setSysCode("sysCode2");
        body2.setSysName("sysName2");
        list.add(body2);

        Mail mail = new Mail();
        mail.setFrom("123");
        mail.setTo("45p6");
        mail.setMailBody(list);

        String xml = xstream.toXML(mail);

        Mail mail2 = (Mail)xstream.fromXML(xml);
        System.out.println("mail2 :"+mail2.toString());
    }
}
