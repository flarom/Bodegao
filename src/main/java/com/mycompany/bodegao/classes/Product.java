package com.mycompany.bodegao.classes;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Product {

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public int getId_category() {
        return id_category;
    }

    public void setId_category(int id_category) {
        this.id_category = id_category;
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
    private int id_product;
    private String name;
    private String size;
    private Date expirationDate;
    private int id_category;
    private double price;
    private int quantity;

    public Product[] Read() {
        String sql = "SELECT * FROM products";
        List<Product> products = new ArrayList<>();

        try (Connection conn = Database.getConnection(); PreparedStatement pstm = conn.prepareStatement(sql); ResultSet rs = pstm.executeQuery()) {

            while (rs.next()) {
                Product product = new Product();
                product.setId_product(rs.getInt("id_product"));
                product.setName(rs.getString("name"));
                product.setSize(rs.getString("size"));
                product.setExpirationDate(rs.getDate("expiration_date"));
                product.setId_category(rs.getInt("id_category"));
                product.setPrice(rs.getDouble("price"));
                product.setQuantity(rs.getInt("quantity"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products.toArray(new Product[0]);
    }

    public Product ReadViaID(int id_product) {
        String sql = "SELECT * FROM products WHERE id_product = ?";
        Product product = null;

        try (Connection conn = Database.getConnection(); PreparedStatement pstm = conn.prepareStatement(sql)) {

            pstm.setInt(1, id_product);
            try (ResultSet rs = pstm.executeQuery()) {
                if (rs.next()) {
                    product = new Product();
                    product.setId_product(rs.getInt("id_product"));
                    product.setName(rs.getString("name"));
                    product.setSize(rs.getString("size"));
                    product.setExpirationDate(rs.getDate("expiration_date"));
                    product.setId_category(rs.getInt("id_category"));
                    product.setPrice(rs.getDouble("price"));
                    product.setQuantity(rs.getInt("quantity"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return product;
    }

    public void Create() {
        String sql = "INSERT INTO products (name, size, expiration_date, id_category, price, quantity) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = Database.getConnection(); PreparedStatement pstm = conn.prepareStatement(sql)) {

            pstm.setString(1, this.name);
            pstm.setString(2, this.size);
            pstm.setDate(3, this.expirationDate);
            pstm.setInt(4, this.id_category);
            pstm.setDouble(5, this.price);
            pstm.setInt(6, this.quantity);
            pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void Update() {
        String sql = "UPDATE products SET name = ?, size = ?, expiration_date = ?, id_category = ?, price = ?, quantity = ? WHERE id_product = ?";

        try (Connection conn = Database.getConnection(); PreparedStatement pstm = conn.prepareStatement(sql)) {

            pstm.setString(1, this.name);
            pstm.setString(2, this.size);
            pstm.setDate(3, this.expirationDate);
            pstm.setInt(4, this.id_category);
            pstm.setDouble(5, this.price);
            pstm.setInt(6, this.quantity);
            pstm.setInt(7, this.id_product);
            pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void Delete() {
        String sql = "DELETE FROM products WHERE id_product = ?";

        try (Connection conn = Database.getConnection(); PreparedStatement pstm = conn.prepareStatement(sql)) {

            pstm.setInt(1, this.id_product);
            pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
