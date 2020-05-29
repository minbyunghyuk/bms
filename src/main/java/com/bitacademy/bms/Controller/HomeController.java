package com.bitacademy.bms.Controller;


import com.bitacademy.bms.Service.Stock.StockSerivce;
import com.bitacademy.bms.Service.corr.corrService;
import com.bitacademy.bms.model.CompletionEntity;
import com.bitacademy.bms.model.corrEntity;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestParam;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


@Controller

public class HomeController {

    @Autowired
    private StockSerivce stockSerivce;
    @Autowired
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


        completionEntityList = completionEntityList.subList(0,5);

        //익일예측 높은순으로 정렬
        completionEntityList.sort((p1, p2) -> (int) (p2.getNext_day_return() - p1.getNext_day_return()));
        model.addAttribute("list", completionEntityList);
        return "index";
    }
    @GetMapping(value = "/devpro")
    public String devpro() {

        return "devpro";
    }


    @GetMapping(value = "/view")
    public String view(Model model) {
        //DateTIme 은 임시로
        List<CompletionEntity> completionEntityList = stockSerivce.selectTotals();

        model.addAttribute("list", completionEntityList);

        return "view";
    }

    @GetMapping(value = "/get")
    public String get(@RequestParam(value = "name", required = false) String name, Model model) {


        List<CompletionEntity> SimilarList;

        if (name == null) {

            List<CompletionEntity> completionEntityList = stockSerivce.selectTotals();
            List<corrEntity> corrEntityList = corrService.findAll();

            //최대값구하는 로직
            Double max_value = Get_MaxValue(completionEntityList);

            for (CompletionEntity completionEntity : completionEntityList) {
                if (max_value.equals(completionEntity.getNext_day_return())) {

                    model.addAttribute("model", completionEntity);
                    name = completionEntity.getCom_name();
                }
            }

            SimilarList = GetSimilarList(name, corrEntityList, completionEntityList);

            SimilarList.sort((p1, p2) -> (int) (p2.getNext_day_return() - p1.getNext_day_return()));

            model.addAttribute("list", SimilarList);
        } else {

            List<corrEntity> corrEntityList = corrService.findAllByName(name);
            List<CompletionEntity> completionEntityList = stockSerivce.selectTotals();

            for (CompletionEntity completionEntity : completionEntityList) {
                if (completionEntity.getCom_name().equals(name)) {
                    model.addAttribute("model", completionEntity);
                }
            }


            //익일예측 높은순으로 재정렬
            SimilarList = GetSimilarList(name, corrEntityList, completionEntityList);

            SimilarList.sort((p1, p2) -> (int) (p2.getNext_day_return() - p1.getNext_day_return()));
            model.addAttribute("list", SimilarList);
        }


        return "get";
    }


    public Double Get_MaxValue(List<CompletionEntity> completionList) {
        List<Double> Doublelist = new ArrayList<>();

        for (CompletionEntity completionEntity : completionList) {
            Doublelist.add(completionEntity.getNext_day_return());
        }
        Double max_value = Collections.max(Doublelist);

        return max_value;
    }

    public List<CompletionEntity> GetSimilarList(String name, List<corrEntity> corrEntityList, List<CompletionEntity> completionEntityList) {

        List<CompletionEntity> SimilarList = new ArrayList<>();
        for (corrEntity corr : corrEntityList) {
            if (corr.getName().equals(name)) {
                if (corr.getCor_value() > 0.6 || corr.getCor_value() < -0.6) {
                    for (CompletionEntity completionEntity : completionEntityList) {
                        if (completionEntity.getCom_name().equals(corr.getValue())) {
                            SimilarList.add(completionEntity);
                        }
                    }
                }
            }
        }
        return SimilarList;
    }


}
