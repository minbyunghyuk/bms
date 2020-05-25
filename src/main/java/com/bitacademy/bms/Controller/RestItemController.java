package com.bitacademy.bms.Controller;


import com.bitacademy.bms.Service.Stock.StockSerivce;
import com.bitacademy.bms.model.StockEntity;
import com.bitacademy.bms.model.chartdata;
import lombok.AllArgsConstructor;

import lombok.val;
import org.json.simple.JSONArray;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.MediaType;
@CrossOrigin("*")
@RequestMapping("/rest")
@RestController
@AllArgsConstructor
public class RestItemController {

    private StockSerivce stockSerivce;

    @RequestMapping(value = "/getjsonlist",  produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Collection<HashMap<String, String>> getjsonlist(@RequestParam(value = "name",required = false, defaultValue = "아시아종묘") String name) throws ParseException {

        String start = "2020-01-01";
        java.sql.Date startdate = java.sql.Date.valueOf(start);
        String end = "2020-03-31";
        java.sql.Date enddate = java.sql.Date.valueOf(end);
        val dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        JSONArray jsonArray = new JSONArray();
        List<StockEntity> resultEntityList = stockSerivce.findAllByDateBetween(startdate, enddate);
        Collection<HashMap<String, String>> hashMap = new ArrayList<>();
        System.out.println(name);

        for (StockEntity i:resultEntityList) {
            if (i.getCom_name().equals(name)) {
                HashMap<String, String> map = new HashMap<>();
                String date = dateFormat.format(i.getDate());
                //Date date =i.getDate();
                String getTod_price = i.getTod_price();
                String getTom_price = i.getTom_price();
                map.put("date", date);
                map.put("getTod_price", getTod_price);
                map.put("getTom_price", getTom_price);
                hashMap.add(map);
            }
        }

        return hashMap;
    }

}
