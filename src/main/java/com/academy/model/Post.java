package com.academy.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

public class Post {
    private int id;

    @NotNull(message = "Summary can't ne null")
    @NotEmpty(message = "Summary can't be empty")
    @Size(min = 10,  message = "Summary should have at least 10 characters")
    @Size( max = 100, message = "Summary can't contain more than 100 characters")
    private String summary;

    @NotEmpty(message = "Summary can't be empty")
    @Size(min = 15, message = "Description should have at least 15 characters")
    @Size(max = 500, message = "Description can't have no more than 500 characters")
    private String description;

    @NotNull
    private PostType postType;

    @NotNull
    private User user;

    private PostStatus postStatus;
    private OffsetDateTime createdAt;
    private OffsetDateTime updatedAt;

    public Post() {
    }

    public Post(String summary, String description, PostType postType) {
        this.summary = summary;
        this.description = description;
        this.postType = postType;
    }

    public Post(String summary, String description, PostType postType, User user, PostStatus postStatus, OffsetDateTime createdAt, OffsetDateTime updatedAt) {
        this.summary = summary;
        this.description = description;
        this.postType = postType;
        this.user = user;
        this.postStatus = postStatus;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Post(int id, String summary, String description, PostType postType, User user, PostStatus postStatus, OffsetDateTime createdAt, OffsetDateTime updatedAt) {
        this.id = id;
        this.summary = summary;
        this.description = description;
        this.postType = postType;
        this.user = user;
        this.postStatus = postStatus;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public PostType getPostType() {
        return postType;
    }

    public void setPostType(PostType postType) {
        this.postType = postType;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public PostStatus getPostStatus() {
        return postStatus;
    }

    public void setPostStatus(PostStatus postStatus) {
        this.postStatus = postStatus;
    }

    public String getCreatedAt() {
        return createdAt.toLocalDate().format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
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
        return "Post{" +
                "id=" + id +
                ", summary='" + summary + '\'' +
                ", description='" + description + '\'' +
                ", postType=" + postType +
                ", user=" + user +
                ", postStatus=" + postStatus +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Post post = (Post) o;
        return id == post.id &&
                summary.equals(post.summary) &&
                Objects.equals(description, post.description) &&
                postType.equals(post.postType) &&
                user.equals(post.user) &&
                postStatus.equals(post.postStatus) &&
                createdAt.equals(post.createdAt) &&
                updatedAt.equals(post.updatedAt);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, summary, description, postType, user, postStatus, createdAt, updatedAt);
    }
}
