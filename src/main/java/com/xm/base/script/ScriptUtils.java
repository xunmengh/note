package com.xm.base.script;

import org.junit.Test;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineFactory;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

/**
 * Created by xm on 2017/3/24.
 */
public class ScriptUtils {

    /*
    * 另外一个是 基于java的Rhino引擎
    * */

    @Test
     public void js() throws ScriptException {
         ScriptEngineManager sm=new ScriptEngineManager();
         for(ScriptEngineFactory f: sm.getEngineFactories()){
             System.out.println(f.getEngineName());
         }

        ScriptEngine sn= sm.getEngineByName("javascript");
        sn.eval("n=12*3");
        System.out.println(sn.get("n"));
    }
}
