import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author wym
 */
 class streamTest {
    public static void main(String[] args) {
        user user1 = new user();
        user1.setAge(1);
        user1.setName("wym");

        user user2 = new user();
        user2.setAge(2);
        user2.setName("xmf");

        List<user> users = new ArrayList<>() ;
        users.add(user1);
        users.add(user2);

        List<Integer> collect = users.stream().map(user -> user.getAge()).collect(Collectors.toList());
        List<Integer> collect1 = collect;
        System.out.println();
    }
}



class user {
     String name ;
     int age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}