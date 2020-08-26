import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author wym
 */
public class Time {
    public static void main(String[] args) {
        getTime("2020:8:25");
    }

    // 将字符串转为时间戳
    public static String getTime(String user_time) {
        String str = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d;
        try {
            d = sdf.parse(user_time);
            long l = d.getTime();
            str = String.valueOf(l);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return str;
    }
}
