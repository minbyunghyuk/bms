package com.bitacademy.bms.Service;

import com.bitacademy.bms.model.ResultEntity;

import java.util.List;
import java.util.Optional;

public interface ResultService {

    public List<ResultEntity> getList();

    public Optional<ResultEntity> findById (long no);
}
