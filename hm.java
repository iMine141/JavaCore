import java.util.HashMap;

/**
 * @author wym
 */
public class hm {
    public static void main(String[] args) {

        HashMap<String, Integer> stringIntegerHashMap = new HashMap<>();
        stringIntegerHashMap.put("we",2);
        Object hm = stringIntegerHashMap;

        HashMap hm1 = (HashMap) hm;
        Integer we = (Integer)hm1.get("we");
        System.out.println(we);
    }
}
