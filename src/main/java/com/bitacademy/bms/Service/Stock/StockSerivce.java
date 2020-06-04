package com.bitacademy.bms.Service.Stock;


import com.bitacademy.bms.model.CompletionEntity;
import com.bitacademy.bms.model.StockEntity;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


public interface StockSerivce {

    List<StockEntity> findAllByDateBetween(Date start, Date end);

    CompletionEntity findCompletionEntityByName(String name);

    List<CompletionEntity>getFullList();

    List<CompletionEntity>getHomeList();

    List<CompletionEntity>getSimilarList(String name);

    Collection<HashMap<String, String>> getChartDataList(String name);



}
