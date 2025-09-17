<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IndústriaSentinel - Dashboard</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <img src="assets/logo-industria-sentinel.svg" alt="IndústriaSentinel Logo" class="header-logo">
            <h1>Dashboard</h1>
            <div class="user-info">
                <span>Bem-vindo, ${sessionScope.usuarioLogado.username}!</span>
                <a href="logout" class="btn-logout">Sair</a>
            </div>
        </header>
        <nav class="navbar">
            <ul>
                <li><a href="dashboard">Dashboard</a></li>
                <li><a href="equipamentos">Equipamentos</a></li>
                <li><a href="alertas">Alertas</a></li>
                <c:if test="${sessionScope.usuarioLogado.isAdmin}">
                    <li><a href="admin">Admin</a></li>
                </c:if>
            </ul>
        </nav>
        <main class="content">
            <h2>Visão Geral</h2>
            <div class="dashboard-cards">
                <div class="card">
                    <h3>Total de Equipamentos</h3>
                    <p>${totalEquipamentos}</p>
                </div>
                <div class="card">
                    <h3>Alertas Ativos</h3>
                    <p>${alertasAtivos}</p>
                </div>
            </div>

            <h2>Alertas Recentes</h2>
            <c:if test="${not empty alertasRecentes}">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Equipamento</th>
                            <th>Descrição</th>
                            <th>Data/Hora</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="alerta" items="${alertasRecentes}">
                            <tr>
                                <td>${alerta.id}</td>
                                <td>${alerta.nomeEquipamento}</td>
                                <td>${alerta.descricao}</td>
                                <td>${alerta.dataHora}</td>
                                <td>${alerta.status}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty alertasRecentes}">
                <p>Nenhum alerta recente para exibir.</p>
            </c:if>
        </main>
    </div>
</body>
</html>