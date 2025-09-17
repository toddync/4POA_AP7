<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IndústriaSentinel - Alertas</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <img src="assets/logo-industria-sentinel.svg" alt="IndústriaSentinel Logo" class="header-logo">
            <h1>Gerenciamento de Alertas</h1>
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
            <h2>Lista de Alertas</h2>
            <c:if test="${not empty requestScope.errorMessage}">
                <p class="error-message">${requestScope.errorMessage}</p>
            </c:if>
            <c:if test="${not empty requestScope.successMessage}">
                <p class="success-message">${requestScope.successMessage}</p>
            </c:if>

            <c:if test="${not empty listaAlertas}">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Equipamento</th>
                            <th>Descrição</th>
                            <th>Data/Hora</th>
                            <th>Nível</th>
                            <th>Status</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="alerta" items="${listaAlertas}">
                            <tr>
                                <td>${alerta.id}</td>
                                <td>${alerta.nomeEquipamento}</td>
                                <td>${alerta.descricao}</td>
                                <td>${alerta.dataHora}</td>
                                <td>${alerta.nivel}</td>
                                <td>${alerta.status}</td>
                                <td>
                                    <c:if test="${alerta.status eq 'Ativo'}">
                                        <form action="alertas" method="POST" style="display:inline;">
                                            <input type="hidden" name="action" value="ack">
                                            <input type="hidden" name="id" value="${alerta.id}">
                                            <button type="submit" class="btn-small">Confirmar (ACK)</button>
                                        </form>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty listaAlertas}">
                <p>Nenhum alerta para exibir.</p>
            </c:if>
        </main>
    </div>
</body>
</html>