package br.com.helixforge.industriasentinel.dao;

import br.com.helixforge.industriasentinel.model.Telemetria;
import br.com.helixforge.industriasentinel.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TelemetriaDAO {

    public void insert(Telemetria telemetria) throws SQLException {
        String sql = "INSERT INTO telemetrias (equipamento_id, timestamp, temperatura, vibracao, consumo) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, telemetria.getEquipamentoId());
            stmt.setTimestamp(2, telemetria.getTimestamp());
            stmt.setDouble(3, telemetria.getTemperatura());
            stmt.setDouble(4, telemetria.getVibracao());
            stmt.setDouble(5, telemetria.getConsumo());
            stmt.executeUpdate();

            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    telemetria.setId(rs.getInt(1));
                }
            }
        }
    }

    public List<Telemetria> findByEquipamentoId(int equipamentoId) throws SQLException {
        List<Telemetria> telemetrias = new ArrayList<>();
        String sql = "SELECT id, equipamento_id, timestamp, temperatura, vibracao, consumo FROM telemetrias WHERE equipamento_id = ? ORDER BY timestamp DESC";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, equipamentoId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    telemetrias.add(new Telemetria(
                            rs.getInt("id"),
                            rs.getInt("equipamento_id"),
                            rs.getTimestamp("timestamp"),
                            rs.getDouble("temperatura"),
                            rs.getDouble("vibracao"),
                            rs.getDouble("consumo")
                    ));
                }
            }
        }
        return telemetrias;
    }

    public Telemetria findLatestByEquipamentoId(int equipamentoId) throws SQLException {
        String sql = "SELECT id, equipamento_id, timestamp, temperatura, vibracao, consumo FROM telemetrias WHERE equipamento_id = ? ORDER BY timestamp DESC LIMIT 1";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, equipamentoId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Telemetria(
                            rs.getInt("id"),
                            rs.getInt("equipamento_id"),
                            rs.getTimestamp("timestamp"),
                            rs.getDouble("temperatura"),
                            rs.getDouble("vibracao"),
                            rs.getDouble("consumo")
                    );
                }
            }
        }
        return null;
    }
}