package com.xm.base.designmodal;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by xm on 2017/3/29.
 */
public class FlyWeightFactory {
    public static final FlyWeightFactory factory=new FlyWeightFactory();

    Map<String,IFlyWeight> map=new HashMap<>();

    public IFlyWeight getFlyWeight(String id){
        IFlyWeight fw=map.get(id);
        if(fw!=null){
            fw=new FlyWeightA();
            map.put(id,fw);
        }
        return fw;
    }


}
