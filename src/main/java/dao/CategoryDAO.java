package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBContext;

public class CategoryDAO {

    public List<Integer> getParentIDsFromKeyword(String keyword) {
        List<Integer> parentIDs = new ArrayList<>();
        String sql = "SELECT DISTINCT c.ParentID " +
                     "FROM Product p JOIN Categories c ON p.CategoryID = c.CategoryID " +
                     "WHERE p.ProductName LIKE ? AND c.ParentID IS NOT NULL";

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                parentIDs.add(rs.getInt("ParentID"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return parentIDs;
    }
} 
