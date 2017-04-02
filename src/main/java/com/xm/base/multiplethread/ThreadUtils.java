package com.xm.base.multiplethread;

import org.junit.Test;

import java.util.concurrent.*;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * Created by xm on 2017/3/24.
 */
public class ThreadUtils {

    /*
    *  disruptor  并发框架
    *  AKKA
    *  amino
    *  kilim
    *
    *  jstack 工具  javap 命令
    * 线程的状态  Thread.State  定义了线程的状态
    * Thread group的
    *
    * synchronized 在某个对象上对这个对象加锁，； 在方法上，对对象的实例加载， 在静态方法上，对类加锁，
    *
    * synchronized(i)  i++ 创建不同的对象，会导致锁有问题。
    *
    *
    * ReentrantLock  优点：1.控制锁的获得和释放   可中断 lockInterruptibly    rLock1.isHeldByCurrentThread()是否获得锁
    *                   2. tryLock  设置等待时间
    *                   3. ReentranLock(true) 实现公平锁
    *
    *                   LockSupport .pack  unpack 加锁解锁    UNSAFE.park
    *
    * 线程池
    *  Worker  runWorker getTask
     schedule   DelayedWorkQueue  重写 take  condition.await()

    * corePoolSize,  idea 的个数
    * maximumPoolSize,  最大线程数
     * keepAliveTime, unit, 当线程数量大于 corePoolSize 后，多余线程的存活时间
     * workQueue,
             threadFactory,
             defaultHandler

        拒绝策越

        beforeExecute

        shutdown 不在接受任务，等待在执行的任务执行完毕


        偏向锁 ：线程获得锁，那么锁就进入偏向模式。当再次请求锁时，无需做同步操作
                适用于竞争比较少的情况
                -XX:+UseBiasedLocking 开启偏向锁

        轻量级锁 :

        ThreadLocalMap

        CAS 原子变量


         ConcurrentLinkedQueue

         future、
         fork/join
         ForkJoinPool   ForkJoinTask(RecursiveAction,RecursiveTask);invokeAll

         单例双double 存在的问题在于 没有加锁的变量访问是不可见的

         private final static ThreadLocal

    * */

//    @Test
     public  void  state(){
            for(Thread.State state:Thread.State.values()){
                System.out.print(state.name()+" ");
            }
            System.out.println();

            Thread t=new Thread(){
                private volatile boolean b=false; // 内存可见， 编译器不会优化顺序，

                public void run(){
                        Object obj=new Object();
                        /*long now=System.currentTimeMillis();
                        long end=now+1000;
                        while(now<end){

                            now=System.currentTimeMillis();
                        }*/
                    try {
                        synchronized (obj){  //
                            // 必须包含在锁内边  IllegalMonitorStateException
                            //
                            obj.wait(100); // 释放对象的锁

                            //obj.notify();
                            //obj.notifyAll();
                        }

                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }

                    System.out.println(currentThread().interrupted());
                    System.out.println("run");
                }
            };


            t.start();
        System.out.println(t.activeCount());

         Thread[] ts=new Thread[3];
         t.enumerate(ts);// 将活动线程拷贝到数组中
        for(Thread temp :ts){
            System.out.println(temp.getName());
        }

     /*   t.interrupt();// 会对休眠，等待锁的线程中断，
        System.out.println(t.isInterrupted());

        System.out.println(t.isInterrupted());*/
        try {
            t.join();// 阻塞当前线程，直到目标线程执行完毕
//            t.yield();
            System.out.println(t.getState());
        } catch (InterruptedException e) {
            e.printStackTrace();
        }


    }


