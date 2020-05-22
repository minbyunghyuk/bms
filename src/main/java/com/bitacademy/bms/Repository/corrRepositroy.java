package com.bitacademy.bms.Repository;


import com.bitacademy.bms.model.StockEntity;
import com.bitacademy.bms.model.corrEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

public interface corrRepositroy extends JpaRepository<corrEntity, Long> {

    List<corrEntity> findAllByName (String name);

    List<corrEntity> findAll();


}
