package com.bitacademy.bms.Service.corr;

import com.bitacademy.bms.model.corrEntity;

import java.util.List;

public interface corrService  {

    List<corrEntity> findAllByName(String name);

    List<corrEntity> findAll();
}
