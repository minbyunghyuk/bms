package com.bitacademy.bms.Service.Result;

import com.bitacademy.bms.Repository.ResultRepository;
import com.bitacademy.bms.model.ResultEntity;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class ReslutServiceImpl implements ResultService {


    ResultRepository resultRepository;

    @Override
    public List<ResultEntity> getList() {
        return resultRepository.findAll();
    }

    @Override
    public Optional<ResultEntity> findById(long no) {
        return resultRepository.findById(no);
    }

    @Override
    public List<ResultEntity> findByDateBetween(Date start, Date end) {
        return resultRepository.findByDateBetween(start,end);
    }


}
