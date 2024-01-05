package com.myproject.domain;

import java.time.LocalDateTime;
import java.util.Objects;

public class User {
    private Integer uno;
    private String givenName;
    private String familyName;
    private String id;
    private String pw;
    private String email;
    private String country;
    private Integer day;
    private Integer month;
    private Integer year;
    private LocalDateTime created;
    private LocalDateTime updated;

    public User() {}
    public User(String givenName, String familyName, String id, String pw) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.id = id;
        this.pw = pw;
    }

    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;
        User user = (User) object;
        return Objects.equals(uno, user.uno) && Objects.equals(id, user.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(uno, id);
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Integer getDay() {
        return day;
    }

    public void setDay(Integer day) {
        this.day = day;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

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
        return "User{" +
                "uno=" + uno +
                ", givenName='" + givenName + '\'' +
                ", familyName='" + familyName + '\'' +
                ", id='" + id + '\'' +
                ", pw='" + pw + '\'' +
                ", email='" + email + '\'' +
                ", country='" + country + '\'' +
                ", day=" + day +
                ", month=" + month +
                ", year=" + year +
                ", created=" + created +
                ", updated=" + updated +
                '}';
    }
}
