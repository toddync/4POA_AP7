package br.com.helixforge.industriasentinel.model;

public class Equipamento {
    private int id;
    private String nome;
    private String tipo;
    private String status;
    private String localizacao;

    public Equipamento() {
    }

    public Equipamento(int id, String nome, String tipo, String status, String localizacao) {
        this.id = id;
        this.nome = nome;
        this.tipo = tipo;
        this.status = status;
        this.localizacao = localizacao;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    @Override
    public String toString() {
        return "Equipamento{" +
               "id=" + id +
               ", nome='" + nome + '\'' +
               ", tipo='" + tipo + '\'' +
               ", status='" + status + '\'' +
               ", localizacao='" + localizacao + '\'' +
               '}';
    }
}