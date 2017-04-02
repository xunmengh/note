package com.xm.base.collection;

import org.junit.Test;

import java.util.*;
import java.util.concurrent.*;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

/**
 * Created by xm on 2017/3/13.
 *
 *
 */
public class CollectionUtils {


    @Test
    public void collections(){
        List list = Collections.synchronizedList(new LinkedList());
        Collections.unmodifiableCollection(new LinkedList());

        String[] array={"2","1"};
        String [] cope=array;
        assertEquals(2,cope.length);
        cope=null;
        assertEquals("1",array[1]);

        String[] newArray= Arrays.copyOf(array,3); //  对数组进行复制

        assertEquals("2",newArray[0]);
        assertEquals("1",newArray[1]);
        assertEquals(3,newArray.length);

        //Arrays.asList(array) 返回大小固定的list ，
        List<String> ls=new ArrayList<String>(Arrays.asList(array));

        Collections.sort(ls);// 进行排序处理

        assertEquals("2",newArray[0]);

        Collections.addAll(ls,"13","24");

        Collections.reverseOrder();//

       System.out.println(Arrays.deepToString(array));// 多维数组转换为string


       String [] b=new String[10];
        Arrays.fill(b,"hello");// 数据填充
        System.out.println(Arrays.toString(b));//装换为字符串
        String []c=new String[10];

        System.arraycopy(b,0,c,0,c.length);

        assertTrue(Arrays.equals(b, c));

        Integer[] data=generate(10);
        System.out.println(Arrays.toString(data));
        Arrays.sort(data,Collections.reverseOrder()); //排序
        System.out.println(Arrays.toString(data));

        sort(data);
        System.out.println(Arrays.toString(data));
    }


    private void sort(Integer[] a)
    {
        int temp = 0;
        for (int i = a.length - 1; i > 0; --i)
        {
            for (int j = 0; j < i; ++j)
            {
                if (a[j + 1] < a[j])
                {
                    temp = a[j];
                    a[j] = a[j + 1];
                    a[j + 1] = temp;
                }
            }
        }
    }

    private Integer[] generate(int size){
        Integer[] result=new Integer[size];
        Random random=new Random();
        for(int i=0;i<size;i++){
            result[i]=random.nextInt(100);
        }
        return result;
    }

    public void method(Collection<String>  c,Collection<String>  c2){
        c.add("string");
        c.addAll(c2);
//        Iterable<String> iterable=c.iterator();
        c.contains("string");
        c.containsAll(c2);
        //common-collections  containsAll 将低复杂度
        c.remove("string");
        c.removeAll(c2);
        c.retainAll(c2);
        c.clear();
        c.isEmpty();
        c.size();
        c.toArray();
    }

    @Test
    public  void list(){
        /*
        * 内部使用数组存取， system.arraycopy(src,index,target,offset,length);
        * */
        ArrayList<String> ls=new ArrayList<String>(20);
        ls.add("12");
        ls.add(1,"d");
        ls.add("three");
        ls.set(2, "threeSet");
        assertEquals("12", ls.get(0));
        assertEquals(1,ls.indexOf("d"));
        assertEquals("threeSet",ls.get(2));

        //198
        //ls.ensureCapacity();

//        ls.lastIndexOf("d");

//        ls.iterator();

 //       ls.listIterator();
        ArrayList<String>ls3= (ArrayList<String>) ls.clone();

        List<String> ls2=ls.subList(0, 1); // 共用同一份数据
        ls2.set(0,"zero");
        assertEquals("zero",ls.get(0));

        assertEquals("12",ls3.get(0)); // 数据没有改变


        CopyOnWriteArrayList cp=new CopyOnWriteArrayList();


    }

    public void linkedList() throws InterruptedException {
        /*
        *
        * 内部使用链表
        *
        * queue
        * throws Exception   none
        * add                 offer
        * remove              poll
        * element             peek
        *
        * deueue
        * addLast    offerLast
        *
        *
        * Stack Method
        *  push
        *  pop
        *  peek
        *
        * */
        LinkedList<String> ls2=new LinkedList<String>();
       /* ls2.pop();
        ls2.peek();
        ls2.push("sd");*/

          /*
        *  DelayQueue
        *  PriorityQueue   Comparator
        * */


        /*
        *
        * blocking     timeout
        * put(e)      offer(e, time, unit)
        * take        poll(time, unit)
        *
        *   notEmpty.await(); 线程中通信
        *   notEmpty.signal();
        * */
        LinkedBlockingQueue bq=new LinkedBlockingQueue<String>(10);
        bq.poll(1000, TimeUnit.MILLISECONDS);

        /*
        * UNSAFE.compareAndSwapObject
        * */
        ConcurrentLinkedQueue cq=new ConcurrentLinkedQueue();

        /*
        * SynchronousQueue
        *
        * 阻塞队列，队列大小为0 ， 一个线程 put  ，另外一个线程 take ，才会解锁。
        * */

        SynchronousQueue sq=new SynchronousQueue();


        /*
        *  ConcurrentLinkedQueue、SynchronousQueue (公平模式下)、无界的LinkedBlockingQueues等的超集
        * */
        LinkedTransferQueue<String> ltf=new LinkedTransferQueue<String>();
        ltf.getWaitingConsumerCount();// 获得消费线程的数量
        ltf.hasWaitingConsumer();// 是否有消费线程
        ltf.transfer("sd");// 若当前存在一个正在等待获取的消费者线程，即立刻移交之；否则，会插入当前元素e到队列尾部，并且等待进入阻塞状态，到有消费者线程取走该元素。
        ltf.tryTransfer("ds", 1000L, TimeUnit.MILLISECONDS);//若当前存在一个正在等待获取的消费者线程，会立即传输给它;否则将插入元素e到队列尾部，并且等待被消费者线程获取消费掉；若在指定的时间内元素e无法被消费者线程获取，则返回false，同时该元素被移除。
     }

     public void set(){
         HashSet<String> set=new HashSet<String>();
         set.add("1");

     }
}
