/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author asus
 */
public class ScheduleHelper {
    public static String isChecked(String[] checkedValues, int index){
        if (checkedValues != null) {
            for (String value : checkedValues) {
                String[] parts = value.split("_");
                String date = parts[1];
                int currentYear = LocalDate.now().getYear(); 
                    LocalDate localDate = LocalDate.parse(date + "/" + currentYear, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                    String formattedDate = localDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                    LocalDate teachingDate = LocalDate.parse(formattedDate);
                    int dayIndex = localDate.getDayOfWeek().getValue() - 1;
                if (dayIndex == index) {
                    return "checked";
                }
            }
        }
        return "";
    }
}
