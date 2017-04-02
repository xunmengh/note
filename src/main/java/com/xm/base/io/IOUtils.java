package com.xm.base.io;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.channels.FileChannel;

/**
 * Created by xm on 2017/3/24.
 */
public class IOUtils {

    public void t(String path) throws IOException {
        try(BufferedReader in=new BufferedReader(new FileReader(path))){
            in.readLine();
        }

        // 会关闭 in 方法

        FileChannel fc=null;
//        fc.lock();   文件锁
    }
}
