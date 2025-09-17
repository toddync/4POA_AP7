package br.com.helixforge.industriasentinel.dao;

import br.com.helixforge.industriasentinel.model.Alerta;
import br.com.helixforge.industriasentinel.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlertaDAO {

    public void insert(Alerta alerta) throws SQLException {
        String sql = "INSERT INTO alertas (equipamento_id, timestamp, nivel, mensagem, status, usuario_ack_id) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, alerta.getEquipamentoId());
            stmt.setTimestamp(2, alerta.getTimestamp());
            stmt.setString(3, alerta.getNivel());
            stmt.setString(4, alerta.getMensagem());
            stmt.setString(5, alerta.getStatus());
            if (alerta.getUsuarioAckId() != null) {
                stmt.setInt(6, alerta.getUsuarioAckId());
            } else {
                stmt.setNull(6, Types.INTEGER);
            }
            stmt.executeUpdate();

            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    alerta.setId(rs.getInt(1));
                }
            }
        }
    }

    public Alerta findById(int id) throws SQLException {
        String sql = "SELECT id, equipamento_id, timestamp, nivel, mensagem, status, usuario_ack_id FROM alertas WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Alerta(
                            rs.getInt("id"),
                            rs.getInt("equipamento_id"),
                            rs.getTimestamp("timestamp"),
                            rs.getString("nivel"),
                            rs.getString("mensagem"),
                            rs.getString("status"),
                            rs.getObject("usuario_ack_id", Integer.class)
                    );
                }
            }
        }
        return null;
    }

    public List<Alerta> findAll() throws SQLException {
        List<Alerta> alertas = new ArrayList<>();
        String sql = "SELECT id, equipamento_id, timestamp, nivel, mensagem, status, usuario_ack_id FROM alertas";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                alertas.add(new Alerta(
                        rs.getInt("id"),
                        rs.getInt("equipamento_id"),
                        rs.getTimestamp("timestamp"),
                        rs.getString("nivel"),
                        rs.getString("mensagem"),
                        rs.getString("status"),
                        rs.getObject("usuario_ack_id", Integer.class)
                ));
            }
        }
        return alertas;
    }

    public List<Alerta> findByEquipamentoId(int equipamentoId) throws SQLException {
        List<Alerta> alertas = new ArrayList<>();
        String sql = "SELECT id, equipamento_id, timestamp, nivel, mensagem, status, usuario_ack_id FROM alertas WHERE equipamento_id = ? ORDER BY timestamp DESC";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, equipamentoId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    alertas.add(new Alerta(
                            rs.getInt("id"),
                            rs.getInt("equipamento_id"),
                            rs.getTimestamp("timestamp"),
                            rs.getString("nivel"),
                            rs.getString("mensagem"),
                            rs.getString("status"),
                            rs.getObject("usuario_ack_id", Integer.class)
                    ));
                }
            }
        }
        return alertas;
    }

    public List<Alerta> findByStatus(String status) throws SQLException {
        List<Alerta> alertas = new ArrayList<>();
        String sql = "SELECT id, equipamento_id, timestamp, nivel, mensagem, status, usuario_ack_id FROM alertas WHERE status = ? ORDER BY timestamp DESC";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    alertas.add(new Alerta(
                            rs.getInt("id"),
                            rs.getInt("equipamento_id"),
                            rs.getTimestamp("timestamp"),
                            rs.getString("nivel"),
                            rs.getString("mensagem"),
                            rs.getString("status"),
                            rs.getObject("usuario_ack_id", Integer.class)
                    ));
                }
            }
        }
        return alertas;
    }

    public void updateStatusAndUserAck(int id, String status, Integer usuarioAckId) throws SQLException {
        String sql = "UPDATE alertas SET status = ?, usuario_ack_id = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            if (usuarioAckId != null) {
                stmt.setInt(2, usuarioAckId);
            } else {
                stmt.setNull(2, Types.INTEGER);
            }
            stmt.setInt(3, id);
            stmt.executeUpdate();
        }
    }

    public int countRecentAlerts() throws SQLException {
        // Considera alertas dos últimos 7 dias como "recentes"
        String sql = "SELECT COUNT(*) FROM alertas WHERE timestamp >= DATE_SUB(NOW(), INTERVAL 7 DAY)";
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