/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

<<<<<<< HEAD
import java.util.List;

=======
>>>>>>> dev
/**
 *
 * @author catmi
 */
public class Skill {
    private int skillId;
    private String skillName;
    private int status;
    private String image;
<<<<<<< HEAD
    private List<Request> requests;
=======
    String id;
    String name;
>>>>>>> dev

    public Skill() {
    }

<<<<<<< HEAD
=======
    public Skill(String id, String name) {
        this.id = id;
        this.name = name;
    }

>>>>>>> dev
    public Skill(int skillId, String skillName, int status, String image) {
        this.skillId = skillId;
        this.skillName = skillName;
        this.status = status;
        this.image = image;
    }

<<<<<<< HEAD
    public Skill(int skillId, String skillName, int status, String image, List<Request> requests) {
        this.skillId = skillId;
        this.skillName = skillName;
        this.status = status;
        this.image = image;
        this.requests = requests;
    }

    public List<Request> getRequests() {
        return requests;
    }

    public void setRequests(List<Request> requests) {
        this.requests = requests;
    }
    
=======
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

>>>>>>> dev
    public int getSkillId() {
        return skillId;
    }

    public void setSkillId(int skillId) {
        this.skillId = skillId;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
<<<<<<< HEAD
        return "Skill{" + "skillId=" + skillId + ", skillName=" + skillName + ", status=" + status + ", image=" + image + ", requests=" + requests + '}';
=======
        return "Skill{" + "skillId=" + skillId + ", skillName=" + skillName + ", status=" + status + ", image=" + image + '}';
>>>>>>> dev
    }

    

    
<<<<<<< HEAD
    

    
}
=======
}
>>>>>>> dev
