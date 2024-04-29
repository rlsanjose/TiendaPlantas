package com.svalero.tiendaplantas.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    private int product_id;
    private String name;
    private float unit_price;
    private int stock_number;
    private String description;
    private String image_link;
    private String type;
}
