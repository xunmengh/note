package com.xm.base.obj;

import org.junit.Test;

import java.nio.ByteBuffer;

/**
 * Created by xm on 2017/3/29.
 */
public class BufferUtils {

    @Test
    public  void buffer(){
        byte[] array=new byte[16];
        ByteBuffer.wrap(array);

        ByteBuffer.allocateDirect(16); //直接内存
        ByteBuffer buffer= ByteBuffer.allocate(16);
        print(buffer);
        buffer.put((byte)1);
        buffer.put((byte)2);
        buffer.put((byte)3);
        print(buffer);
        // 读写切换
        buffer.flip();// limit 设置为 position，position 设置为 0  清楚mark
        print(buffer);



        for(int i=0;i<buffer.limit();i++){
            buffer.get(i);// postion 不移动
//            buffer.get(new byte[3]);
            System.out.print(buffer.get());// postion 移动
        }

        System.out.println();
        print(buffer);

        buffer.rewind();
        print(buffer);
        buffer.clear();


        ByteBuffer b2= buffer.duplicate();// 共同的数据区间，不同的大小
        ByteBuffer slice=buffer.slice();//postion 到limit

        ByteBuffer readOnly=buffer.asReadOnlyBuffer();



    }

    private void print(ByteBuffer buffer){
        System.out.println("position:"+buffer.position()+" limit:"
                +buffer.limit()+" capacity:"+buffer.capacity());
    }
}
