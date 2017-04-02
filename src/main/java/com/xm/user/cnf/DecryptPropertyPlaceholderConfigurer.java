package com.xm.user.cnf;


import com.xm.user.util.AESTool;
import org.springframework.beans.factory.config.PreferencesPlaceholderConfigurer;

/**
 * Created by xm on 2016/8/5.
 */
public class DecryptPropertyPlaceholderConfigurer extends PreferencesPlaceholderConfigurer {
    /**
     * 重写父类方法，解密指定属性名对应的属性值
     */
    @Override
    protected String convertProperty(String propertyName,String propertyValue) {
        if("druid.password".equals(propertyName)||"c3p0.password".equals(propertyName)){
            String val="";
            try{
                val= AESTool.aesDecrypt(propertyValue, "A2E0Sk4e6y_7");//调用解密方法
            }catch (Exception e){
                e.printStackTrace();
            }
            return val;
        }else{
            return propertyValue;
        }
    }
}
