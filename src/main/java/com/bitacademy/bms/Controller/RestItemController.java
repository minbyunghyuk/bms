package com.bitacademy.bms.Controller;


import com.bitacademy.bms.Service.Stock.StockSerivce;
import com.bitacademy.bms.model.CompletionEntity;
import com.bitacademy.bms.model.SampleVO;
import com.bitacademy.bms.model.StockEntity;
import com.bitacademy.bms.model.chartdata;
import lombok.AllArgsConstructor;

import lombok.val;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.*;

import java.awt.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.http.MediaType;
@CrossOrigin("*")
@RequestMapping("/rest")
@RestController
@AllArgsConstructor
public class RestItemController {

    private StockSerivce stockSerivce;

    @RequestMapping(value = "/getjson",  produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
            MediaType.APPLICATION_XML_VALUE })
    @ResponseBody
    public    List<chartdata> getchangejson() {
        String start = "2020-03-01";
        java.sql.Date startdate = java.sql.Date.valueOf(start);
        String end = "2020-03-31";
        java.sql.Date enddate = java.sql.Date.valueOf(end);
        List<StockEntity> stockEntityList = stockSerivce.findAllByDateBetween(startdate, enddate);
        List<chartdata> panelist  = stockEntityList.stream().map(stockEntity -> new chartdata(
                stockEntity.getDate(),
                stockEntity.getTod_price(),
                stockEntity.getTom_price()
        )).collect(Collectors.toList());


//        List<CompletionEntity> completionEntityList = resultList.stream().map(product -> new CompletionEntity(
//                (String) product[0],
//                (Integer) product[1],
//                (Date) product[2],
//                (String) product[3],
//                (String) product[4],
//                (String) product[5],
//                (String) product[6],
//                (Double) product[7],
//                (Double) product[8],
//                (Double) product[9],
//                (Double) product[10],
//                (Double) product[11])).collect(Collectors.toList());
//        return completionEntityList;
//

        return panelist;
    }

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
    @GetMapping(value = "/getlist")
    public List<SampleVO> getList() {
        // range 1~10 이니까 1~9까지
        // mapToobj 새로운 sample객체를 만드는데
        // Collectors.tolist가 이걸리스트로 정렬

        return IntStream.range(1, 10).mapToObj(i -> new SampleVO(i, i + "쓰레기", i + "라스트")).collect(Collectors.toList());
    }

}
