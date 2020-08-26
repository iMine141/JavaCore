import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * @author wym
 */
public class circle {
    public static void main(String[] args) {
        Long aa = 1597992181L;
        //用Date构造bai方法，将long转duDate
        Date date = new Date(aa );
        SimpleDateFormat format = new SimpleDateFormat("xx");
        //用SimpleDateFormat将Date转xxxx-xx-xx格式的zhi字符串日期dao
        String stringDate = format.format(date);
        System.out.println(stringDate);
    }
}
