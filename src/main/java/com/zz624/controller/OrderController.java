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
import java.util.Date;
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

    @RequestMapping("/getSumPersonBySex")
    @ResponseBody
    public String getSumPersonBySex(HttpSession session) {
        System.out.println("---getSumPersonBySex");

        Map map = new HashMap();

        String[] days = getBeforeSevenDay();
        String[][] vals = new String[3][7];


        for(int i = 0;i<7;i++){
            vals[0][i] = ""+ob.findSumPersonBySex("0",days[i],days[i]);
            vals[1][i] = ""+ob.findSumPersonBySex("1",days[i],days[i]);
            vals[2][i] = ""+(Integer.parseInt(vals[0][i])+Integer.parseInt(vals[1][i]));
        }

        map.put("key",days);
        map.put("value1",vals[0]);
        map.put("value2",vals[1]);
        map.put("value3",vals[2]);

        Gson gson = new Gson();
        String json = gson.toJson(map);
        System.out.println("json"+json);
        return json;

    }

    @RequestMapping("/getSumPersonByAge")
    @ResponseBody
    public String getSumPersonByAge(HttpSession session) {
        System.out.println("---getSumPersonByAge");

        Map map = new HashMap();

        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String today = sdf.format(now);
        String[] vals = new String[7];


        vals[0] = ""+ob.findSumPersonByAge("0","20",today,today);
        vals[1] = ""+ob.findSumPersonByAge("21","30",today,today);
        vals[2] = ""+ob.findSumPersonByAge("31","40",today,today);
        vals[3] = ""+ob.findSumPersonByAge("41","50",today,today);
        vals[4] = ""+ob.findSumPersonByAge("51","60",today,today);
        vals[5] = ""+ob.findSumPersonByAge("61","70",today,today);
        vals[6] = ""+ob.findSumPersonByAge("71","1000",today,today);


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
