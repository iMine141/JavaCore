package Fundamentals.PackageAccess;

/**
 * @author wym
 */
public class Cookie {
    public Cookie() {
        System.out.println("Cookie constructor");
    }

    //包访问权限，是不能被其他包访问的
    void bite() {
        System.out.println("bite");

    }
}
