package com.zz624.biz.impl;

import com.zz624.biz.OrderBiz;
import com.zz624.dao.OrderDao;
import com.zz624.entry.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderBizImpl implements OrderBiz {

    @Autowired
    private OrderDao od;

    @Override
    public boolean addOrder(Order order) {
        int i = od.insertOrder(order);
        if (i > 0) {
            return true;
        }
        return false;
    }
}
