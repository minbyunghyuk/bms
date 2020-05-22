package com.bitacademy.bms.Repository;


import com.bitacademy.bms.model.CompletionEntity;
import com.bitacademy.bms.model.StockEntity;
import com.bitacademy.bms.model.corrEntity;
import lombok.Data;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.persistence.*;
import java.util.Collection;
import java.util.Date;
import java.util.List;

public interface StockRepositroy extends JpaRepository<StockEntity, Long> {

    List<StockEntity> findAllByDateBetween(Date start, Date end );

    List<StockEntity> findByDate(Date date);

    StockEntity findByIdx(Long no);

    @Query(value = "SELECT com_name, com_code, MAX(DATE) AS tod, tod_price, tod_status, tom_price, tom_status,\n" +
            "ROUND((tom_price - tod_price) / tod_price * 100, 1)\n" +
            "AS next_day_return, (tom_price - tod_price) as next_day_return_value, round(AVG(MATCH_status),2) AS mean_match_status,\n" +
            "round(AVG(price_error)) AS mean_price_error , round(EXP(SUM(LOG(stock_predict.return))),2) AS tod_return\n" +
            "FROM stock_predict WHERE DATE > '2020-03-31'- interval 30 DAY\tGROUP BY com_name  ORDER BY next_day_return DESC", nativeQuery = true)
    List<Object[]>selectTotals();





}

