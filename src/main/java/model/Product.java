package model;

import java.sql.Timestamp;

public class Product {

    private int productID;
    private String productName;
    private double price;
    private int quantity;
    private String unit;
    private String description;
    private String image;
    private Timestamp createdAt;
    private Category category;
    private Supplier supplier;
    private double averageRating;
    private String status;

    

    public double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }

    
    public Product(int productID, String productName, double price, int quantity, String unit, String description, String image, Timestamp createdAt) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.unit = unit;
        this.description = description;
        this.image = image;
        this.createdAt = createdAt;
    }

    public Product(int productID, String productName, double price, String description, int quantity,
            String image, String unit, Timestamp createdAt) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.image = image;
        this.unit = unit;
        this.createdAt = createdAt;
//        this.categoryID = categoryID;
//        this.supplierID = supplierID;
//        this.status = status;
    }

    public Product() {
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    // Getters & Setters
    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", productName=" + productName + ", price=" + price + ", quantity=" + quantity + ", unit=" + unit + ", description=" + description + ", image=" + image + ", createdAt=" + createdAt + '}';
    }

}
