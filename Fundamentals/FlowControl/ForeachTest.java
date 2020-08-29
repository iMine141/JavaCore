package Fundamentals.FlowControl;

import java.util.ArrayList;

/**
 * @author wym
 */
public class ForeachTest {
    public static void main(String[] args) {
        changeListValue();
    }

    /**
     * 改变数据的值
     * 对象类型、基本类型、String
     */
    public static void changeListValue(){
        ArrayList<String> integers = new ArrayList<String>();
        integers.add( "a");
        integers.add( "b");
        integers.add( "c");

        for (String item:
                integers) {
            item = "pp";
        }

        for (String item:
                integers) {
            System.out.println("item : "+item);
        }


        // ArrayList<user> integers = new ArrayList<user>();
        // integers.add(new user("tt","yy"));
        // integers.add(new user("ii","oo"));
        // integers.add(new user("kk","ll"));
        //
        // for (user item:
        //         integers) {
        //     item.setName("wym");
        //     item.setValue("xmf");
        // }
        //
        // for (user item:
        //         integers) {
        //     System.out.println("name : "+item.getName());
        //     System.out.println("value : "+item.getValue());
        //     // name : wym
        //     // value : xmf
        //     // name : wym
        //     // value : xmf
        //     // name : wym
        //     // value : xmf
        // }
    }



    class user{
        String name;
        String value;

        public user(String name, String value) {
            this.name = name;
            this.value = value;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }
    }

}