    //@Test
    public void sync() {
        Thread t1=new Thread(new R(1));
        Thread t2=new Thread(new R(2));
        t1.start();
        t2.start();
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        t2.interrupt();// 死锁中断不起作用

        try {
            t1.join();
            t2.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    //@Test
    public void lock() {
        Thread t1=new Thread(new R(3));
        Thread t2=new Thread(new R(4));
        t1.start();
        t2.start();
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        t2.interrupt();// 死锁中断不起作用

        try {
            t1.join();
            t2.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void  tryLock(){
        // Condition 相对于 obj 的 wait  notify
        ReentrantLock rLock1=new ReentrantLock();
        Condition c1= rLock1.newCondition();
        rLock1.lock();
        try {
            rLock1.tryLock(5, TimeUnit.SECONDS);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
//        c1.await();
        rLock1.unlock();
    }

//    @Test
    public void sempare() throws InterruptedException {
          // 线号量能够控制获得锁的个数
        Semaphore  semaphore=new Semaphore(10);
        semaphore.acquire(2);
        semaphore.release(2);
    }

//    @Test
    public void readWriter(){
        /*
        * 都写锁互斥
        *
        * */
        ReentrantReadWriteLock rwLock=new ReentrantReadWriteLock();
        ReentrantReadWriteLock.ReadLock readLock=rwLock.readLock();
        ReentrantReadWriteLock.WriteLock writeLock=rwLock.writeLock();
    }

//    @Test
    public void cutDown() throws InterruptedException {
        CountDownLatch cd=new CountDownLatch(10);
        Runnable r=new Runnable() {
            @Override
            public void run() {
                System.out.println(Thread.currentThread().getName());
                cd.countDown();

            }
        };

        for(int i=0;i<10;i++){
            Thread t=new Thread(r);
            t.start();
        }
        cd.await();
        System.out.println("fire");

    }

//  97

    @Test
    public void CyclicBarrier(){
        int count=5;
        CyclicBarrier cyb=new CyclicBarrier(count, new Runnable() {
            @Override
            public void run() {
                 System.out.println("12");
            }
        });

        class R implements  Runnable{
            CyclicBarrier cyb;
            public R(CyclicBarrier cyb){
                this.cyb=cyb;
            }

            public void run(){
                try {
                    cyb.await();
                    System.out.println(Thread.currentThread().getName());
                    cyb.await();
                    System.out.println(Thread.currentThread().getName()+" second");
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } catch (BrokenBarrierException e) {
                    e.printStackTrace();
                }
            }
        }

        R r=new R(cyb);
        for(int i=0;i<count;i++){
            Thread t=new Thread(r);
            t.start();
        }

    }


    @Test
    public  void  threadpool(){
        ExecutorService pool= Executors.newCachedThreadPool();
//             ExecutorService pool= Executors.newFixedThreadPool(3);
        Executors.newSingleThreadExecutor();
        ScheduledExecutorService schedule=  Executors.newScheduledThreadPool(3);
//        schedule.scheduleAtFixedRate();
//        schedule.scheduleWithFixedDelay()


        Runnable r=new Runnable() {
            @Override
            public void run() {
                System.out.println(Thread.currentThread().getName());
            }
        };
        for(int i=0;i<10;i++) {
            pool.submit(r); // 有返回值 ，
//            pool.execute(r); //execute 无返回值
        }

  /*      ThreadPoolExecutor threadPool=null;
        threadPool.getActiveCount();
        threadPool.invokeAny();
         threadPool.invokeALL(); 等待所有执行完成
         */


        schedule.schedule(r,2,TimeUnit.SECONDS);
    }

    @Test
    public void call(){
        class IntC implements Callable<Integer>{

            @Override
            public Integer call() throws Exception {
                return 1;
            }
        }

        ExecutorService pool= Executors.newFixedThreadPool(3);
       Future<Integer> future= pool.submit(new IntC());
        try {
            future.cancel(false);// false 任务在执行时 不会取消，
            // 继承 FutureTask<String> 覆盖 done 在 任务 执行完之后会 调用done
           System.out.println(future.get()) ;
            System.out.println(future.isDone()) ;
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

    }


    public void forkJoin(){

    }


 }

/*
*    单例模式
* */
  class StaticSingleton{
      private StaticSingleton(){
          System.out.println("StaticSingleton is create");
      }

      private static class SingletonHolder{
          // 防止无故加载
          private static StaticSingleton instance=new StaticSingleton();
      }

      public static StaticSingleton getInstance(){
          return SingletonHolder.instance;
      }
  }

class R implements Runnable{

    private static  Object obj1=new Object();
    private  static Object obj2=new Object();

    private static ReentrantLock rLock1=new ReentrantLock();
    private static ReentrantLock rLock2=new ReentrantLock();

    private int lock;
    public R(int lock){
        this.lock=lock;
    }
    @Override
    public void run() {
        if(lock==1){
            synchronized(obj1){
                sleepMethod();
                synchronized(obj2){
                    System.out.println("获得obj2的锁");
                }

            };


        }else if(lock==2){

            synchronized(obj2){
                sleepMethod();
                synchronized(obj1){
                    System.out.println("获得obj1的锁");
                }

            }


        }else if(lock==3){
            try {
                rLock1.lockInterruptibly();
                sleepMethod();
                rLock2.lockInterruptibly();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }finally {
                if (rLock2.isHeldByCurrentThread()) {
                    rLock2.unlock();
                }
                if (rLock1.isHeldByCurrentThread()) {
                    rLock1.unlock();
                }
            }
        }else if(lock==4){
            try {
                rLock2.lockInterruptibly();
                sleepMethod();
                rLock1.lockInterruptibly();
            } catch (InterruptedException e) {
//                e.printStackTrace();
            }finally {
                if(rLock2.isHeldByCurrentThread()){
                    rLock2.unlock();
                }
                if(rLock1.isHeldByCurrentThread()){
                    rLock1.unlock();
                }


            }

        }

        System.out.println(Thread.currentThread().getName());
    }

    private void sleepMethod(){
        long now=System.currentTimeMillis();
        long end=now+1000;
        while(now<end){
            now=System.currentTimeMillis();
        }
    }


}
