package com.bitacademy.bms.Service.corr;

import com.bitacademy.bms.Repository.corrRepositroy;
import com.bitacademy.bms.model.corrEntity;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@AllArgsConstructor
public class corrServiceImpl implements corrService {
    corrRepositroy corrRepositroy;
    @Override
    public List<corrEntity> findAllByName(String name) {
        return corrRepositroy.findAllByName(name);
    }

    @Override
    public List<corrEntity> findAll() {
        return corrRepositroy.findAll();
    }
}
