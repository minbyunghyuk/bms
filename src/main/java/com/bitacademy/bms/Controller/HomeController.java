package com.bitacademy.bms.Controller;

import com.bitacademy.bms.Service.Result.ResultService;
import com.bitacademy.bms.Service.Stock.StockSerivce;
import com.bitacademy.bms.model.ResultEntity;
import com.bitacademy.bms.model.StockEntity;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@AllArgsConstructor
public class HomeController {
    private StockSerivce stockSerivce;
    private ResultService Resultservice;


    @GetMapping(value = "/index")
    public String index4(Model model) {
        //사용자가 클릭한거 한개
        String todaydate = "2020-04-23";
        java.sql.Date searchdate = java.sql.Date.valueOf(todaydate);
        String name ="아시아종묘";
        List<StockEntity> Setonelist = stockSerivce.findByDate(searchdate);
        for (StockEntity item : Setonelist) {
            if (name.equals(item.getCom_name())){
                model.addAttribute("item",item);
            }
        }
        //유사주식리스트
        List<StockEntity> Similar_list  = new ArrayList<>();
        List<StockEntity> Similar_All_list  = stockSerivce.findByDate(searchdate);
        for (StockEntity Sm_item : Similar_All_list) {
            if (Sm_item.getCom_name().equals("경농")){
                Similar_list.add(Sm_item);
            }
            if (Sm_item.getCom_name().equals("조비")){
                Similar_list.add(Sm_item);
            }
            if (Sm_item.getCom_name().equals("효성오앤비")){
                Similar_list.add(Sm_item);
            }

            model.addAttribute("list", Similar_list);

        }
        return "index";
    }
    @GetMapping(value = "/index1")
    public String index1(Model model) {
        //사용자가 클릭한거 한개
        String todaydate = "2020-04-23";
        java.sql.Date searchdate = java.sql.Date.valueOf(todaydate);
        String name ="아시아종묘";
        List<StockEntity> Setonelist = stockSerivce.findByDate(searchdate);
        for (StockEntity item : Setonelist) {
            if (name.equals(item.getCom_name())){
                model.addAttribute("item",item);
            }
        }

        String todaydate1 = "2020-04-24";
        java.sql.Date searchdate1 = java.sql.Date.valueOf(todaydate1);
        String name1 ="아시아종묘";
        List<StockEntity> Setonelist1 = stockSerivce.findByDate(searchdate1);
        for (StockEntity item : Setonelist1) {
            if (name1.equals(item.getCom_name())){
                model.addAttribute("item1",item);
            }
        }
        //유사주식리스트
        List<StockEntity> Similar_list  = new ArrayList<>();
        List<StockEntity> Similar_All_list  = stockSerivce.findByDate(searchdate);
        for (StockEntity Sm_item : Similar_All_list) {
            if (Sm_item.getCom_name().equals("경농")){
                Similar_list.add(Sm_item);
            }
            if (Sm_item.getCom_name().equals("조비")){
                Similar_list.add(Sm_item);
            }
            if (Sm_item.getCom_name().equals("효성오앤비")){
                Similar_list.add(Sm_item);
            }

            model.addAttribute("list", Similar_list);

        }
        return "index1";
    }

    @GetMapping(value = "/index2")
    public String index2(Model model) {
        //사용자가 클릭한거 한개

        return "index2";
    }

}
