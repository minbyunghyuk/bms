package com.bitacademy.bms.Controller;


import com.bitacademy.bms.Service.ResultService;
import com.bitacademy.bms.model.ResultEntity;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@CrossOrigin("*")
@RequestMapping("/re")
@RestController
@AllArgsConstructor
public class RestItemController {

    private ResultService service;


    @RequestMapping(value = "/getid", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Optional<ResultEntity> getNo() {

        Optional<ResultEntity> resultEntity= service.findById(1);

        return resultEntity;
    }


    @RequestMapping(value = "/getyear", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public List <ResultEntity> getyear() {
        List<ResultEntity> resultEntityList = service.findByDateContains("2011-01");

        return  resultEntityList;

    }


}
