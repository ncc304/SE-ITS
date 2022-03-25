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
public class RecruitmentDTO {
    int id;
    String startDate;
    String endDate;
    float salary;
    String description;
    int companyId;
    boolean status;
    String name;
    String owner;
    String createDate;
    public RecruitmentDTO() {
    }

    public RecruitmentDTO(int id, String startDate, String endDate, float salary, String description, int companyId, boolean status, String name, String owner) {
        this.id = id;
        this.startDate = startDate;
        this.endDate = endDate;
        this.salary = salary;
        this.description = description;
        this.companyId = companyId;
        this.status = status;
        this.name = name;
        this.owner = owner;
    }
    
    // admin them createDate
    public RecruitmentDTO(int id, String startDate, String endDate, float salary, String description, int companyId, boolean status, String name, String owner, String createDate) {
        this.id = id;
        this.startDate = startDate;
        this.endDate = endDate;
        this.salary = salary;
        this.description = description;
        this.companyId = companyId;
        this.status = status;
        this.name = name;
        this.owner = owner;
        this.createDate = createDate;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    
    
}
