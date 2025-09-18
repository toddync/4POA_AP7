package com.smartcity.webservice;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.Arrays;
import java.util.List;

@Path("/setores")
public class SetoresResource {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getSetores() {
        List<String> setores = Arrays.asList("Saúde", "Educação", "Transporte", "Segurança", "Meio Ambiente");
        return Response.ok(setores).build();
    }
}