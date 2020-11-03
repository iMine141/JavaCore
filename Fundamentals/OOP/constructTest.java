package Fundamentals.OOP;

public class constructTest {
    public static void main(String[] args) {
        String path = child.class.getResource("/").getPath();
        System.out.println(path);


        child child = new child();

    }

}
class parent{
    public parent(){
        System.out.println("parent construct");
    }
}

class child extends parent{
    public child(){

        System.out.println("child construct");
    }
}

