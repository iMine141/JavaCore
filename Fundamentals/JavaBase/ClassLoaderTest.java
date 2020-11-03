package Fundamentals.JavaBase;

/**
 * 类加载器
 */
public class ClassLoaderTest {
    public static void main(String[] args){
        // BootStrap ClassLoader 加载的文件
        System.out.println(System.getProperty("sun.boot.class.path"));
        /**
         * 打印了
         * resources.jar
         * rt.jar
         * sunrsasign.jar
         * jsse.jar
         * jce.jar
         */

        //Extendsion ClassLoader
        System.out.println(System.getProperty("java.ext.dirs"));

        //1.Application ClassLoader
        System.out.println(System.getProperty("java.class.path"));

        //2.Application ClassLoader
        ClassLoader classLoader = ClassLoaderTest.class.getClassLoader();
        System.out.println(classLoader.toString());

    }
}
