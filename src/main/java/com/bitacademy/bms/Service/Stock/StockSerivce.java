package com.bitacademy.bms.Service.Stock;


import com.bitacademy.bms.model.CompletionEntity;
import com.bitacademy.bms.model.StockEntity;
import com.bitacademy.bms.model.corrEntity;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.List;


public interface StockSerivce {

    List<StockEntity> findAllByDateBetween(Date start, Date end );

    List<StockEntity> findByDate(Date date);

    StockEntity findByIdx(Long no);

    List<CompletionEntity>selectTotals();


}
