package com.smartcity.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

public class NewsService {

    // Retorna notícias simuladas para um setor. Se NEWSAPI_KEY estiver configurada,
    // tenta buscar da NewsAPI (simples, sem dependências externas). Caso contrário, retorna dados mock.
    public List<String> fetchNewsForSector(String setor) {
        String apiKey = System.getenv("NEWSAPI_KEY");
        if (apiKey != null && !apiKey.isEmpty()) {
            try {
                String query = URLEncoder.encode(setor, "UTF-8");
                String urlStr = "https://newsapi.org/v2/everything?q=" + query + "&pageSize=5&apiKey=" + apiKey;
                java.net.URI uri = new java.net.URI(urlStr);
                URL url = uri.toURL();
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setConnectTimeout(5000);
                conn.setReadTimeout(5000);

                int status = conn.getResponseCode();
                BufferedReader in = new BufferedReader(new InputStreamReader(
                        status >= 200 && status < 300 ? conn.getInputStream() : conn.getErrorStream()
                ));
                String inputLine;
                StringBuilder content = new StringBuilder();
                while ((inputLine = in.readLine()) != null) {
                    content.append(inputLine);
                }
                in.close();
                conn.disconnect();

                // Parseia a resposta JSON da NewsAPI e extrai os headlines (titles) usando Gson
                try {
                    com.google.gson.JsonObject root = com.google.gson.JsonParser.parseString(content.toString()).getAsJsonObject();
                    com.google.gson.JsonArray articles = root.has("articles") ? root.getAsJsonArray("articles") : null;
                    List<String> headlines = new ArrayList<>();
                    if (articles != null) {
                        for (int i = 0; i < articles.size(); i++) {
                            com.google.gson.JsonObject art = articles.get(i).getAsJsonObject();
                            String title = art.has("title") && !art.get("title").isJsonNull() ? art.get("title").getAsString() : null;
                            String description = art.has("description") && !art.get("description").isJsonNull() ? art.get("description").getAsString() : null;
                            String item = (title != null ? title : "(sem título)") + (description != null ? " - " + description : "");
                            headlines.add(item);
                        }
                    }
                    if (!headlines.isEmpty()) return headlines;
                } catch (Exception e) {
                    // se parsing falhar, cairá para o fallback mock logo abaixo
                }
            } catch (Exception e) {
                // fallback para mock
            }
        }

        // Mock simples
        List<String> mock = new ArrayList<>();
        mock.add("[Mock] " + setor + " - Empresa A anuncia investimento relevante.");
        mock.add("[Mock] " + setor + " - Relatório trimestral acima do esperado.");
        mock.add("[Mock] " + setor + " - Nova regulação impacta mercado local.");
        return mock;
    }
}
