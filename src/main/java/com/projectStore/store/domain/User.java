package com.projectStore.store.domain;

import org.springframework.stereotype.Component;

import java.util.Objects;

@Component
public class User {
    String id;
    String pwd;
    String email;
    String name;
    String PhoneNum;
    String ssn;

    public  User(){}
    public User(String id, String pwd, String email, String name, String phoneNum, String ssn) {
        this.id = id;
        this.pwd = pwd;
        this.email = email;
        this.name = name;
        this.PhoneNum = phoneNum;
        this.ssn = ssn;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNum() {
        return PhoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        PhoneNum = phoneNum;
    }

    public String getSsn() {
        return ssn;
    }

    public void setSsn(String ssn) {
        this.ssn = ssn;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return ssn == user.ssn && Objects.equals(id, user.id) && Objects.equals(pwd, user.pwd) && Objects.equals(email, user.email) && Objects.equals(name, user.name) && Objects.equals(PhoneNum, user.PhoneNum);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, pwd, email, name, PhoneNum, ssn);
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", pwd='" + pwd + '\'' +
                ", email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", PhoneNum='" + PhoneNum + '\'' +
                ", ssn=" + ssn +
                '}';
    }
}
