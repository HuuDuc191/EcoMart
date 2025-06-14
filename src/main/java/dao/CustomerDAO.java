package dao;

import model.Customer;
import utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDAO {
    private final DBContext dbContext;

    public CustomerDAO() {
        this.dbContext = new DBContext();
    }

    public int insertCustomer(Customer customer) throws SQLException {
        String sql = "INSERT INTO Customer (AccountID, FullName, Address) OUTPUT INSERTED.CustomerID VALUES (?, ?, ?)";
        try (Connection conn = dbContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, customer.getAccountId());
            stmt.setString(2, customer.getFullName());
            stmt.setString(3, customer.getAddress());
            //stmt.setDouble(4, customer.getBalance());
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int customerId = rs.getInt(1);
                    System.out.println("Inserted customer with ID=" + customerId);
                    return customerId;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error inserting customer: " + e.getMessage());
            throw e;
        }
        throw new SQLException("Failed to retrieve generated customer ID");
    }
}