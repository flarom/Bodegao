package com.mycompany.bodegao.classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Operator {

    public int getId_operator() {
        return id_operator;
    }

    public void setId_operator(int id_operator) {
        this.id_operator = id_operator;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
    private int id_operator;
    private String name;
    private String password;
    private boolean isAdmin;

    public Operator[] Read() {
        // TODO: REMOVER PRIMEIRO RETURN, DESCOMENTAR RESTO
        return new Operator[]{};
        
        /* *
        String sql = "SELECT * FROM operators";
        List<Operator> operators = new ArrayList<>();

        try (Connection conn = Database.getConnection(); PreparedStatement pstm = conn.prepareStatement(sql); ResultSet rs = pstm.executeQuery()) {

            while (rs.next()) {
                Operator operator = new Operator();
                operator.setId_operator(rs.getInt("id_operator"));
                operator.setName(rs.getString("name"));
                operator.setPassword(rs.getString("password"));
                operator.setIsAdmin(rs.getBoolean("is_admin"));
                operators.add(operator);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return operators.toArray(new Operator[0]); 
        /**/
    }
}
