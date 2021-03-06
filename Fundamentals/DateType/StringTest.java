package Fundamentals.DateType;

/**
 * @author wym
 */

import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;

/**
 * 字符串的测试
 */
public class StringTest {
    public static void main(String[] args) {
        getDateDay();
        System.out.println("variability");
        variability();
        System.out.println("variability2");
        variability2();
    }

    //可变性1
    public static void variability(){
        String a = "ab";
        a = "gg";
        System.out.println(a);
    }
    //可变性1
    public static void variability2(){
        HashSet<String> stringHashset = new HashSet<String>();
        String a = "a";
        String b = "b";
        String c = "c";

        stringHashset.add(a);
        stringHashset.add(b);
        stringHashset.add(c);

        for (String item :
                stringHashset) {
            System.out.println("循环之前： "+ item);
            item = "a";
            System.out.println("循环之后： "+ item);
        }

        for (String item :
        stringHashset) {
            System.out.println("值 : "+item);
        }
    }

    public static void getDateDay(){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.DAY_OF_MONTH, +1);
        int i = calendar.get(Calendar.DATE);
        System.out.println(i);
    }

}
