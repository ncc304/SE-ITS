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
public class MajorDTO {
    int id;
    String name;
    String overview;
    String skill;
    String experience;
    String job_opportunity;

    public MajorDTO() {
    }

    public MajorDTO(int id, String name, String overview, String skill, String experience, String job_opportunity) {
        this.id = id;
        this.name = name;
        this.overview = overview;
        this.skill = skill;
        this.experience = experience;
        this.job_opportunity = job_opportunity;
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

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getJob_opportunity() {
        return job_opportunity;
    }

    public void setJob_opportunity(String job_opportunity) {
        this.job_opportunity = job_opportunity;
    }
}
