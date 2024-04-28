package com.svalero.tiendaplantas.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Shops {

    private int shop_id;
    private String city;
    private String direction;
    private String opening_time;
}
