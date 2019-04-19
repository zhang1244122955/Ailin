package com.zz624.biz;

import com.zz624.entry.Order;

public interface OrderBiz {
    //添加订单信息
    boolean addOrder(Order order);

    //获取某段日期销售额
    Double findSumPriceByDates(String startDate,String endDate);

    //通过性别获取某段日期消费人数
    int findSumPersonBySex(String sex,String startDate,String endDate);

    //通过年龄段获取某段日期消费人数
    int findSumPersonByAge(String startAge,String endAge,String startDate,String endDate);
}
