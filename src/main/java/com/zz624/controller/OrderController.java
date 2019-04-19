package com.zz624.controller;

import com.google.gson.Gson;
import com.zz624.biz.OrderBiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

//用户控制层
@Controller
public class OrderController {

    @Autowired
    private OrderBiz ob;

    @RequestMapping("/getSevenDays")
    @ResponseBody
    public String getSevenDays(HttpSession session) {
        System.out.println("---getSevenDays");

        Map map = new HashMap();

        String[] days = getBeforeSevenDay();
        String[] vals = new String[7];

        for(int i = 0;i<7;i++){
            vals[i] = ""+ob.findSumPriceByDates(days[i],days[i]);
        }

        map.put("key",days);
        map.put("value",vals);

        Gson gson = new Gson();
        String json = gson.toJson(map);
        System.out.println("json"+json);
        return json;

    }

    public static  String [] getBeforeSevenDay(){
        String [] arr = new String[7];
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = null;
        for (int i=0;i<7;i++){
            c=Calendar.getInstance();
            c.add(Calendar.DAY_OF_MONTH, - i);
            arr[6-i] =sdf.format(c.getTime());

        }
        return arr;
    }
}
