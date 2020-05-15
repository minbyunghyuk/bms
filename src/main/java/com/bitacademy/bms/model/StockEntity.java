package com.bitacademy.bms.model;


import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Table;
import java.util.Date;

@Data
@Entity
@Table(name = "stock_day")
public class StockEntity {

    @javax.persistence.Id
    @GeneratedValue
    private Long idx;

    @Column(name = "com_name")
    private String com_name;

    @Column(name = "com_code")
    private int com_code;

    @Column(name = "date")
    private Date date;

    @Column(name = "price_closing")
    private String price_closing;

    @Column(name = "difference")
    private String difference;

    @Column(name = "price_market")
    private String price_market;

    @Column(name = "price_high")
    private String price_high;

    @Column(name = "price_low")
    private String price_low;

    @Column(name = "volume")
    private String volume;

    @Column(name = "status")
    private String status;
}
