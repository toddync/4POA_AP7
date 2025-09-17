package br.com.helixforge.industriasentinel.model;

import java.sql.Timestamp;

public class Telemetria {
    private int id;
    private int equipamentoId;
    private Timestamp timestamp;
    private double temperatura;
    private double vibracao;
    private double consumo;

    public Telemetria() {
    }

    public Telemetria(int id, int equipamentoId, Timestamp timestamp, double temperatura, double vibracao, double consumo) {
        this.id = id;
        this.equipamentoId = equipamentoId;
        this.timestamp = timestamp;
        this.temperatura = temperatura;
        this.vibracao = vibracao;
        this.consumo = consumo;
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

    public double getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(double temperatura) {
        this.temperatura = temperatura;
    }

    public double getVibracao() {
        return vibracao;
    }

    public void setVibracao(double vibracao) {
        this.vibracao = vibracao;
    }

    public double getConsumo() {
        return consumo;
    }

    public void setConsumo(double consumo) {
        this.consumo = consumo;
    }

    @Override
    public String toString() {
        return "Telemetria{" +
               "id=" + id +
               ", equipamentoId=" + equipamentoId +
               ", timestamp=" + timestamp +
               ", temperatura=" + temperatura +
               ", vibracao=" + vibracao +
               ", consumo=" + consumo +
               '}';
    }
}