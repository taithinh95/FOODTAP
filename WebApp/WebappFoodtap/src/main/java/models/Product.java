/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Product {
    private String _id; 
    private String name; 
    private Double price; 
    private List<String> category;
    private Double saleoff;
    private String restaurant; 
    private List<String> rating;
    private Date createdAt;
    private Date updatedAt;
    private int __v;
    private String categories;
    
    public String get_id() {
        return _id;
    }

    public void set_id(String _id) {
        this._id = _id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public List<String> getCategory() {
        return category;
    }

    public void setCategory(List<String> category) {
        this.category = category;
    }

    public Double getSaleoff() {
        return saleoff;
    }

    public void setSaleoff(Double saleoff) {
        this.saleoff = saleoff;
    }

    

    public String getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(String restaurant) {
        this.restaurant = restaurant;
    }


    public List<String> getRating() {
        return rating;
    }

    public void setRating(List<String> rating) {
        this.rating = rating;
    }


    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public int get__v() {
        return __v;
    }

    public void set__v(int __v) {
        this.__v = __v;
    }

    public String getCategories() {
        return categories;
    }

    public void setCategories(String categories) {
        this.categories = categories;
    }
    
    
    
}
