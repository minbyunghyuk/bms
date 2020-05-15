package com.bitacademy.bms.Service.Result;

import com.bitacademy.bms.model.ResultEntity;

import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface ResultService {

    public List<ResultEntity> getList();

    public Optional<ResultEntity> findById(long no);

    List<ResultEntity> findByDateBetween(Date start, Date end);
}
