<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="sidebar-heading">SmartCity AI</div>
<div class="list-group list-group-flush">
    <a href="<%= request.getContextPath() %>/dashboard" class="list-group-item list-group-item-action"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
    <a href="<%= request.getContextPath() %>/setor" class="list-group-item list-group-item-action"><i class="fas fa-chart-pie"></i> Análise por Setor</a>
    <a href="<%= request.getContextPath() %>/sobre" class="list-group-item list-group-item-action"><i class="fas fa-info-circle"></i> Sobre</a>
    <a href="<%= request.getContextPath() %>/contato" class="list-group-item list-group-item-action"><i class="fas fa-envelope"></i> Contato</a>
</div>
<nav class="bg-gray-800 p-4">
    <div class="container mx-auto flex justify-between items-center">
        <a href="#" class="text-white text-lg font-semibold">SmartCity AI</a>
        <div class="flex space-x-4">
            <a href="<%= request.getContextPath() %>/dashboard" class="text-gray-300 hover:text-white px-3 py-2 rounded-md">Home</a>
            <a href="<%= request.getContextPath() %>/setor" class="text-gray-300 hover:text-white px-3 py-2 rounded-md">Análise por Setor</a>
            <a href="<%= request.getContextPath() %>/sobre" class="text-gray-300 hover:text-white px-3 py-2 rounded-md">Sobre</a>
            <a href="<%= request.getContextPath() %>/contato" class="text-gray-300 hover:text-white px-3 py-2 rounded-md">Contato</a>
        </div>
    </div>
</nav>