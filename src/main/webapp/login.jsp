<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IndústriaSentinel - Login</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="login-container">
        <img src="assets/logo-industria-sentinel.svg" alt="IndústriaSentinel Logo" class="login-logo">
        <h2>Login</h2>
        <c:if test="${not empty requestScope.errorMessage}">
            <p class="error-message">${requestScope.errorMessage}</p>
        </c:if>
        <c:if test="${not empty requestScope.successMessage}">
            <p class="success-message">${requestScope.successMessage}</p>
        </c:if>
        <form action="login" method="POST">
            <div class="form-group">
                <label for="username">Usuário:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Senha:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="btn-primary">Entrar</button>
        </form>
    </div>
</body>
</html>