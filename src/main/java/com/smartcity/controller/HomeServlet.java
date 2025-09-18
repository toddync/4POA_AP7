package com.smartcity.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet; // IMPORTANTE: Adicionar esta linha
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// ADICIONADO: A anotação que define a URL para este servlet
@WebServlet("/")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redireciona da raiz "/" para a página principal "/dashboard"
        response.sendRedirect(request.getContextPath() + "/dashboard");
    }
}

