package com.bitacademy.bms.model;


import lombok.AllArgsConstructor;
import lombok.Data;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import java.util.Date;

@Data
@AllArgsConstructor
public class CompletionEntity {

    //주식명 com_name	com_code	tod	tod_price	tod_status	tom_price	tom_status	next_day_return	mean_match_status	mean_price_error	tod_return
    private String com_name;
    //테스트
    // 금일종가
    private Integer com_code;
    //익일예측
    private Date tod;
    //등락 적중여부
    private String tod_price;

    private String tod_status;

    private String tom_price;

    private String tom_status;

    private Double next_day_return;

   // private Double next_day_return_value;

    private Double mean_match_status;

    private Double mean_price_error;

    private Double tod_return;


    public CompletionEntity() {

    }
}
