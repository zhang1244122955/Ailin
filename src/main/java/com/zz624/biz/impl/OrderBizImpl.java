package com.zz624.biz.impl;

import com.zz624.biz.OrderBiz;
import com.zz624.dao.OrderDao;
import com.zz624.entry.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

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

    @Override
    public Double findSumPriceByDates(String startDate, String endDate) {
        Map map = new HashMap();
        map.put("startDate",startDate);
        map.put("endDate",endDate);
        return od.selectSumPriceByDates(map);
    }

    @Override
    public int findSumPersonBySex(String sex, String startDate, String endDate) {
        Map map = new HashMap();
        map.put("sex",sex);
        map.put("startDate",startDate);
        map.put("endDate",endDate);
        return od.selectSumPersonBySex(map);
    }

    @Override
    public int findSumPersonByAge(String startAge, String endAge, String startDate, String endDate) {
        Map map = new HashMap();
        map.put("startAge",startAge);
        map.put("endAge",endAge);
        map.put("startDate",startDate);
        map.put("endDate",endDate);
        return od.selectSumPersonByAge(map);
    }
}
