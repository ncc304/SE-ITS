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
public class EventsRegistantDTO {
    int id;
    int eventId;
    int registantId;

    public EventsRegistantDTO() {
    }

    public EventsRegistantDTO(int id, int eventId, int registantId) {
        this.id = id;
        this.eventId = eventId;
        this.registantId = registantId;
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

    public int getRegistantId() {
        return registantId;
    }

    public void setRegistantId(int registantId) {
        this.registantId = registantId;
    }

    
    
    
}
