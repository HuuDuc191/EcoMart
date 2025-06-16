package dao;

import model.Review;
import utils.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
    private final Connection conn;

    public ReviewDAO() {
        try {
            conn = new DBContext().getConnection();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public List<Review> getReviewsByProductID(int productId) {
        List<Review> reviews = new ArrayList<>();
        String sql = """
            SELECT r.ReviewID, r.Rating, r.Comment, r.image, r.created_at,
                   c.FullName
            FROM Review r
            JOIN Customer c ON r.CustomerID = c.CustomerID
            WHERE r.ProductID = ?
            ORDER BY r.created_at DESC
        """;
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Review r = new Review();
                r.setReviewID(rs.getInt("ReviewID"));
                r.setRating(rs.getInt("Rating"));
                r.setComment(rs.getString("Comment"));
                r.setImage(rs.getString("image"));
                r.setCreatedAt(rs.getTimestamp("created_at"));
                r.setCustomerName(rs.getString("FullName"));
                reviews.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reviews;
    }
}

