package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import dto.Product;

public class CartRepository {
    private static CartRepository instance;

    private CartRepository() {}

    public static CartRepository getInstance() {
        if (instance == null) {
            instance = new CartRepository();
        }
        return instance;
    }

    public void insertOrderItems(ArrayList<Product> cartList) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ChapssalMarketDB?useSSL=false&serverTimezone=UTC", "root", "1234");

            String sql = "INSERT INTO orders (productId, productName, unitPrice, quantity, total) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            for (Product product : cartList) {
                pstmt.setString(1, product.getProductId());
                pstmt.setString(2, product.getName());
                pstmt.setInt(3, product.getUnitPrice());
                pstmt.setInt(4, product.getQuantity());
                pstmt.setInt(5, product.getUnitPrice() * product.getQuantity());
                pstmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
