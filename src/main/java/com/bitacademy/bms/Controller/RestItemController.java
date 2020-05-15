package com.bitacademy.bms.Controller;


import com.bitacademy.bms.Service.Result.ResultService;
import com.bitacademy.bms.Service.Stock.StockSerivce;
import com.bitacademy.bms.model.ResultEntity;
import com.bitacademy.bms.model.StockEntity;
import lombok.AllArgsConstructor;

import java.text.SimpleDateFormat;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;

import java.util.*;
import java.util.stream.IntStream;

@CrossOrigin("*")
@RequestMapping("/rest")
@RestController
@AllArgsConstructor
public class RestItemController {

    private ResultService Resultservice;
    private StockSerivce stockSerivce;


    @RequestMapping(value = "/getid", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Optional<ResultEntity> getNo() {

        Optional<ResultEntity> resultEntity = Resultservice.findById(1);

        return resultEntity;
    }

    @GetMapping(value = "/getjsonlist", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public JSONArray getjsonlist() throws ParseException {

        String start = "2020-01-01"; // 형식을 지켜야 함
        java.sql.Date startdate = java.sql.Date.valueOf(start);
        String end = "2020-04-24"; // 형식을 지켜야 함
        java.sql.Date enddate = java.sql.Date.valueOf(end);

        List<StockEntity> stockEntityList = stockSerivce.findByDateBetween(startdate, enddate);
        JSONArray jsonArray = new JSONArray();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String name = "아시아종묘";
        for (StockEntity i : stockEntityList) {
            if (name.equals(i.getCom_name())) {
                JSONObject jsonObject = new JSONObject();
                Date date = i.getDate();
                String com_name = i.getCom_name();
                String dateparse = sdf.format(date);
                jsonObject.put("date", dateparse);
                jsonObject.put("value", com_name);
                jsonArray.add(jsonObject);
            }
        }
        return jsonArray;
    }

    @RequestMapping(value = "/getyear", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public List<ResultEntity> getyear() {

        String start = "2011-11-01"; // 형식을 지켜야 함
        java.sql.Date startdate = java.sql.Date.valueOf(start);
        String end = "2011-11-30"; // 형식을 지켜야 함
        java.sql.Date enddate = java.sql.Date.valueOf(end);

        List<ResultEntity> resultEntityList = Resultservice.findByDateBetween(startdate, enddate);


        return resultEntityList;

    }


    @RequestMapping(value = "/getlist", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public List<StockEntity> getlist() {

        String start = "2020-01-01"; // 형식을 지켜야 함
        java.sql.Date startdate = java.sql.Date.valueOf(start);
        String end = "2020-04-24"; // 형식을 지켜야 함
        java.sql.Date enddate = java.sql.Date.valueOf(end);

        List<StockEntity> stockEntityList = stockSerivce.findByDateBetween(startdate, enddate);

        return stockEntityList;

    }


    @GetMapping(value = "/getjson", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public HashMap<String,String> getchangejson() {
        String start = "2020-01-01";
        java.sql.Date startdate = java.sql.Date.valueOf(start);
        String end = "2020-04-24";
        java.sql.Date enddate = java.sql.Date.valueOf(end);
        List<StockEntity> stockEntityList = stockSerivce.findByDateBetween(startdate, enddate);

        HashMap<String, String> stockEntityMap = new HashMap<>();

        for (StockEntity i : stockEntityList) {
            stockEntityMap.put("date",i.getDate().toString());
            stockEntityMap.put("value",i.getPrice_high());
        }







        return stockEntityMap;
    }

}
