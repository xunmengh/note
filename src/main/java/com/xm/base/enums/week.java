package com.xm.base.enums;

/**
 * Created by xm on 2017/3/23.
 */
public enum week {
    Monday("星期一"),
    Tuesday("星期二"),
    Wednesday("星期三"),
    Thursday("星期四"),
    Friday("星期五"),
    Saturday("星期六"),
    Sunday("星期七");

    private String description;
    private week(String description){
        this.description=description;
    }

    public String getDescription(){
        return description;
    }


}
