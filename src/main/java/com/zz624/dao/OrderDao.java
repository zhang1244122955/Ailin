package com.zz624.dao;

import com.zz624.entry.Order;

public interface OrderDao {
    // 插入订单
    int insertOrder(Order order);
}
