<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String name = request.getParameter("page");%>

<!-- Overlay for mobile sidebar -->
<div class="overlay" id="overlay"></div>

<div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo">
                <i class="fas fa-brain"></i>
                <span>SmartCity AI</span>
            </div>
        </div>
        
        <div class="py-4">
            <a href="<%= request.getContextPath() %>/" class="nav-item <%= name.equals("index") ? "active" : "" %>">
                <i class="fas fa-home"></i>
                <span>Dashboard</span>
            </a>
            <a href="<%= request.getContextPath() %>/setor" class="nav-item <%= name.equals("setor") ? "active" : "" %>">
                <i class="fas fa-chart-pie"></i>
                <span>Análise por Setor</span>
            </a>
            <a href="<%= request.getContextPath() %>/sobre" class="nav-item <%= name.equals("sobre") ? "active" : "" %>">
                <i class="fas fa-info-circle"></i>
                <span>Sobre</span>
            </a>
            <a href="<%= request.getContextPath() %>/contato" class="nav-item <%= name.equals("contato") ? "active" : "" %>">
                <i class="fas fa-envelope"></i>
                <span>Contato</span>
            </a>
        </div>
        
        <div class="absolute bottom-0 w-full p-4 border-t border-gray-700">
            <div class="flex items-center space-x-3">
                <div class="w-10 h-10 rounded-full bg-primary-600 flex items-center justify-center text-white">
                    <span>AD</span>
                </div>
                <div class="flex-1 min-w-0">
                    <p class="text-sm font-medium text-white truncate">Admin User</p>
                    <p class="text-xs text-gray-400 truncate">admin@smartcity.com</p>
                </div>
                <button class="text-gray-400 hover:text-white">
                    <i class="fas fa-sign-out-alt"></i>
                </button>
            </div>
        </div>
    </div>