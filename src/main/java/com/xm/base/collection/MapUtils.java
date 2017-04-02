package com.xm.base.collection;

import org.junit.Test;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentSkipListMap;
import java.util.concurrent.TimeUnit;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

/**
 * Created by xm on 2017/3/21.
 */
public class MapUtils {

    /*
    *  hashcode  默认使用对象的地址，
    *  equal 默认是相等， 先执行hashcode ，在执行equal
    *
    *
    * System.identityHashCode
    * */
    @Test
    public  void map(){
        /*
        *   hashMap  内部使用数组，
        *   key 进行hash 运算，取数组大小的模 存放在相应的位置，如果已经存在 放在该元素的next链表上
        *   当 元素大于数组的threshold 时进行扩容(原来的两倍)
        *   Node<key,value>  next
        *
        *   hashTable 是线程安全的hashMap，已经被 ConcurrentHashMap 取代
        *
        *   WeakHashMap 此种Map的特点是，当除了自身有对key的引用外，此key没有其他引用那么此map会自动丢弃此值，
        *
        *   IdentityHashMap : key 使用== 判断， 其他的使用equal
        *
        *   linkedHashMap  迭代的顺序和添加的顺序保持一致
        *   修改迭代器  重写 newNode方法  添加 before， after 节点
        *
        *   TreeMap 根据比较器进行排序  left right
        *
        *   EnumMap  使用情景？
        *
        *  ConcurrentHashMap :多线程安全的map , 减小锁的粒度。 遍历的时候不是线程安全的
        *
        *  ConcurrentSkipListMap 排序的并发的map
        *
        * */
       Map<String,String> map=new HashMap<String,String>();
       map.put("1","1");


        Map<String,String> map2=new HashMap<String,String>();
        map2.put("2","2");
        map2.put("a","a");
        map2.put("b","b");

        map.putAll(map2);// 添加map中的数据

        assertEquals("2",map2.get("2"));


        Iterator<String> it=   map.keySet().iterator();;
        while(it.hasNext()){
            System.out.println(it.next());
        }

        LinkedHashMap<String,String> lkMap=new LinkedHashMap<String,String>();
        lkMap.put("1","1");
        lkMap.put("2","2");
        lkMap.put("a","a");
        lkMap.put("b","b");
        /*Iterator<String> ikit=  lkMap.keySet().iterator();
        while(ikit.hasNext()){
            System.out.println(ikit.next());
        }*/

        System.out.println(lkMap);

        //LRU 算法元素的顺序
        LinkedHashMap<String,String> lkMap2=new LinkedHashMap<String,String>(16,0.75f,true);// true 表示lru算法
        lkMap2.putAll(lkMap);

        System.out.println(lkMap2);
        lkMap2.get("1");
        System.out.println(lkMap2); // 访问的元素放在 最后面

        Random random=new Random();

        TreeMap<Integer,String> treeMap=new TreeMap<Integer,String>();
        for(int i=0;i<20;i++){
            int v=random.nextInt(100);
            treeMap.put(v,""+v);
        }

        Iterator<Integer> tmit=  treeMap.keySet().iterator();
        while(tmit.hasNext()){
            System.out.print(tmit.next() + " ");
        }

        EnumMap<C /**/,String> emap=new EnumMap<C, String>(C.class);
        emap.put(C.client, "error");

        // weakHashMap
        String a = new String("a");
        String b = new String("b");
        Map weakmap = new WeakHashMap();
        Map map3 = new HashMap();
        map3.put(a, "aaa");
        map3.put(b, "bbb");


        weakmap.put(a, "aaa");
        weakmap.put(b, "bbb");

        map3.remove(a);

        a=null;
        b=null;

        System.gc();
        Iterator i = map3.entrySet().iterator();
        while (i.hasNext()) {
            Map.Entry en = (Map.Entry)i.next();
            System.out.println("map:"+en.getKey()+":"+en.getValue());
        }

        Iterator j = weakmap.entrySet().iterator();
        while (j.hasNext()) {
            Map.Entry en = (Map.Entry)j.next();
            System.out.println("weakmap:"+en.getKey()+":"+en.getValue());

        }


        IdentityHashMap<String,String> idmap=new IdentityHashMap<String,String>();
        idmap.put(new String("identity"),"identity");
        assertNull(idmap.put(new String("identity"), "identity"));

        map.put(new String("identity"),"identity");
        assertEquals("identity", map.put(new String("identity"),"identity"));

        // 遍历的时候对元素删除，会抛出异常
        ConcurrentHashMap<String,String> currentMap=new ConcurrentHashMap<String,String>();
        assertNull(currentMap.putIfAbsent("1", "3"));
        assertEquals("3",currentMap.putIfAbsent("1", "2"));
        currentMap.put("12","23");
        currentMap.put("3","23");
        currentMap.put("4","23");

        Iterator currentIt=currentMap.keySet().iterator();

        Iterator currentIt2=currentMap.keySet().iterator();

        Runnable r=new Runnable() {
            @Override
            public void run() {
                int i=0;
                while(currentIt.hasNext()){
                    System.out.println("i: "+ ++i);
                    try {
                        TimeUnit.MILLISECONDS.sleep(10);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    System.out.println(currentIt.next());
                }
            }
        };

        Runnable r2=new Runnable() {
            @Override
            public void run() {
                int j=0;
                while(currentIt2.hasNext()){
                    try {
                        System.out.println("remove j: "+ ++j);
                        TimeUnit.MILLISECONDS.sleep(2);
                        currentIt2.remove();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }

                }
            }
        };

      /*  new Thread(r).start();
        new Thread(r2).start();

        try {
            TimeUnit.MILLISECONDS.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }*/

        ConcurrentSkipListMap<Integer,String> csmap=new ConcurrentSkipListMap<Integer,String>();
        for( int k=0;k<20;k++){
            int v=random.nextInt(100);
            csmap.put(v,""+v);
        }

        Iterator<Integer> csit=csmap.keySet().iterator();
        while(csit.hasNext()){
            System.out.print(csit.next()+" ");
        }

    }




}

 enum C{
    client("12"),
    server("23");

     private String value;



     private   C(String val){
         this.value=val;
     }
     public String getValue() {
         return value;
     }

     public void setValue(String value) {
         this.value = value;
     }


 }
