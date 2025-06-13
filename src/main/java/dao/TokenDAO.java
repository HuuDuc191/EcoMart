/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Token;
import utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class TokenDAO {
    private final DBContext dbContext = new DBContext();

    public void insertToken(Token token) throws SQLException {
        String sql = "INSERT INTO Token_Table (CustomerID, Token, Status, Time_Add, Time_Exp) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = dbContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, token.getCustomerId());
            stmt.setString(2, token.getToken());
            stmt.setString(3, token.getStatus());
            stmt.setTimestamp(4, token.getTimeAdd());
            stmt.setTimestamp(5, token.getTimeExp());
            stmt.executeUpdate();
            System.out.println("Inserted token for CustomerID=" + token.getCustomerId() + ", Token=" + token.getToken());
        } catch (SQLException e) {
            System.out.println("Error inserting token: " + e.getMessage());
            throw e;
        }
    }

    public Token getValidToken(int customerId, String tokenValue) throws SQLException {
        String sql = "SELECT TokenID, CustomerID, Token, Status, Time_Add, Time_Exp FROM Token_Table WHERE CustomerID = ? AND Token = ? AND Status = 'unused' AND Time_Exp > GETDATE()";
        try (Connection conn = dbContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            String trimmedToken = tokenValue.trim();
            stmt.setInt(1, customerId);
            stmt.setString(2, trimmedToken);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Token token = new Token();
                    token.setTokenId(rs.getInt("TokenID"));
                    token.setCustomerId(rs.getInt("CustomerID"));
                    token.setToken(rs.getString("Token"));
                    token.setStatus(rs.getString("Status"));
                    token.setTimeAdd(rs.getTimestamp("Time_Add"));
                    token.setTimeExp(rs.getTimestamp("Time_Exp"));
                    System.out.println("Found valid token: TokenID=" + token.getTokenId() + ", Token=" + token.getToken() + ", Time_Exp=" + token.getTimeExp());
                    return token;
                } else {
                    System.out.println("No valid token found for CustomerID=" + customerId + ", Input Token=" + trimmedToken);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving token: " + e.getMessage());
            throw e;
        }
        return null;
    }

    public void updateTokenStatus(int tokenId, String status) throws SQLException {
        String sql = "UPDATE Token_Table SET Status = ? WHERE TokenID = ?";
        try (Connection conn = dbContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setInt(2, tokenId);
            stmt.executeUpdate();
            System.out.println("Updated token status to " + status + " for TokenID=" + tokenId);
        } catch (SQLException e) {
            System.out.println("Error updating token status: " + e.getMessage());
            throw e;
        }
    }
}