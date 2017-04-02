package com.xm.base.obj;

import org.junit.Test;

import java.text.MessageFormat;

import static org.junit.Assert.assertEquals;

/**
 * Created by xm on 2017/3/22.
 *
 * float 6~7 位 有效数字
 * double 15 位有效位数
 */
public class StringUtils {

    @Test
    public void format(){
        String s="yuxi";

        s.split(";");
        s.indexOf(";");
        s.charAt(0);
        s.startsWith("abc");

        // 默认容量为16 字节 ，设置容量大小可以优化
        StringBuilder sb=new StringBuilder();
        StringBuffer buffer=new StringBuffer();// 线程安全的

        // subString 只是改变了原来的offset  count 值，value 数组与原来的一样。
        assertEquals("uxi", s.substring(1/* beging*/));
        assertEquals("dear yuxi", String.format("dear %s", s));

        String a1=new String("a");
        String a2=a1;
        a2=new String("a2");
        assertEquals("a", a1);


        assertEquals("apple是一种fruit",MessageFormat.format("{0}是一种{1}","apple","fruit"));
    }

    @Test
    public void bit(){
        /*
        *  采用补码保存数据 正数
        *  负数 符号位为1 其他位取反 在加1
        *
        *  ^  & ~ 对符号位也进行操作
        *
        *   >> 右移操作  高位填充符号位
        *   << 低位填充 0 符号位会被替换
        *   >>> 在高位插入0
        * */
        int t=0b10111;//23
        int m=0b01101;
        //  11111111111111111111111111111110
        assertEquals("11111111111111111111111111101001" ,Integer.toBinaryString(t^-2));//异或操作 不同的为1，相同为0
        assertEquals("11010" ,Integer.toBinaryString(t^m));//异或操作 不同的为1，相同为0
        assertEquals("101" ,Integer.toBinaryString(t&m));//
        assertEquals("11111" ,Integer.toBinaryString(t|m));//
//        System.out.println(Integer.toBinaryString(~t));
        System.out.println("~2:"+Integer.toBinaryString(~2));
        System.out.println("1232131123:"+Integer.toBinaryString(1232131123));

        System.out.println("1232131123<<4:"+Integer.toBinaryString(1232131123<<4));
        System.out.println("2>>3:"+Integer.toBinaryString(2>>3));

        System.out.println("~(-1232131123):"+Integer.toBinaryString(~(-1232131123)));//各位取反
        System.out.println("-1232131123:"+Integer.toBinaryString(-1232131123));

        System.out.println("-1232131123<<4:"+Integer.toBinaryString(-1232131123<<4));
        System.out.println("-1232131123>>3:"+Integer.toBinaryString(-1232131123>>3));
        System.out.println("-1232131123>>>3:"+Integer.toBinaryString(-1232131123>>>3));
        t=t>> 2; //
        assertEquals("101",Integer.toBinaryString(t));


     }
}
