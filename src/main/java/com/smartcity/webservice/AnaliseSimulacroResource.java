package com.smartcity.webservice;

import com.smartcity.model.Analise;
import com.smartcity.service.AIService;
import com.smartcity.service.NewsService;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.ArrayList;
import java.util.List;

@Path("/analise/simulacro")
public class AnaliseSimulacroResource {

    private AIService aiService = new AIService();
    private NewsService newsService = new NewsService();

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getSimulacao() {
        // setores de exemplo
        String[] setores = new String[]{"Finanças", "Tecnologia", "Energia", "Saúde"};
        List<Analise> lista = new ArrayList<>();

        for (String setor : setores) {
            List<String> noticias = newsService.fetchNewsForSector(setor);
            // concatena notícias para enviar ao AIService
            String dados = String.join(" \n", noticias);
            Analise a = aiService.realizarAnalise(setor, dados);
            lista.add(a);
        }

        return Response.ok(lista).build();
    }
}
