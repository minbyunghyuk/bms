package com.bitacademy.bms.Repository;

import com.bitacademy.bms.model.ResultEntity;
import org.springframework.data.domain.Example;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ResultRepository extends JpaRepository<ResultEntity , Long> {


    @Override
    List<ResultEntity> findAllById(Iterable<Long> iterable);

    @Override
    Optional<ResultEntity> findById(Long aLong);

    @Override
    <S extends ResultEntity> List<S> findAll(Example<S> example);
}
