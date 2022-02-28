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
public class RecruitmentRecruitmentCategoryDTO {
    int id;
    int recruitmentId;
    int recruitmentCategoryId;

    public RecruitmentRecruitmentCategoryDTO() {
    }

    public RecruitmentRecruitmentCategoryDTO(int id, int recruitmentId, int recruitmentCategoryId) {
        this.id = id;
        this.recruitmentId = recruitmentId;
        this.recruitmentCategoryId = recruitmentCategoryId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRecruitmentId() {
        return recruitmentId;
    }

    public void setRecruitmentId(int recruitmentId) {
        this.recruitmentId = recruitmentId;
    }

    public int getRecruitmentCategoryId() {
        return recruitmentCategoryId;
    }

    public void setRecruitmentCategoryId(int recruitmentCategoryId) {
        this.recruitmentCategoryId = recruitmentCategoryId;
    }
    
    
}
