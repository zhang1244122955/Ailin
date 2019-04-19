package com.zz624.dao;

import com.zz624.entry.Order;

import java.util.Map;

public interface OrderDao {
    // 插入订单
    int insertOrder(Order order);
    //获取某段日期销售额
    double selectSumPriceByDates(Map map);
}
