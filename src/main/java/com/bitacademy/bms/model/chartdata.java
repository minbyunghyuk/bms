package com.bitacademy.bms.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
public class chartdata {
    public Date  date;
    public String tod_price;
    public String tom_price;
}
