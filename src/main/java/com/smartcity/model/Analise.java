package com.smartcity.model;

public class Analise {
    private String id;
    private String setor;
    private String dados;
    private String resultadoAnalise;

    public Analise() {
    }

    public Analise(String id, String setor, String dados, String resultadoAnalise) {
        this.id = id;
        this.setor = setor;
        this.dados = dados;
        this.resultadoAnalise = resultadoAnalise;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSetor() {
        return setor;
    }

    public void setSetor(String setor) {
        this.setor = setor;
    }

    public String getDados() {
        return dados;
    }

    public void setDados(String dados) {
        this.dados = dados;
    }

    public String getResultadoAnalise() {
        return resultadoAnalise;
    }

    public void setResultadoAnalise(String resultadoAnalise) {
        this.resultadoAnalise = resultadoAnalise;
    }

    @Override
    public String toString() {
        return "Analise{" +
               "id='" + id + '\'' +
               ", setor='" + setor + '\'' +
               ", dados='" + dados + '\'' +
               ", resultadoAnalise='" + resultadoAnalise + '\'' +
               '}';
    }
}