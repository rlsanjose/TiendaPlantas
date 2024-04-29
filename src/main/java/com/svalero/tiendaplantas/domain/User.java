package com.svalero.tiendaplantas.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int user_id;
    private String name;
    private String last_name;
    private String email;
    private String password;
    private int is_admin;
}
