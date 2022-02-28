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
public class EventEventCategoryDTO {
    int id;
    int eventId;
    int eventCategoryId;

    public EventEventCategoryDTO() {
    }

    public EventEventCategoryDTO(int id, int eventId, int eventCategoryId) {
        this.id = id;
        this.eventId = eventId;
        this.eventCategoryId = eventCategoryId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public int getEventCategoryId() {
        return eventCategoryId;
    }

    public void setEventCategoryId(int eventCategoryId) {
        this.eventCategoryId = eventCategoryId;
    }
    
    
}
