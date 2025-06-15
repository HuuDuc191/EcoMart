package dao;

import model.Product;
import utils.DBContext;
import utils.SortOption;

import java.sql.*;
import java.util.*;

public class ProductDAO {

    public List<Product> searchByCategoryRelation(String keyword, String sortDirection) {
        List<Product> result = new ArrayList<>();
        Set<String> seenProductNames = new HashSet<>();

        String sql = "SELECT * FROM Product WHERE ProductName LIKE ?";

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = mapResultSetToProduct(rs);
                if (seenProductNames.add(p.getName())) {
                    result.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (sortDirection != null && !sortDirection.isEmpty()) {
            SortOption sortOption = new SortOption(sortDirection);
            result.sort(sortOption.getComparator(Product::getPrice));
        }

        return result;
    }

    public Product getById(int id) {
        String sql = "SELECT * FROM Product WHERE ProductID = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapResultSetToProduct(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Product> getAll() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Product";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public boolean insert(Product p) {
        String sql = "INSERT INTO Product (ProductName, Price, Description, Quantity, image, Unit, CreatedAt, CategoryID, SupplierID, Status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, GETDATE(), ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setDouble(2, p.getPrice());
            ps.setString(3, p.getDescription());
            ps.setInt(4, p.getQuantity());
            ps.setString(5, p.getImage());
            ps.setString(6, p.getUnit());
            ps.setInt(7, p.getCategoryId());
            ps.setInt(8, p.getSupplierId());
            ps.setString(9, p.getStatus());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean update(Product p) {
        String sql = "UPDATE Product SET ProductName = ?, Price = ?, Description = ?, Quantity = ?, image = ?, Unit = ?, CategoryID = ?, SupplierID = ?, Status = ? WHERE ProductID = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setDouble(2, p.getPrice());
            ps.setString(3, p.getDescription());
            ps.setInt(4, p.getQuantity());
            ps.setString(5, p.getImage());
            ps.setString(6, p.getUnit());
            ps.setInt(7, p.getCategoryId());
            ps.setInt(8, p.getSupplierId());
            ps.setString(9, p.getStatus());
            ps.setInt(10, p.getId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean delete(int id) {
        String sql = "DELETE FROM Product WHERE ProductID = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private Product mapResultSetToProduct(ResultSet rs) throws SQLException {
        Product p = new Product();
        p.setId(rs.getInt("ProductID"));
        p.setName(rs.getString("ProductName"));
        p.setPrice(rs.getDouble("Price"));
        p.setDescription(rs.getString("Description"));
        p.setQuantity(rs.getInt("Quantity"));
        p.setImage(rs.getString("image"));
        p.setUnit(rs.getString("Unit"));
        p.setStatus(rs.getString("Status"));
        p.setCategoryId(rs.getInt("CategoryID"));
        p.setSupplierId(rs.getInt("SupplierID"));
        return p;
    }
}
