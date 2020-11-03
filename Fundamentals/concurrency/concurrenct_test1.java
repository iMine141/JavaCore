package Fundamentals.concurrency;

public class concurrenct_test1 {
    public int counter = 0;

    public static void main(String[] args) throws IllegalThreadStateException{
        concurrenct_test1 obj = new concurrenct_test1();

        for (int i = 0; i < 5; i++) {
            new Thread1Derc(obj).start();

            new Thread1Inr(obj).start();
        }
    }

}

class Thread1Inr extends Thread{
    concurrenct_test1 obj;
    Thread1Inr(concurrenct_test1 obj){
        this.obj = obj;
    }
    @Override
    public void run() {
        synchronized (obj){
            if (obj.counter != 0){
                try {
                    obj.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            obj.counter++;
            System.out.println("Thread1Inr : " + obj.counter);
            obj.notifyAll();
        }
    }
}

class Thread1Derc extends Thread{
    concurrenct_test1 obj;
    Thread1Derc(concurrenct_test1 obj){
        this.obj = obj;
    }
    @Override
    public void run() {
        synchronized (obj){
            if (obj.counter == 0){
                try {
                    obj.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            obj.counter--;
            System.out.println("Thread1Derc : " + obj.counter);
            obj.notifyAll();
        }
    }
}

