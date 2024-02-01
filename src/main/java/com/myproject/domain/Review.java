package com.myproject.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.Date;

public class Review {
    private Integer rno;
    private Integer pno;
    private Integer uno;
    private String givenName;
    private String familyName;
    private String title;
    private String comment;
    private Integer rating;
    private Integer up;
    private Integer down;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime created;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updated;
//    private Date created;
//    private Date updated;

    public Review() {}

    public Review(Integer pno, Integer uno, String title, String comment, Integer rating) {
        this.pno = pno;
        this.uno = uno;
        this.title = title;
        this.comment = comment;
        this.rating = rating;
    }

    public Review(Integer pno, Integer uno, String givenName, String familyName, String title, String comment, Integer rating) {
        this.pno = pno;
        this.uno = uno;
        this.givenName = givenName;
        this.familyName = familyName;
        this.title = title;
        this.comment = comment;
        this.rating = rating;
    }

    public Review(Integer rno, Integer pno, Integer uno, String givenName, String familyName, String title, String comment, Integer rating, Integer up, Integer down, LocalDateTime created, LocalDateTime updated) {
        this.rno = rno;
        this.pno = pno;
        this.uno = uno;
        this.givenName = givenName;
        this.familyName = familyName;
        this.title = title;
        this.comment = comment;
        this.rating = rating;
        this.up = up;
        this.down = down;
        this.created = created;
        this.updated = updated;
    }

    public Integer getRno() {
        return rno;
    }

    public void setRno(Integer rno) {
        this.rno = rno;
    }

    public Integer getPno() {
        return pno;
    }

    public void setPno(Integer pno) {
        this.pno = pno;
    }

    public Integer getUno() {
        return uno;
    }

    public void setUno(Integer uno) {
        this.uno = uno;
    }

    public String getGivenName() {
        return givenName;
    }

    public void setGivenName(String givenName) {
        this.givenName = givenName;
    }

    public String getFamilyName() {
        return familyName;
    }

    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public Integer getUp() {
        return up;
    }

    public void setUp(Integer up) {
        this.up = up;
    }

    public Integer getDown() {
        return down;
    }

    public void setDown(Integer down) {
        this.down = down;
    }

//    public Date getCreated() {
//        return created;
//    }
//
//    public void setCreated(Date created) {
//        this.created = created;
//    }
//
//    public Date getUpdated() {
//        return updated;
//    }
//
//    public void setUpdated(Date updated) {
//        this.updated = updated;
//    }

    public LocalDateTime getCreated() {
        return created;
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }

    public LocalDateTime getUpdated() {
        return updated;
    }

    public void setUpdated(LocalDateTime updated) {
        this.updated = updated;
    }

    @Override
    public String toString() {
        return "Review{" +
                "rno=" + rno +
                ", pno=" + pno +
                ", uno=" + uno +
                ", givenName='" + givenName + '\'' +
                ", familyName='" + familyName + '\'' +
                ", title='" + title + '\'' +
                ", comment='" + comment + '\'' +
                ", rating=" + rating +
                ", up=" + up +
                ", down=" + down +
                ", created=" + created +
                ", updated=" + updated +
                '}';
    }
}
