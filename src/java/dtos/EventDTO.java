/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class EventDTO {
    int id;
    String name;
    String startDate;
    String endDate;
    boolean status;
    String description;
    String owner;
    String type;
    String createDate;
    
    public EventDTO() {
        
    }

    public EventDTO(int id, String name, String startDate, String endDate, boolean status, String description, String owner, String type, String createDate) {
        this.id = id;
        this.name = name;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
        this.description = description;
        this.owner = owner;
        this.type = type;
        this.createDate = createDate;
    }

//    public EventDTO(int id, String name, String startDate, String endDate, boolean status, String description, String owner, String type) {
//        this.id = id;
//        this.name = name;
//        this.startDate = startDate;
//        this.endDate = endDate;
//        this.status = status;
//        this.description = description;
//        this.owner = owner;
//        this.type = type;
//    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
    
    
}
