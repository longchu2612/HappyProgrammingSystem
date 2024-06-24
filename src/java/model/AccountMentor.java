/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class AccountMentor extends Account{
    
    float ratingStar;
    String check05;
    String check1;
    String check15;
    String check2;
    String check25;
    String check3;
    String check35;
    String check4;
    String check45;
    String check5;
    int noOfRequest;
    
    public AccountMentor() {
    }

    public AccountMentor(float ratingStar, int account_id, String account_name, String email, String fullname, String phoneString, String address, String avatar, String check05, String check1, String check15, String check2, String check25, String check3, String check35, String check4, String check45, String check5, int noOfRequest) {
        super(account_id, account_name, email, fullname, phoneString, address, avatar);
        this.ratingStar = ratingStar;
        this.check05 = check05;
        this.check1 = check1;
        this.check15 = check15;
        this.check2 = check2;
        this.check25 = check25;
        this.check3 = check3;
        this.check35 = check35;
        this.check4 = check4;
        this.check45 = check45;
        this.check5 = check5;
        this.noOfRequest = noOfRequest;
    }

    public float getRatingStar() {
        return ratingStar;
    }

    public void setRatingStar(float ratingStar) {
        this.ratingStar = ratingStar;
    }

    public String getCheck05() {
        return check05;
    }

    public void setCheck05(String check05) {
        this.check05 = check05;
    }

    public String getCheck1() {
        return check1;
    }

    public void setCheck1(String check1) {
        this.check1 = check1;
    }

    public String getCheck15() {
        return check15;
    }

    public void setCheck15(String check15) {
        this.check15 = check15;
    }

    public String getCheck2() {
        return check2;
    }

    public void setCheck2(String check2) {
        this.check2 = check2;
    }

    public String getCheck25() {
        return check25;
    }

    public void setCheck25(String check25) {
        this.check25 = check25;
    }

    public String getCheck3() {
        return check3;
    }

    public void setCheck3(String check3) {
        this.check3 = check3;
    }

    public String getCheck35() {
        return check35;
    }

    public void setCheck35(String check35) {
        this.check35 = check35;
    }

    public String getCheck4() {
        return check4;
    }

    public void setCheck4(String check4) {
        this.check4 = check4;
    }

    public String getCheck45() {
        return check45;
    }

    public void setCheck45(String check45) {
        this.check45 = check45;
    }

    public String getCheck5() {
        return check5;
    }

    public void setCheck5(String check5) {
        this.check5 = check5;
    }

    public int getNoOfRequest() {
        return noOfRequest;
    }

    public void setNoOfRequest(int noOfRequest) {
        this.noOfRequest = noOfRequest;
    }
    
}
