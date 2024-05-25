/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author asus
 */
public class Account {

    protected int account_id;
    protected String account_name;
    protected String email;
    protected String password;
    protected String fullname;
    protected int phone;
    protected Date dateOfBirth;
    protected Boolean sex;
    protected String address;
    protected String avatar;
    protected Role role;
    protected int balance;
    protected Boolean status;

    public Account() {
    }
    

    public Account(int account_id, String account_name, String email, String password, String fullname, int phone, Date dateOfBirth, Boolean sex, String address, String avatar, Role role, Boolean status) {
        this.account_id = account_id;
        this.account_name = account_name;
        this.email = email;
        this.password = password;
        this.fullname = fullname;
        this.phone = phone;
        this.dateOfBirth = dateOfBirth;
        this.sex = sex;
        this.address = address;
        this.avatar = avatar;
        this.role = role;
        this.status = status;
    }

    public Account(String account_name, String email, String password, String fullname, int phone, Date dateOfBirth, Role role) {
        this.account_name = account_name;
        this.email = email;
        this.password = password;
        this.fullname = fullname;
        this.phone = phone;
        this.dateOfBirth = dateOfBirth;
        this.role = role;
    }
    
    

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getAvatar() {
        return avatar;
    }

    public Role getRole() {
        return role;
    }

    public Boolean getStatus() {
        return status;
    }

    public int getAccount_id() {
        return account_id;
    }

    public String getAccount_name() {
        return account_name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getFullname() {
        return fullname;
    }

    public int getPhone() {
        return phone;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public Boolean getSex() {
        return sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public void setAccount_name(String account_name) {
        this.account_name = account_name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }
    

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Account{" + "account_id=" + account_id + ", account_name=" + account_name + ", email=" + email + ", password=" + password + ", fullname=" + fullname + ", phone=" + phone + ", dateOfBirth=" + dateOfBirth + ", sex=" + sex + ", address=" + address + ", avatar=" + avatar + ", role=" + role + ", status=" + status + '}';
    }

}
