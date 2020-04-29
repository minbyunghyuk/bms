package com.bitacademy.bms.Controller;

import com.bitacademy.bms.Repository.ResultRepository;
import com.bitacademy.bms.Service.ResultService;
import com.bitacademy.bms.model.ResultEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Controller
public class HomeController {

    ResultService resultService;

    @GetMapping(value="/list")
    public String index() {

        return "index";
    }
}
