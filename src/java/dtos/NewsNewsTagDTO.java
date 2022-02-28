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
public class NewsNewsTagDTO {
    int id;
    int newTagId;
    int newId;

    public NewsNewsTagDTO() {
    }

    public NewsNewsTagDTO(int id, int newTagId, int newId) {
        this.id = id;
        this.newTagId = newTagId;
        this.newId = newId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNewTagId() {
        return newTagId;
    }

    public void setNewTagId(int newTagId) {
        this.newTagId = newTagId;
    }

    public int getNewId() {
        return newId;
    }

    public void setNewId(int newId) {
        this.newId = newId;
    }

    
    
    
}
