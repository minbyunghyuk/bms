package com.bitacademy.bms.Repository;

import com.bitacademy.bms.model.ResultEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ResultRepository extends JpaRepository<ResultEntity , Long> {




    @Override
    List<ResultEntity> findAllById(Iterable<Long> iterable);


    List<ResultEntity> findByDateContains(String date);


    Optional<ResultEntity> findById(Long Long);


}
