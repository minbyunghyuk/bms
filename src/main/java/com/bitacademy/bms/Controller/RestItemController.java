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


    @RequestMapping(value = "/get", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public List<Optional<ResultEntity>> getNo() {

        List<Optional<ResultEntity>> itemEntityList = new ArrayList<>();
        for (int i = 1; i < 10; i++) {
            Optional<ResultEntity> item = service.findById(i);
            itemEntityList.add(item);
        }
        return itemEntityList;
    }



}
