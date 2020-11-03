package Fundamentals.concurrency;

public class MyObject {
    public static void main(String[] args) {
        obj obj = new obj();
//        ThreadInc threadInc = new ThreadInc(obj);
//        ThreadDerc threadDerc = new ThreadDerc(obj);
        for (int i = 0; i < 5; i++) {
            new ThreadDerc(obj).start();

            new ThreadInc(obj).start();
        }
    }
}

class obj{
    private int counter = 0;

    synchronized void increase(){
        if (counter != 0){
            try {
                System.out.println("increase 开始等待 ");
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        counter++;
        System.out.println("increase : "+counter);
        notify();
    }


    synchronized void decrease(){
        if (counter == 0){
            try {
                System.out.println("decrease 开始等待 ");
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        counter--;
        System.out.println("decrease : "+counter);
        notify();
    }
}

class ThreadInc extends Thread{
    private obj o;
    ThreadInc(obj ob){
        o = ob;
    }
    @Override
    public void run() {
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        o.increase();

    }
}

class ThreadDerc extends Thread{
    private obj o;
    ThreadDerc(obj ob){
        o = ob;
    }
    @Override
    public void run() {

        o.decrease();

    }
}
