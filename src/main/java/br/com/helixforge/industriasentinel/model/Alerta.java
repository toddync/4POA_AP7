package br.com.helixforge.industriasentinel.model;

import java.sql.Timestamp;

public class Alerta {
    private int id;
    private int equipamentoId;
    private Timestamp timestamp;
    private String nivel;
    private String mensagem;
    private String status;
    private Integer usuarioAckId; // Pode ser null

    public Alerta() {
    }

    public Alerta(int id, int equipamentoId, Timestamp timestamp, String nivel, String mensagem, String status, Integer usuarioAckId) {
        this.id = id;
        this.equipamentoId = equipamentoId;
        this.timestamp = timestamp;
        this.nivel = nivel;
        this.mensagem = mensagem;
        this.status = status;
        this.usuarioAckId = usuarioAckId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEquipamentoId() {
        return equipamentoId;
    }

    public void setEquipamentoId(int equipamentoId) {
        this.equipamentoId = equipamentoId;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public String getNivel() {
        return nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getUsuarioAckId() {
        return usuarioAckId;
    }

    public void setUsuarioAckId(Integer usuarioAckId) {
        this.usuarioAckId = usuarioAckId;
    }

    @Override
    public String toString() {
        return "Alerta{" +
               "id=" + id +
               ", equipamentoId=" + equipamentoId +
               ", timestamp=" + timestamp +
               ", nivel='" + nivel + '\'' +
               ", mensagem='" + mensagem + '\'' +
               ", status='" + status + '\'' +
               ", usuarioAckId=" + usuarioAckId +
               '}';
    }
}