/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import dao.DBContext;
import java.sql.SQLException;
import java.sql.Connection;
import dao.DBContext;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.internet.ParseException;
import model.Account;
import model.Role;
import java.sql.*;
import model.Account;
import model.AccountMentor;

/**
 *
 * @author asus
 */
public class AccountDAO extends DBContext {

    public int Register(String accountName, String email, String password, String fullName, String phoneNumber, java.sql.Date dob, boolean sex, String address, int roleId, boolean status) throws SQLException {

        int result = 0;
        String sql = "Insert into dbo.Account (name, email, password, fullname, phonenumber, dob, sex, address, roleID, status) \n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, accountName);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, fullName);
            ps.setString(5, phoneNumber);
            ps.setDate(6, dob);
            ps.setInt(7, (sex) ? 1 : 0);
            ps.setString(8, address);
            ps.setInt(9, roleId);

            ps.setInt(10, (status) ? 1 : 0);
            result = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("An error occurred while inserting the account: " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    public int registerAdmin(String account_name, String fullName, String email, String password, int role_id) {
        int result = 0;
        String sql = "Insert into dbo.Account (name, email, password, fullname,roleID) \n"
                + "VALUES (?, ?, ?, ?, ?);";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, account_name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, fullName);
            ps.setInt(5, role_id);
            result = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("An error occurred while inserting the account: " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    public Account checkAccount(String username, String email) throws SQLException {
        String sql = "select * from dbo.Account where email = ? or name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                int role_id = rs.getInt("roleID");
                int account_id = rs.getInt("id");
                Role role = new Role(role_id);
                String account_name = rs.getString("name");
                String email_2 = rs.getString("email");
                String password = rs.getString("password");
                String fullname = rs.getString("fullname");
                int phone_number = Integer.parseInt(rs.getString("phonenumber"));
                Date dob = rs.getDate("dob");
                
                Account account = new Account(account_id, account_name, email_2, password, fullname, phone_number, dob, role, rs.getBoolean("status"));
                 
                return account;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int verifyAccount(String email) throws SQLException {

        int result = 0;
        String sql = "UPDATE dbo.Account SET status = 1 WHERE email = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            result = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;

    }

    public Account login(String username, String password) {
        String sql = " select * from dbo.Account where name = ? and  password = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role role = new Role(rs.getInt("roleID"));
                Account account = new Account(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("password"), rs.getString("fullname"), rs.getInt("phonenumber"), rs.getDate("dob"), role, rs.getBoolean("status"));
                return account;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getIdByAccountName(String Name) {
        String sql = "select id from account where name = ?";
        try {
            int count = 0;
            ps = conn.prepareStatement(sql);
            ps.setString(1, Name);
            rs = ps.executeQuery();
            while (rs.next()) {
                count++;
                if (count == 1) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public Account getUsersById(String id) {
        Account ac = new Account();
        String sql = "SELECT * FROM Account WHERE id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                String Name = rs.getString(2);
                String Email = rs.getString(3);
                String Fullname = rs.getString(5);
                int Phone = rs.getInt(6);
                Date Dob = rs.getDate(7);
                Boolean Sex = rs.getBoolean(8);
                String Address = rs.getString(9);
                String Avatar = "";
                if (rs.getString(10) == null) {
                    Avatar = "uploads/0.png";
                } else {
                    Avatar = rs.getString(10);
                }
                ac = new Account(Name, Email, Fullname, Phone, Dob, Sex, Address, Avatar);
            }
        } catch (SQLException e) {
            System.out.println("getUsersByAccount:" + e.getMessage());
        }
        return ac;
    }

    public int getRoleById(String id) {
        String sql = "select roleID from account where id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public void updateAccountById(String id, String name, String email, String fullname, String phonenumber, String dob, String sex, String address, String avatar) {
        if (name.equals("")) {
            return;
        }
        String sql = "UPDATE Account SET name = ?, email = ?, fullname = ?, phonenumber = ?, dob = ?, sex = ?, address = ?, avatar = ?, modified_at = CURRENT_TIMESTAMP\n"+
                     "WHERE id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, fullname);
            ps.setString(4, phonenumber);
            ps.setDate(5, java.sql.Date.valueOf(dob));
            ps.setInt(6, Integer.parseInt(sex));
            ps.setString(7, address);
            if (avatar == "") {
                ps.setString(8, null);
            } else {
                ps.setString(8, avatar);
            }
            ps.setInt(9, Integer.parseInt(id));
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getAvatarById(String id) {
        String sql = "SELECT avatar FROM Account WHERE ID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                String avatar = rs.getString(1);
                System.out.println(avatar);
                return avatar;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public void updatePasswordbyusername(String name, String newPassword) {
        String sql = "UPDATE Account SET password = ? WHERE name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, name);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("updatePassword: " + e.getMessage());
        }
    }

    public void updatePassword(String email, String newPassword) {
        String sql = "UPDATE Account SET password = ? WHERE email = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("updatePassword: " + e.getMessage());
        }
    }

    public String getEmailByUser(String user) throws SQLException {
        String sql = "Select email from Account where name = ?";
        String email = "";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, user);
        rs = ps.executeQuery();
        if (rs.next()) {
            email = rs.getString("email");
            return email;
        }
        return null;
    }

    public String getPassByUser(String user) throws SQLException {
        String sql = "Select password from Account where name = ?";
        String password = "";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, user);
        rs = ps.executeQuery();
        if (rs.next()) {
            password = rs.getString("password");
            return password;
        }
        return null;
    }

    public String getFullnameByUser(String user) throws SQLException {
        String sql = "Select fullname from Account where name = ?";
        String fullname = "";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, user);
        rs = ps.executeQuery();
        if (rs.next()) {
            fullname = rs.getString("fullname");
            return fullname;
        }
        return null;
    }

    public Date getDOBByUser(String user) throws SQLException {
        String sql = "SELECT dob FROM Account WHERE name = ?";
        Date dob = null;

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    dob = rs.getDate("dob");
                }
            }
        }

        return dob;
    }

