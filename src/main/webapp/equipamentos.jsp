<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IndústriaSentinel - Equipamentos</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <img src="assets/logo-industria-sentinel.svg" alt="IndústriaSentinel Logo" class="header-logo">
            <h1>Gerenciamento de Equipamentos</h1>
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
            <h2>Lista de Equipamentos</h2>
            <c:if test="${not empty requestScope.errorMessage}">
                <p class="error-message">${requestScope.errorMessage}</p>
            </c:if>
            <c:if test="${not empty requestScope.successMessage}">
                <p class="success-message">${requestScope.successMessage}</p>
            </c:if>

            <c:if test="${not empty listaEquipamentos}">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Localização</th>
                            <th>Tipo</th>
                            <th>Status</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="equipamento" items="${listaEquipamentos}">
                            <tr>
                                <td>${equipamento.id}</td>
                                <td>${equipamento.nome}</td>
                                <td>${equipamento.localizacao}</td>
                                <td>${equipamento.tipo}</td>
                                <td>${equipamento.status}</td>
                                <td>
                                    <a href="equipamentos?action=edit&id=${equipamento.id}" class="btn-small">Editar</a>
                                    <a href="equipamentos?action=delete&id=${equipamento.id}" class="btn-small btn-danger">Excluir</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty listaEquipamentos}">
                <p>Nenhum equipamento cadastrado.</p>
            </c:if>

            <h2>${equipamentoSelecionado.id != null ? 'Editar Equipamento' : 'Adicionar Novo Equipamento'}</h2>
            <form action="equipamentos" method="POST" class="form-card">
                <input type="hidden" name="action" value="${equipamentoSelecionado.id != null ? 'update' : 'add'}">
                <c:if test="${equipamentoSelecionado.id != null}">
                    <input type="hidden" name="id" value="${equipamentoSelecionado.id}">
                </c:if>
                <div class="form-group">
                    <label for="nome">Nome:</label>
                    <input type="text" id="nome" name="nome" value="${equipamentoSelecionado.nome}" required>
                </div>
                <div class="form-group">
                    <label for="localizacao">Localização:</label>
                    <input type="text" id="localizacao" name="localizacao" value="${equipamentoSelecionado.localizacao}" required>
                </div>
                <div class="form-group">
                    <label for="tipo">Tipo:</label>
                    <input type="text" id="tipo" name="tipo" value="${equipamentoSelecionado.tipo}" required>
                </div>
                <div class="form-group">
                    <label for="status">Status:</label>
                    <select id="status" name="status">
                        <option value="Ativo" ${equipamentoSelecionado.status == 'Ativo' ? 'selected' : ''}>Ativo</option>
                        <option value="Inativo" ${equipamentoSelecionado.status == 'Inativo' ? 'selected' : ''}>Inativo</option>
                        <option value="Manutenção" ${equipamentoSelecionado.status == 'Manutenção' ? 'selected' : ''}>Manutenção</option>
                    </select>
                </div>
                <button type="submit" class="btn-primary">${equipamentoSelecionado.id != null ? 'Salvar Alterações' : 'Adicionar Equipamento'}</button>
                <c:if test="${equipamentoSelecionado.id != null}">
                    <a href="equipamentos" class="btn-secondary">Cancelar</a>
                </c:if>
            </form>
        </main>
    </div>
</body>
</html>