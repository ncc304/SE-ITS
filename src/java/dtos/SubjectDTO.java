/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 *
 * @author Admin
 */
public class SubjectDTO {
    int id;
    String link;
    String name;
    int majorId;
    boolean status;
    
    public SubjectDTO() {
    }

    public SubjectDTO(int id, String link, String name, int majorId) {
        this.id = id;
        this.link = link;
        this.name = name;
        this.majorId = majorId;
    }

    public SubjectDTO(int id, String link, String name, int majorId, boolean status) {
        this.id = id;
        this.link = link;
        this.name = name;
        this.majorId = majorId;
        this.status = status;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getMajorId() {
        return majorId;
    }

    public void setMajorId(int majorId) {
        this.majorId = majorId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
}
