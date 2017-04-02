package com.xm.base.enums;

/**
 * Created by xm on 2017/3/23.
 */
public interface Competitor<T> {
    Outcome compete(T rb);
}
