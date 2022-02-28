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
public class EventCategoryDTO {
    int id;
    String nsme;

    public EventCategoryDTO() {
    }

    public EventCategoryDTO(int id, String nsme ) {
        this.id = id;
        this.nsme = nsme;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNsme() {
        return nsme;
    }

    public void setNsme(String nsme) {
        this.nsme = nsme;
    }
    
}
