package com.bitacademy.bms.Service;

import com.bitacademy.bms.Repository.ResultRepository;
import com.bitacademy.bms.model.ResultEntity;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class ReslutServiceImpl implements ResultService  {

    @Autowired
    ResultRepository resultRepository;

    @Override
    public List<ResultEntity> getList() {
        return resultRepository.findAll();
    }

    @Override
    public Optional<ResultEntity> findById(long no) {
        return resultRepository.findById(no);
    }
}
