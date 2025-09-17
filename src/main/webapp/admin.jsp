<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IndústriaSentinel - Administração</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <img src="assets/logo-industria-sentinel.svg" alt="IndústriaSentinel Logo" class="header-logo">
            <h1>Administração de Usuários</h1>
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
            <h2>Lista de Usuários</h2>
            <c:if test="${not empty requestScope.errorMessage}">
                <p class="error-message">${requestScope.errorMessage}</p>
            </c:if>
            <c:if test="${not empty requestScope.successMessage}">
                <p class="success-message">${requestScope.successMessage}</p>
            </c:if>

            <c:if test="${not empty listaUsuarios}">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Usuário</th>
                            <th>Email</th>
                            <th>Admin</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="usuario" items="${listaUsuarios}">
                            <tr>
                                <td>${usuario.id}</td>
                                <td>${usuario.username}</td>
                                <td>${usuario.email}</td>
                                <td>${usuario.isAdmin ? 'Sim' : 'Não'}</td>
                                <td>
                                    <a href="admin?action=edit&id=${usuario.id}" class="btn-small">Editar</a>
                                    <a href="admin?action=delete&id=${usuario.id}" class="btn-small btn-danger">Excluir</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty listaUsuarios}">
                <p>Nenhum usuário cadastrado.</p>
            </c:if>

            <h2>${usuarioSelecionado.id != null ? 'Editar Usuário' : 'Adicionar Novo Usuário'}</h2>
            <form action="admin" method="POST" class="form-card">
                <input type="hidden" name="action" value="${usuarioSelecionado.id != null ? 'update' : 'add'}">
                <c:if test="${usuarioSelecionado.id != null}">
                    <input type="hidden" name="id" value="${usuarioSelecionado.id}">
                </c:if>
                <div class="form-group">
                    <label for="username">Usuário:</label>
                    <input type="text" id="username" name="username" value="${usuarioSelecionado.username}" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${usuarioSelecionado.email}" required>
                </div>
                <div class="form-group">
                    <label for="password">Senha (deixe em branco para não alterar):</label>
                    <input type="password" id="password" name="password">
                </div>
                <div class="form-group">
                    <label for="isAdmin">Administrador:</label>
                    <input type="checkbox" id="isAdmin" name="isAdmin" ${usuarioSelecionado.isAdmin ? 'checked' : ''}>
                </div>
                <button type="submit" class="btn-primary">${usuarioSelecionado.id != null ? 'Salvar Alterações' : 'Adicionar Usuário'}</button>
                <c:if test="${usuarioSelecionado.id != null}">
                    <a href="admin" class="btn-secondary">Cancelar</a>
                </c:if>
            </form>
        </main>
    </div>
</body>
</html>