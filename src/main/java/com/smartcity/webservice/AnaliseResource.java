package com.smartcity.webservice;

import com.smartcity.model.Analise;
import com.smartcity.service.AIService;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/analise")
public class AnaliseResource {

    private AIService aiService = new AIService();

    @GET
    @Path("/{setor}/{dados}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAnalise(@PathParam("setor") String setor, @PathParam("dados") String dados) {
        Analise analise = aiService.realizarAnalise(setor, dados);
        return Response.ok(analise).build();
    }
}