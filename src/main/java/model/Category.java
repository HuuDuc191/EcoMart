package model;

public class Category {

    private int categoryID;
    private String categoryName;
    private int parentID; // null nếu là category cha

    public Category(int categoryID, String categoryName, int parentID) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.parentID = parentID;
    }
    

    public Category() {
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getParentID() {
        return parentID;
    }

    public void setParentID(int parentID) {
        this.parentID = parentID;
    }

}
