package com.xm.base.collection;

import org.junit.Test;

import java.util.BitSet;
import java.util.HashSet;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentSkipListSet;

import static org.junit.Assert.assertTrue;

/**
 * Created by xm on 2017/3/21.
 */
public class SetUtils {

    @Test
    public void set(){
        /*
        *  HashSet  内部使用Hashmap
        *
        * */
        HashSet<String> set=new HashSet<String>();

        TreeSet<String> treeSet=new TreeSet<String>();

        ConcurrentSkipListSet<String> csSet=new ConcurrentSkipListSet<String>();

        BitSet bs=new BitSet();

        bs.set(123);
        bs.set(124);
        assertTrue(bs.get(123));
        System.out.println(bs);

     }
}
