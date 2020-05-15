package com.bitacademy.bms.Repository;


import com.bitacademy.bms.model.StockEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

public interface StockRepositroy extends JpaRepository<StockEntity, Long> {

    List<StockEntity> findByDateBetween(Date start, Date end);

    List<StockEntity> findByDate(Date date);


}
