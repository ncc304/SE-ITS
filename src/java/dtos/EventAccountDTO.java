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
public class EventAccountDTO {
    int id;
    int eventId;
    int accountId;
    boolean status;
    
    public EventAccountDTO() {
    }

//    public EventAccountDTO(int id, int eventId, int accountId) {
//        this.id = id;
//        this.eventId = eventId;
//        this.accountId = accountId;
//    }

    public EventAccountDTO(int id, int eventId, int accountId, boolean status) {
        this.id = id;
        this.eventId = eventId;
        this.accountId = accountId;
        this.status = status;
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

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    
    
    
}
