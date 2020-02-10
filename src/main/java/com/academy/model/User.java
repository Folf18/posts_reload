package com.academy.model;

import java.time.OffsetDateTime;
import java.util.Objects;

public class User {
    private int id;
    private String username;
    private String email;
    private String password;
    private boolean isBlocked;
    private Role role;
    private OffsetDateTime createdAt;
    private OffsetDateTime updatedAt;

    public User() {
    }


    public User(String username, String email, boolean isBlocked, Role role) {
        this.username = username;
        this.email = email;
        this.isBlocked = isBlocked;
        this.role = role;
    }

    public User(String username, String email, String password) {
        this.username = username;
        this.email = email;
        this.password = password;
    }

    public User(String username, String email, String password, boolean isBlocked, Role role, OffsetDateTime createdAt, OffsetDateTime updatedAt) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.isBlocked = isBlocked;
        this.role = role;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public User(int id, String username, String email, String password, boolean isBlocked, Role role, OffsetDateTime createdAt, OffsetDateTime updatedAt) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.isBlocked = isBlocked;
        this.role = role;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean getIsBlocked() {
        return isBlocked;
    }

    public void setIsBlocked(boolean blocked) {
        isBlocked = blocked;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public OffsetDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(OffsetDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public OffsetDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(OffsetDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", isBlocked=" + isBlocked +
                ", role=" + role +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id == user.id &&
                isBlocked == user.isBlocked &&
                username.equals(user.username) &&
                email.equals(user.email) &&
                password.equals(user.password) &&
                role.equals(user.role) &&
                createdAt.equals(user.createdAt) &&
                updatedAt.equals(user.updatedAt);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, username, email, password, isBlocked, role, createdAt, updatedAt);
    }
}

