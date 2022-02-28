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
public class EventVideoDTO {
    int id;
    String link;
    int eventsId;

    public EventVideoDTO() {
    }

    public EventVideoDTO(int id, String link, int eventsId) {
        this.id = id;
        this.link = link;
        this.eventsId = eventsId;
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

    public int getEventsId() {
        return eventsId;
    }

    public void setEventsId(int eventsId) {
        this.eventsId = eventsId;
    }
    
    
}
