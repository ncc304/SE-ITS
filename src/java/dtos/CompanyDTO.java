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
public class CompanyDTO {
    int id;
    String name;
    String address;
    String link;
    boolean status;
    
    public CompanyDTO() {
    }

    public CompanyDTO(int id, String name, String address) {
        this.id = id;
        this.name = name;
        this.address = address;
    }

    public CompanyDTO(int id, String name, String address, String link) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.link = link;
    }

    public CompanyDTO(int id, String name, String address, String link, boolean status) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.link = link;
        this.status = status;
    }
    
    
    
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    
    
    
}
