/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author asus
 */
public class Role {
    private int role_id;
    private String roleName;

    public Role() {
    }

    
    
    public Role(int role_id, String roleName) {
        this.role_id = role_id;
        this.roleName = roleName;
    }

    public Role(int role_id) {
        this.role_id = role_id;
    }
    

    public int getRole_id() {
        return role_id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public String toString() {
        return "Role{" + "role_id=" + role_id + ", roleName=" + roleName + '}';
    }
    
    
}