    public String getAddressByUser(String user) throws SQLException {
        String sql = "Select address from Account where name = ?";
        String address = "";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, user);
        rs = ps.executeQuery();
        if (rs.next()) {
            address = rs.getString("address");
            return address;
        }
        return null;
    }

    public String getPhonenumberByUser(String user) throws SQLException {
        String sql = "Select phonenumber from Account where name = ?";
        String phonenumber = "";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, user);
        rs = ps.executeQuery();
        if (rs.next()) {
            phonenumber = rs.getString("phonenumber");
            return phonenumber;
        }
        return null;
    }

    public boolean isEmailExist(String email) throws SQLException {
        String sql = "Select email from Account where email = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, email);
        rs = ps.executeQuery();
        if (rs.next()) {
            return true;
        }
        return false;
    }

    public void updateUsername(String name, String newname) {
        String sql = "UPDATE Account SET name = ? WHERE name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newname);
            ps.setString(2, name);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void updateUserfullname(String name, String newfullname) {
        String sql = "UPDATE Account SET fullname = ? WHERE name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newfullname);
            ps.setString(2, name);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void updateAddress(String name, String newAddress) {
        String sql = "UPDATE Account SET address = ? WHERE name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newAddress);
            ps.setString(2, name);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void updatePhonenumber(String name, String newPhonenumber) {
        String sql = "UPDATE Account SET phonenumber = ? WHERE name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newPhonenumber);
            ps.setString(2, name);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public int getSexByUser(String name) throws SQLException {
        String sql = "Select sex from Account where name = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, name);
        rs = ps.executeQuery();
        boolean sex = false;
        if (rs.next()) {
            sex = rs.getBoolean("sex");
        }
        int sex1 = sex ? 1 : 0;
        return sex1;
    }

    public void updateSex(String name, int sex) {
        String sql = "UPDATE Account SET sex = ? WHERE name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, sex);
            ps.setString(2, name);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateDOB(String name, Date date) {
        String sql = "UPDATE Account SET dob = ? WHERE name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setDate(1, date);
            ps.setString(2, name);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getBalanceByUser(String name) throws SQLException {
        String sql = "Select balance from Account where name = ?";
        int balance = 0;
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, name);
        rs = ps.executeQuery();
        if (rs.next()) {
            balance = rs.getInt("balance");
            return balance;
        }
        return 0;
    }

    public String saveImage(String fileName, int id) {

        String sql = "Update Account SET avatar =? where id = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, fileName);
            ps.setInt(2, id);
            int row = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
  
     public List<Account> getAllUsersByRolleId(String roleid) {
        Account ac = new Account();
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE   roleID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, roleid);
            rs = ps.executeQuery();
            while (rs.next()) {
                int ID = rs.getInt(1);
                String Name = rs.getString(2);
                String Email = rs.getString(3);
                String Fullname = rs.getString(5);
                int Phone = rs.getInt(6);
                Date Dob = rs.getDate(7);
                Boolean Sex = rs.getBoolean(8);
                String Address = rs.getString(9);
                String Avatar = "";
                 if (rs.getString(10) == null) {
                    Avatar = "uploads/0.png";
                } else {
                    Avatar = rs.getString(10);
                }
                ac = new Account(ID, Name, Email, Fullname, Phone, Dob, Sex, Address, Avatar);
                list.add(ac);
            }
        } catch (SQLException e) {
            System.out.println("getUsersByAccount:" + e.getMessage());
        }
        return list;
    }
     
     
     public int getRoleByname(String name) {
        String sql = "select roleID from account where name = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
     
       public static void main(String[] args) {
        AccountDAO ac = new AccountDAO();
        List<Account> list = new ArrayList<>();
        list = ac.getAllUsersByRolleId("2");
        for(Account a : list){
            System.out.println(a);
        }
    }
    public Account getAccountByAccId(String txtId) {
        String query = """
                       select email, fullname, phonenumber, dob, sex,address,avatar 
                       from Account
                       where id = ?"""  ;
        try {
            conn = new DBContext().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, txtId);
            rs = ps.executeQuery();
            while (rs.next()) {
                String email = rs.getString("email");
                String fullname = rs.getString("fullname");
                int phonenumber = rs.getInt("phonenumber");
                Date dob = rs.getDate("dob");
                boolean sex = rs.getBoolean("sex");
                String address = rs.getString("address");
                String avatar = "";
                if (rs.getString("avatar") == null || rs.getString("avatar").isBlank()) {
                    avatar = "uploads/0.png";
                } else {
                    avatar = rs.getString("avatar");
                }
                return new Account(email, fullname, phonenumber, dob, sex, address, avatar);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return null;
    }
    public ArrayList<AccountMentor> getMentorBySkills(String SkillId) {
        ArrayList<AccountMentor> data = new ArrayList<AccountMentor>();
        AccountMentor a = new AccountMentor();
        String sql = """
                     SELECT a.id, a.fullname,  a.email, a.name, a.phonenumber, a.address, a.avatar, cs.rating_star, ISNULL(count(rt.ratingstar), 0) as NoOfRating, ISNULL(count(ra.accountID), 0) as NoOfRequests FROM CV c JOIN CV_Skill cs
                     ON c.id = cs.cv_id join Account a
                     ON c.accountID = a.id join Request_Account ra
                     ON a.id = ra.accountID join RateComment rt
                     ON a.id = rt.mentorID
                     WHERE cs.skill_id = ?
                     GROUP BY a.id, a.fullname, a.email, a.name, a.phonenumber, a.address, a.avatar, cs.rating_star""";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, SkillId);
            rs = ps.executeQuery();
            while (rs.next()) {
                int accountId = rs.getInt(1);
                String fullname = rs.getString(2);
                String email = rs.getString(3);
                String name = rs.getString(4);
                String phone = rs.getString(5);
                String address = rs.getString(6);
                String avatar = rs.getString(7);
                float ratingStar = rs.getFloat(8);
                String check = "checked=\"\"";
                String check05 = "";
                String check1 = "";
                String check15 = "";
                String check2 = "";
                String check25 = "";
                String check3 = "";
                String check35 = "";
                String check4 = "";
                String check45 = "";
                String check5 = "";

                switch (String.valueOf(ratingStar)) {
                    case "0.5":
                        check05 = check;
                        break;
                    case "1.0":
                        check1 = check;
                        break;
                    case "1.5":
                        check15 = check;
                        break;
                    case "2.0":
                        check2 = check;
                        break;
                    case "2.5":
                        check25 = check;
                        break;
                    case "3.0":
                        check3 = check;
                        break;
                    case "3.5":
                        check35 = check;
                        break;
                    case "4.0":
                        check4 = check;
                        break;
                    case "4.5":
                        check45 = check;
                        break;
                    case "5.0":
                        check5 = check;
                }
                int NoOfRatings = rs.getInt(9);
                int NoOfRequests = rs.getInt(10);
                System.out.println(accountId + " " + SkillId + " " + address + " " + avatar + " " + check05 + " " + check1 + " " + check15 + " " + check2 + " " + check25 + " " + check3 + " " + check35 + " " + check4 + " " + check45 + " " + check5);
                a = new AccountMentor(ratingStar, accountId, name, email, fullname, phone, address, avatar, check05, check1, check15, check2, check25, check3, check35, check4, check45, check5, NoOfRatings, NoOfRequests);
                data.add(a);
            }
        } catch (SQLException e) {
            System.out.println("getMentorBySkills:" + e.getMessage());
        }
        return data;
    }

    
}
