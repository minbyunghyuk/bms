package com.bitacademy.bms.Service.Stock;

import com.bitacademy.bms.Repository.StockRepositroy;
import com.bitacademy.bms.model.CompletionEntity;
import com.bitacademy.bms.model.StockEntity;
import com.bitacademy.bms.model.corrEntity;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@AllArgsConstructor
public class StockServiceImpl implements StockSerivce {

    StockRepositroy stockRepositroy;

    @Override
    public List<StockEntity> findAllByDateBetween(Date start, Date end) {
        return stockRepositroy.findAllByDateBetween(start,end);
    }

    @Override
    public List<StockEntity> findByDate(Date date) {
        return stockRepositroy.findByDate(date);
    }

    @Override
    public StockEntity findByIdx(Long no) {
        return stockRepositroy.findByIdx(no);
    }

    /**
     *  총 합계  조회
     */
    @Override
    public List<CompletionEntity> selectTotals() {
        // log
        log.debug("on select totals");

        List<Object[]> resultList = stockRepositroy.selectTotals();
        List<CompletionEntity> completionEntityList = resultList.stream().map(product -> new CompletionEntity(
               (String) product[0],
                (Integer) product[1],
                (Date) product[2],
                (String) product[3],
                (String) product[4],
                (String) product[5],
                (String) product[6],
                (Double) product[7],
                (Double) product[8],
                (Double) product[9],
                (Double) product[10])).collect(Collectors.toList());
                //(Double) product[11])).collect(Collectors.toList());
        return completionEntityList;
    }




}
