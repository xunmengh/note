package com.xm.base.natives;

/**
 * Created by xm on 2017/3/24.
 */
public class NativeUtils {
   /* static{
        System.loadLibrary(" ");
    }*/
//    javac 编译原文件
//    javah com.xm.base.natives.NativeUtils  在com同级目录生成 com_xm_base_natives_NativeUtils.h 文件

//  cl -I  "F:\Program Files\Java\jdk1.8.0_91\include" -I "F:\Program Files\Java\jdk1.8.0_91\include\win32" -LD NativeUtils.c -NativeUtils.dll

//

    public static native  void  getEncode();
}
