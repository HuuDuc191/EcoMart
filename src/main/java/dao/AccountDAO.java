/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Account;
import utils.DBContext;
import utils.MD5Util;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO {
    private final DBContext dbContext = new DBContext();

    public int insertAccount(Account account) throws SQLException {
        String sql = "INSERT INTO Account (Username, [Password], Email, Phone, [Role], [Status]) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = dbContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, account.getUsername());
            stmt.setString(2, MD5Util.hash(account.getPassword())); // Mã hóa MD5 cho khách hàng
            stmt.setString(3, account.getEmail());
            stmt.setString(4, account.getPhone());
            stmt.setInt(5, account.getRole());
            stmt.setString(6, account.getStatus());
            stmt.executeUpdate();
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return -1;
    }

    public Account checkLogin(String email, String password) throws SQLException {
        String sql = "SELECT AccountID, Username, [Password], Email, Phone, [Role], [Status] FROM Account WHERE Email = ? AND [Status] = 'Active'";
        try (Connection conn = dbContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email.trim());
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Account account = new Account();
                    account.setAccountId(rs.getInt("AccountID"));
                    account.setUsername(rs.getString("Username"));
                    account.setPassword(rs.getString("Password"));
                    account.setEmail(rs.getString("Email"));
                    account.setPhone(rs.getString("Phone"));
                    account.setRole(rs.getInt("Role"));
                    account.setStatus(rs.getString("Status"));

                    System.out.println("Found account: email=" + email + ", role=" + account.getRole() + ", dbPassword=" + account.getPassword());

                    // Kiểm tra mật khẩu theo Role
                    if (account.getRole() == 1 || account.getRole() == 2) {
                        // Admin hoặc Staff: So sánh plain text
                        if (password.trim().equals(account.getPassword().trim())) {
                            System.out.println((account.getRole() == 1 ? "Admin" : "Staff") + " login successful: email=" + email);
                            return account;
                        } else {
                            System.out.println((account.getRole() == 1 ? "Admin" : "Staff") + " password mismatch: input=" + password + ", db=" + account.getPassword());
                        }
                    } else if (account.getRole() == 0) {
                        // Khách hàng: So sánh MD5
                        String hashedPassword = MD5Util.hash(password);
                        if (hashedPassword.equals(account.getPassword())) {
                            System.out.println("Customer login successful: email=" + email);
                            return account;
                        } else {
                            System.out.println("Customer password mismatch: inputHash=" + hashedPassword + ", db=" + account.getPassword());
                        }
                    }
                    System.out.println("Invalid password for email=" + email + ", role=" + account.getRole());
                } else {
                    System.out.println("No active account found for email=" + email);
                }
            }
        } catch (SQLException e) {
            System.out.println("Database error during login: " + e.getMessage());
            throw e;
        }
        return null;
    }

    public boolean checkEmailExists(String email) throws SQLException {
        String sql = "SELECT 1 FROM Account WHERE Email = ?";
        try (Connection conn = dbContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email.trim());
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        }
    }

    public boolean checkUsernameExists(String username) throws SQLException {
        String sql = "SELECT 1 FROM Account WHERE Username = ?";
        try (Connection conn = dbContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username.trim());
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        }
    }

    public void updateAccountStatus(int accountId, String status) throws SQLException {
        String sql = "UPDATE Account SET [Status] = ? WHERE AccountID = ?";
        try (Connection conn = dbContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setInt(2, accountId);
            stmt.executeUpdate();
            System.out.println("Updated account status to " + status + " for AccountID=" + accountId);
        }
    }
}