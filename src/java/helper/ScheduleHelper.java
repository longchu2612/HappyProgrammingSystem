/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import model.Slot;

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
    
    public static String isCheckedValue(String[] checkedValues, int value){
        if(checkedValues != null){
           for(String val : checkedValues){
               if(Integer.parseInt(val) == value){
                   return "checked";
               }
           }
        }
        return "";
    }
    public static String isCheckedSlot(List<Slot> slots, int slot, int dayOfWeek){
        if(slots != null){
            for(Slot s : slots){
                if(s.getSlot() == slot && s.getDayOfWeek() == dayOfWeek){
                    return "checked";
                }
            }
        }
        return "";
    }
    public static String isCheckedSlotByDate(List<Slot> slots, int slot, String date){
        if(slots != null){
            for(Slot s : slots){
                if(s.getSlot()== slot && s.getTeach_date().toString().equals(date)){
                    return "checked";
                }
            }
        }
        return "";
        
    }
    
    public static String isCheckedSlotByDateDisable(List<Slot> slots, int slot, String date){
        if(slots != null){
            for(Slot s : slots){
                if(s.getSlot()== slot && s.getTeach_date().toString().equals(date)){
                    return "";
                }
            }
        }
        return "disabled";
        
    }
    
}
