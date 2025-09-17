package br.com.helixforge.industriasentinel.dao;

import br.com.helixforge.industriasentinel.model.Equipamento;
import br.com.helixforge.industriasentinel.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EquipamentoDAO {

    public void insert(Equipamento equipamento) throws SQLException {
        String sql = "INSERT INTO equipamentos (nome, tipo, status, localizacao) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, equipamento.getNome());
            stmt.setString(2, equipamento.getTipo());
            stmt.setString(3, equipamento.getStatus());
            stmt.setString(4, equipamento.getLocalizacao());
            stmt.executeUpdate();

            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    equipamento.setId(rs.getInt(1));
                }
            }
        }
    }

    public Equipamento findById(int id) throws SQLException {
        String sql = "SELECT id, nome, tipo, status, localizacao FROM equipamentos WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Equipamento(
                            rs.getInt("id"),
                            rs.getString("nome"),
                            rs.getString("tipo"),
                            rs.getString("status"),
                            rs.getString("localizacao")
                    );
                }
            }
        }
        return null;
    }

    public List<Equipamento> findAll() throws SQLException {
        List<Equipamento> equipamentos = new ArrayList<>();
        String sql = "SELECT id, nome, tipo, status, localizacao FROM equipamentos";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                equipamentos.add(new Equipamento(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getString("tipo"),
                        rs.getString("status"),
                        rs.getString("localizacao")
                ));
            }
        }
        return equipamentos;
    }

    public void update(Equipamento equipamento) throws SQLException {
        String sql = "UPDATE equipamentos SET nome = ?, tipo = ?, status = ?, localizacao = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, equipamento.getNome());
            stmt.setString(2, equipamento.getTipo());
            stmt.setString(3, equipamento.getStatus());
            stmt.setString(4, equipamento.getLocalizacao());
            stmt.setInt(5, equipamento.getId());
            stmt.executeUpdate();
        }
    }

    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM equipamentos WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    public int countAll() throws SQLException {
        String sql = "SELECT COUNT(*) FROM equipamentos";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }
}