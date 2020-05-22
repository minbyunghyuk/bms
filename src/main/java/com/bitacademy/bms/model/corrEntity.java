package com.bitacademy.bms.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Table;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name="stock_corr")
public class corrEntity {

    @javax.persistence.Id
    @GeneratedValue
    private Long idx;

    @Column(name="name")
    private String name;

    @Column(name="value")
    private String value;

    @Column(name="cor_value")
    private double cor_value;




}
