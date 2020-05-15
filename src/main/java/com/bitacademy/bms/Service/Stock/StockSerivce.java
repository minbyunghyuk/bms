package com.bitacademy.bms.Service.Stock;


import com.bitacademy.bms.model.StockEntity;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


public interface StockSerivce {

    List<StockEntity> findByDateBetween(Date start, Date end);

    List<StockEntity> findByDate(Date date);




}
