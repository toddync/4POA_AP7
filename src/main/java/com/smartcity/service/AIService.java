package com.smartcity.service;

import com.smartcity.model.Analise;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class AIService {

    public Analise realizarAnalise(String setor, String dadosEntrada) {
        // Se houver configuração para um endpoint externo (GEMINI_ENDPOINT) e chave (GEMINI_API_KEY), tenta chamar
        String endpoint = System.getenv("GEMINI_ENDPOINT");
        String apiKey = System.getenv("GEMINI_API_KEY");

        if (endpoint != null && !endpoint.isEmpty() && apiKey != null && !apiKey.isEmpty()) {
            try {
                java.net.URI uri = new java.net.URI(endpoint);
                URL url = uri.toURL();
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Content-Type", "application/json");
                conn.setRequestProperty("Authorization", "Bearer " + apiKey);
                conn.setDoOutput(true);

                // payload simples com prompt
                String payload = "{\"prompt\":\"Resuma e gere insights para o setor: " + setor + ". Dados: " + dadosEntrada + "\"}";

                try (OutputStream os = conn.getOutputStream()) {
                    byte[] input = payload.getBytes("utf-8");
                    os.write(input, 0, input.length);
                }

                int status = conn.getResponseCode();
                BufferedReader in = new BufferedReader(new InputStreamReader(
                        status >= 200 && status < 300 ? conn.getInputStream() : conn.getErrorStream(), "utf-8"
                ));
                StringBuilder resp = new StringBuilder();
                String line;
                while ((line = in.readLine()) != null) {
                    resp.append(line.trim());
                }
                in.close();
                conn.disconnect();

                String resultado = "[External LLM] " + resp.toString();
                return new Analise(java.util.UUID.randomUUID().toString(), setor, dadosEntrada, resultado);
            } catch (Exception e) {
                // se falhar, cairá no comportamento mock abaixo
            }
        }

        // fallback mock
        String resultado = "Análise de IA para o setor " + setor + " com dados: " + dadosEntrada + " - Resultado: Otimizado (mock).";
        return new Analise(java.util.UUID.randomUUID().toString(), setor, dadosEntrada, resultado);
    }
}