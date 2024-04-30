package com.svalero.tiendaplantas.util;

import java.text.NumberFormat;
import java.util.Locale;

public class CurrencyUtil {
    public static String format(float value) {
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(new Locale("es", "es"));
        return numberFormat.format(value);
    }
}