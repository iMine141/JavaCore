package Fundamentals.Reflection;

import sun.misc.ClassLoaderUtil;

import java.lang.reflect.Method;
import java.lang.reflect.Parameter;

/**
 * @author wym
 */
public class reloadTest {

    public static void main(String[] args) {
        Class<reloadTest> reloadTestClass = reloadTest.class;
        Method[] methods = reloadTestClass.getMethods();
        for (Method aa : methods){
            System.out.println("method name : " + aa.getName());
            for (Parameter bb : aa.getParameters()){
                System.out.println("    param name and type :" + bb.getName() + " " +bb.getType().getName());
            }
        }
    }

    public void test1(String str, int i){
        System.out.println("str , int");
    }

    public void test1(int i, String str){
        System.out.println("int , str");
    }

    public void test1(Integer i, String str){
        System.out.println("Integer , str");
    }

}
