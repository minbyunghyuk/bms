package com.bitacademy.bms.model;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;

@Data
@AllArgsConstructor
public class chartdata {

    public Date  date;
    public String tod_price;
    public String tom_price;


}
