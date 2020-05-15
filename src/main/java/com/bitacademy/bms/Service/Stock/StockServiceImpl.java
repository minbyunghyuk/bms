package com.bitacademy.bms.Service.Stock;

import com.bitacademy.bms.Repository.StockRepositroy;
import com.bitacademy.bms.model.StockEntity;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Service
@AllArgsConstructor
public class StockServiceImpl implements StockSerivce {


    StockRepositroy stockRepositroy;
    @Override
    public List<StockEntity> findByDateBetween(Date start, Date end) {
        return stockRepositroy.findByDateBetween(start, end);
    }

    @Override
    public List<StockEntity> findByDate(Date date) {
        return stockRepositroy.findByDate(date);
    }



}
