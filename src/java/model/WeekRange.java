/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author asus
 */
public class WeekRange {

    private LocalDate startOfWeek;
    private LocalDate endOfWeek;

    public WeekRange(LocalDate startOfWeek, LocalDate endOfWeek) {
        this.startOfWeek = startOfWeek;
        this.endOfWeek = endOfWeek;
    }

    public LocalDate getStartOfWeek() {
        return startOfWeek;
    }

    public LocalDate getEndOfWeek() {
        return endOfWeek;
    }

    @Override
    public String toString() {
        return "WeekRange{" + "startOfWeek=" + startOfWeek + ", endOfWeek=" + endOfWeek + '}';
    }

    public void setStartOfWeek(LocalDate startOfWeek) {
        this.startOfWeek = startOfWeek;
    }

    public void setEndOfWeek(LocalDate endOfWeek) {
        this.endOfWeek = endOfWeek;
    }

    public static void main(String[] args) {
        LocalDate start_1 = LocalDate.of(2024, 5, 6);
        LocalDate end_1 = LocalDate.of(2024, 5, 12);

        LocalDate start_2 = LocalDate.of(2024, 5, 13);
        LocalDate end_2 = LocalDate.of(2024, 5, 19);

        List<WeekRange> selectedWeeks = new ArrayList<>();
        selectedWeeks.add(new WeekRange(start_1, end_1));
        selectedWeeks.add(new WeekRange(start_2, end_2));

        LocalDate monthStart = LocalDate.of(2024, 5, 1);
        LocalDate monthEnd = monthStart.withDayOfMonth(monthStart.lengthOfMonth());

//        for (LocalDate date = monthStart; !date.isAfter(monthEnd); date = date.plusDays(1)) {
        boolean isInSelectedWeek = false;
        LocalDate date = LocalDate.of(2024, 5, 6);
        for (WeekRange weekRange : selectedWeeks) {
            if (!date.isBefore(weekRange.getStartOfWeek()) && !date.isAfter(weekRange.getEndOfWeek())) {
                isInSelectedWeek = true;
                break;
            }
        }

        if (!isInSelectedWeek) {
            System.out.println("Date out of week range");
        }
//        }
        LocalDate startOfWeek = LocalDate.of(2024,5,13);
        LocalDate endOfWeek = LocalDate.of(2024,5,19);
        boolean found = false;
        for (WeekRange weekRange : selectedWeeks) {
            if (weekRange.getStartOfWeek().equals(startOfWeek) && weekRange.getEndOfWeek().equals(endOfWeek)) {
                found = true;
                break;
            }
        }
        if (!found) {
            selectedWeeks.add(new WeekRange(startOfWeek, endOfWeek));
            
        }
        for(WeekRange weekRange : selectedWeeks){
                System.out.println(weekRange.toString());
            }
        
    }
}
