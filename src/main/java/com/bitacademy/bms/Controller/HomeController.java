package com.bitacademy.bms.Controller;


import com.bitacademy.bms.Service.Stock.StockSerivce;
import com.bitacademy.bms.Service.corr.corrService;
import com.bitacademy.bms.model.CompletionEntity;
import com.bitacademy.bms.model.SampleVO;
import com.bitacademy.bms.model.StockEntity;
import com.bitacademy.bms.model.corrEntity;
import com.sun.org.apache.xpath.internal.axes.ReverseAxesWalker;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.IntStream;


@Controller
@AllArgsConstructor
public class HomeController {
    private StockSerivce stockSerivce;
    private corrService corrService;

    @GetMapping(value = "/d3")
    public String d3test(Model model) {



        return "d3test";
    }
    @GetMapping(value = "/d32")
    public String d3test2(Model model) {



        return "d3test2";
    }
    @GetMapping(value = "/")
    public String index(Model model) {
        List<CompletionEntity> completionEntityList = stockSerivce.selectTotals();

        model.addAttribute("list", completionEntityList);
        return "index";
    }

    @GetMapping(value = "/view")
    public String view(Model model) {
        //DateTIme 은 임시로
        List<CompletionEntity> completionEntityList = stockSerivce.selectTotals();

        model.addAttribute("list", completionEntityList);

        return "view";
    }

    @GetMapping(value = "/get")
    public String get(@RequestParam(value = "name",required = false, defaultValue = "경농") String name, Model model) {

        //사용자가 showviewgraph를 누르고들어오면 경농으로 일단 고정시켜놈
        System.out.println(name);
        List<CompletionEntity> compare_list = new ArrayList<>();
        List<corrEntity> corrEntityList = corrService.findAllByName(name);
        List<CompletionEntity> completionEntityList = stockSerivce.selectTotals();

        for (CompletionEntity completionEntity : completionEntityList) {
            if (completionEntity.getCom_name().equals(name)) {
                model.addAttribute("model", completionEntity);
            }
        }
        for (corrEntity corr : corrEntityList) {
            if (corr.getName().equals(name)) {
                if (corr.getCor_value() > 0.6 || corr.getCor_value() < -0.6) {
                    for (CompletionEntity completionEntity : completionEntityList) {
                        if (completionEntity.getCom_name().equals(corr.getValue())) {
                            compare_list.add(completionEntity);
                        }
                    }
                }
            }
        }
//
        //익일예측 높은순으로 재정렬
        compare_list.sort((p1,p2)-> (int)(p2.getNext_day_return()-p1.getNext_day_return()));

        model.addAttribute("list", compare_list);

        return "get";
    }

//
//    @GetMapping(value = "/viewgraph")
//    public String ShowViewGraph(Model model) {
//
//        //사용자가 navbar들 누르고 들어왔을떄 표시
//        List<CompletionEntity> compare_list = new ArrayList<>();
//        List<CompletionEntity> completionEntityList = stockSerivce.selectTotals();
//        List<corrEntity> corrEntityList = corrService.findAll();
//
//        //최대값구하는 로직
//        List<Double> Doublelist = new ArrayList<>();
//        for (CompletionEntity completionEntity : completionEntityList) {
//            Doublelist.add(completionEntity.getNext_day_return());
//        }
//        Double max_value = Collections.max(Doublelist);
//        String max_name ="";
//        System.out.println(max_value);
//        for (CompletionEntity completionEntity : completionEntityList) {
//            if (max_value.equals(completionEntity.getNext_day_return())) {
//                max_name = completionEntity.getCom_name();
//                model.addAttribute("model", completionEntity);
//            }
//        }
//
//        for (corrEntity corr : corrEntityList) {
////            //임시로 다른것도표시하게
//            if (corr.getName().equals(max_name)){
//            //if (corr.getName().equals("조비")) {
//                if (corr.getCor_value() > 0.6 || corr.getCor_value() < -0.6) {
//                    for (CompletionEntity completionEntity : completionEntityList) {
//                        if (completionEntity.getCom_name().equals(corr.getValue())) {
//                            compare_list.add(completionEntity);
//                        }
//                    }
//                }
//            }
//        }   for (CompletionEntity entity : compare_list) {
////            System.out.println("before"+entity.getNext_day_return());
////        }
//
////
////        for (CompletionEntity entity : compare_list) {
////                System.out.println("after"+entity.getNext_day_return());
////        }
//        //익일예측 높은순으로 재정렬
//        compare_list.sort((p1,p2)-> (int)(p2.getNext_day_return()-p1.getNext_day_return()));
//        model.addAttribute("list", compare_list);
//
//        return "showviewgraph";
//    }


}
