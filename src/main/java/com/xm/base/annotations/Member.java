package com.xm.base.annotations;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by xm on 2017/3/23.
 */
@TableName(name = "member")
public class Member {
    @SQLString(value = 30,name="firstName" ,constrains=@Constraints( allowNull= false))
    private String firstName;

    @SQLString(value = 30,constrains=@Constraints(primaryKey = true))
    private String id;

    private String last;

    private static String getConstrains(Constraints constraints){
        String result="";
        if(constraints.primaryKey()){
            result+="  PRIMARY KEY";
        }
        if(!constraints.allowNull()){
            result+=" NOT NULL";
        }
        return result;
    }

    public static void main(String args[]){
        TableName tableName= Member.class.getAnnotation(TableName.class);
        String tName=tableName.name();

        List<String> columnDefs= new ArrayList<String>();

        for(Field f:Member.class.getDeclaredFields()){
            Annotation[] anno= f.getDeclaredAnnotations();
            if(anno.length<1){
                continue;
            }
            if(anno[0] instanceof SQLString){
                SQLString sql=(SQLString)anno[0];
                String columnName="";
                if(sql.name().length()<1){
                    columnName=f.getName();
                }else{
                    columnName=sql.name();
                }
                columnDefs.add(columnName+ " VARCHAR("+sql.value()+")"+getConstrains(sql.constrains()));
            }
        }
        StringBuilder sb=new StringBuilder();
        sb.append("create table ");
        sb.append(tName);
        sb.append("(");

        for(String f: columnDefs){
            sb.append("\n "+f+" ,");
        }
        String tableCreate=sb.substring(0,sb.length()-1)+" );";
        System.out.println(tableCreate);
    }
}
