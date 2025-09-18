<!DOCTYPE html>
<html lang="pt-br">

<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SmartCity AI - Dashboard</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            primary: {
                                50: '#f0f9ff',
                                100: '#e0f2fe',
                                200: '#bae6fd',
                                300: '#7dd3fc',
                                400: '#38bdf8',
                                500: '#0ea5e9',
                                600: '#0284c7',
                                700: '#0369a1',
                                800: '#075985',
                                900: '#0c4a6e',
                            },
                            dark: {
                                50: '#f8fafc',
                                100: '#f1f5f9',
                                200: '#e2e8f0',
                                300: '#cbd5e1',
                                400: '#94a3b8',
                                500: '#64748b',
                                600: '#475569',
                                700: '#334155',
                                800: '#1e293b',
                                900: '#0f172a',
                            }
                        }
                    }
                }
            }
        </script>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
            
            :root {
                --sidebar-width: 280px;
                --header-height: 70px;
            }
            
            body {
                font-family: 'Inter', sans-serif;
                background-color: #f7fafc;
                color: #1a202c;
                transition: all 0.3s ease;
            }
            
            .sidebar {
                width: var(--sidebar-width);
                height: 100vh;
                position: fixed;
                top: 0;
                left: 0;
                background: linear-gradient(180deg, #1e293b 0%, #0f172a 100%);
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                z-index: 1000;
                transition: all 0.3s ease;
                overflow-y: auto;
            }
            
            .sidebar-header {
                height: var(--header-height);
                display: flex;
                align-items: center;
                padding: 0 1.5rem;
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            }
            
            .sidebar-logo {
                display: flex;
                align-items: center;
                gap: 0.75rem;
                color: white;
                font-weight: 700;
                font-size: 1.25rem;
            }
            
            .nav-item {
                display: flex;
                align-items: center;
                padding: 0.75rem 1.5rem;
                color: #cbd5e1;
                border-left: 3px solid transparent;
                transition: all 0.2s ease;
            }
            
            .nav-item:hover, .nav-item.active {
                background-color: rgba(255, 255, 255, 0.05);
                color: white;
                border-left-color: #0ea5e9;
            }
            
            .nav-item i {
                width: 24px;
                margin-right: 0.75rem;
            }
            
            .main-content {
                margin-left: var(--sidebar-width);
                transition: all 0.3s ease;
            }
            
            .header {
                height: var(--header-height);
                position: sticky;
                top: 0;
                z-index: 100;
                background-color: white;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
                padding: 0 1.5rem;
            }
            
            .card {
                background: white;
                border-radius: 12px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
                transition: all 0.2s ease;
                overflow: hidden;
            }
            
            .card:hover {
                box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
                transform: translateY(-2px);
            }
            
            .btn {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                padding: 0.5rem 1rem;
                border-radius: 8px;
                font-weight: 500;
                transition: all 0.2s ease;
                cursor: pointer;
            }
            
            .btn-primary {
                background: linear-gradient(135deg, #0ea5e9 0%, #0284c7 100%);
                color: white;
                box-shadow: 0 2px 4px rgba(14, 165, 233, 0.3);
            }
            
            .btn-primary:hover {
                transform: translateY(-1px);
                box-shadow: 0 4px 8px rgba(14, 165, 233, 0.4);
            }
            
            .loading-spinner {
                display: inline-block;
                width: 20px;
                height: 20px;
                border: 3px solid rgba(255, 255, 255, 0.3);
                border-radius: 50%;
                border-top-color: white;
                animation: spin 1s ease-in-out infinite;
            }
            
            @keyframes spin {
                to { transform: rotate(360deg); }
            }
            
            .stats-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
                gap: 1.5rem;
            }
            
            .stat-card {
                padding: 1.5rem;
            }
            
            .stat-icon {
                width: 48px;
                height: 48px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 1rem;
            }
            
            .stat-value {
                font-size: 1.875rem;
                font-weight: 700;
                margin-bottom: 0.25rem;
            }
            
            .stat-label {
                color: #64748b;
                font-size: 0.875rem;
            }
            
            /* Responsive design */
            @media (max-width: 1024px) {
                .sidebar {
                    transform: translateX(-100%);
                }
                
                .sidebar.open {
                    transform: translateX(0);
                }
                
                .main-content {
                    margin-left: 0;
                }
                
                .overlay {
                    position: fixed;
                    top: 0;
                    left: 0;
                    right: 0;
                    bottom: 0;
                    background-color: rgba(0, 0, 0, 0.5);
                    z-index: 999;
                    display: none;
                }
                
                .overlay.active {
                    display: block;
                }
            }
        </style>
</head>

<body>
    <!-- Overlay for mobile sidebar -->
    <div class="overlay" id="overlay"></div>

    <!-- Sidebar -->
    <jsp:include  page="_menu.jsp?page=index" />

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <header class="header flex items-center justify-between">
            <div class="flex items-center">
                <button id="menu-toggle" class="mr-4 text-gray-600 focus:outline-none md:hidden">
                    <i class="fas fa-bars text-xl"></i>
                </button>
                <h1 class="text-xl font-semibold">Dashboard</h1>
            </div>
            
            <div class="flex items-center space-x-4">
                <div class="relative hidden md:block">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-search text-gray-400"></i>
                    </div>
                    <input type="text" class="pl-10 pr-4 py-2 rounded-lg border border-gray-300 focus:ring-2 focus:ring-primary-200 focus:border-primary-500 outline-none" placeholder="Pesquisar...">
                </div>
                
                <button class="relative p-2 text-gray-600 hover:text-primary-600">
                    <i class="fas fa-bell text-xl"></i>
                    <span class="absolute top-0 right-0 w-4 h-4 bg-red-500 rounded-full text-xs text-white flex items-center justify-center">3</span>
                </button>
                
                <div class="relative">
                    <button class="flex items-center space-x-2 focus:outline-none" id="user-menu-button">
                        <div class="w-8 h-8 rounded-full bg-primary-100 text-primary-800 flex items-center justify-center font-medium">
                            AD
                        </div>
                        <span class="hidden md:block text-sm font-medium">Administrador</span>
                        <i class="fas fa-chevron-down text-xs hidden md:block"></i>
                    </button>
                    
                    <div class="absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-lg py-1 hidden z-50" id="user-menu">
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Perfil</a>
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Configurações</a>
                        <div class="border-t border-gray-100 my-1"></div>
                        <a href="#" class="block px-4 py-2 text-sm text-red-600 hover:bg-gray-100">Sair</a>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content Area -->
        <main class="p-6">
            <!-- Welcome Section -->
            <div class="mb-8">
                <h2 class="text-2xl font-bold text-gray-800 mb-2">Bem-vindo ao SmartCity AI</h2>
                <p class="text-gray-600">Esta é a página inicial do seu aplicativo SmartCity AI. Use o menu lateral para navegar pelas diferentes seções.</p>
            </div>
            
            <!-- Stats Overview -->
            <div class="stats-grid mb-8">
                <div class="card stat-card">
                    <div class="stat-icon bg-blue-100 text-blue-600">
                        <i class="fas fa-building"></i>
                    </div>
                    <div class="stat-value">1,248</div>
                    <div class="stat-label">Setores Monitorados</div>
                </div>
                
                <div class="card stat-card">
                    <div class="stat-icon bg-green-100 text-green-600">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <div class="stat-value">86%</div>
                    <div class="stat-label">Eficiência Operacional</div>
                </div>
                
                <div class="card stat-card">
                    <div class="stat-icon bg-purple-100 text-purple-600">
                        <i class="fas fa-bolt"></i>
                    </div>
                    <div class="stat-value">24</div>
                    <div class="stat-label">Alertas Recentes</div>
                </div>
                
                <div class="card stat-card">
                    <div class="stat-icon bg-orange-100 text-orange-600">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <div class="stat-value">92%</div>
                    <div class="stat-label">Problemas Resolvidos</div>
                </div>
            </div>
            
            <!-- Simulated Analysis Section -->
            <div class="card p-6 mb-8">
                <div class="flex flex-col md:flex-row md:items-center justify-between mb-6">
                    <div>
                        <h2 class="text-xl font-semibold text-gray-800 mb-1">Simulacro de Análises</h2>
                        <p class="text-sm text-gray-600">Clique no botão para buscar análises simuladas (News+IA).</p>
                    </div>
                    <button id="btn-simulacro" class="btn btn-primary mt-4 md:mt-0">
                        <i class="fas fa-sync-alt mr-2"></i>
                        Carregar Simulacro
                    </button>
                </div>
                
                <div id="simulacro-results" class="space-y-4"></div>
            </div>
            
            <!-- Recent Activity Section -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                <div class="card p-6">
                    <h3 class="text-lg font-semibold text-gray-800 mb-4">Atividade Recente</h3>
                    <div class="space-y-4">
                        <div class="flex items-start">
                            <div class="w-10 h-10 rounded-full bg-blue-100 flex items-center justify-center text-blue-600 mr-3">
                                <i class="fas fa-chart-line"></i>
                            </div>
                            <div>
                                <p class="font-medium">Novo relatório de tráfego gerado</p>
                                <p class="text-sm text-gray-500">Há 2 minutos</p>
                            </div>
                        </div>
                        
                        <div class="flex items-start">
                            <div class="w-10 h-10 rounded-full bg-green-100 flex items-center justify-center text-green-600 mr-3">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <div>
                                <p class="font-medium">Problema de iluminação resolvido no setor B4</p>
                                <p class="text-sm text-gray-500">Há 15 minutos</p>
                            </div>
                        </div>
                        
                        <div class="flex items-start">
                            <div class="w-10 h-10 rounded-full bg-purple-100 flex items-center justify-center text-purple-600 mr-3">
                                <i class="fas fa-bell"></i>
                            </div>
                            <div>
                                <p class="font-medium">Alerta de congestionamento no centro</p>
                                <p class="text-sm text-gray-500">Há 1 hora</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="card p-6">
                    <h3 class="text-lg font-semibold text-gray-800 mb-4">Setores com Atividade</h3>
                    <div class="space-y-3">
                        <div class="flex items-center justify-between">
                            <span class="font-medium">Centro</span>
                            <span class="px-2 py-1 bg-yellow-100 text-yellow-800 text-xs rounded-full">Moderado</span>
                        </div>
                        
                        <div class="flex items-center justify-between">
                            <span class="font-medium">Zona Norte</span>
                            <span class="px-2 py-1 bg-green-100 text-green-800 text-xs rounded-full">Normal</span>
                        </div>
                        
                        <div class="flex items-center justify-between">
                            <span class="font-medium">Zona Sul</span>
                            <span class="px-2 py-1 bg-red-100 text-red-800 text-xs rounded-full">Crítico</span>
                        </div>
                        
                        <div class="flex items-center justify-between">
                            <span class="font-medium">Zona Leste</span>
                            <span class="px-2 py-1 bg-yellow-100 text-yellow-800 text-xs rounded-full">Moderado</span>
                        </div>
                        
                        <div class="flex items-center justify-between">
                            <span class="font-medium">Zona Oeste</span>
                            <span class="px-2 py-1 bg-green-100 text-green-800 text-xs rounded-full">Normal</span>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script>
        // Toggle sidebar on mobile
        document.getElementById('menu-toggle').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('open');
            document.getElementById('overlay').classList.toggle('active');
        });
        
        // Close sidebar when clicking overlay
        document.getElementById('overlay').addEventListener('click', function() {
            document.getElementById('sidebar').classList.remove('open');
            this.classList.remove('active');
        });
        
        // Toggle user menu
        document.getElementById('user-menu-button').addEventListener('click', function() {
            document.getElementById('user-menu').classList.toggle('hidden');
        });
        
        // Close user menu when clicking outside
        document.addEventListener('click', function(event) {
            const userMenu = document.getElementById('user-menu');
            const userMenuButton = document.getElementById('user-menu-button');
            
            if (!userMenu.contains(event.target) && !userMenuButton.contains(event.target)) {
                userMenu.classList.add('hidden');
            }
        });
        
        // Simulacro button functionality
        document.getElementById('btn-simulacro').addEventListener('click', function() {
            const button = this;
            const originalText = button.innerHTML;
            const resultsEl = document.getElementById('simulacro-results');
            
            // Show loading state
            button.disabled = true;
            button.innerHTML = '<span class="loading-spinner mr-2"></span> Carregando...';
            
            resultsEl.innerHTML = '<div class="p-4 bg-blue-50 rounded-lg text-blue-800"><i class="fas fa-spinner fa-spin mr-2"></i>Carregando análises...</div>';
            
            // Simulate API call
            setTimeout(function() {
                fetch('<%= request.getContextPath() %>/analise/simulacro')
                    .then(r => {
                        if (!r.ok) throw new Error('HTTP ' + r.status);
                        return r.json();
                    })
                    .then(data => {
                        resultsEl.innerHTML = '';
                        
                        if (data.length === 0) {
                            resultsEl.innerHTML = '<div class="p-4 bg-yellow-50 rounded-lg text-yellow-800"><i class="fas fa-exclamation-triangle mr-2"></i>Nenhum dado encontrado para exibir.</div>';
                            return;
                        }
                        
                        data.forEach(item => {
                            const card = document.createElement('div');
                            card.className = 'p-4 bg-gray-50 rounded-lg border border-gray-200';
                            card.innerHTML = `
                                <div class="flex justify-between items-start mb-2">
                                    <h4 class="font-semibold text-gray-800">${item.setor || 'Setor não especificado'}</h4>
                                    <span class="px-2 py-1 bg-primary-100 text-primary-800 text-xs rounded-full">${item.prioridade || 'Média'}</span>
                                </div>
                                <p class="text-sm text-gray-600 mb-2"><strong>Dados:</strong> ${item.dados || 'N/A'}</p>
                                <p class="text-sm"><strong>Resultado:</strong> ${item.resultadoAnalise || 'Nenhum resultado disponível'}</p>
                                <div class="mt-3 pt-3 border-t border-gray-200 flex justify-end">
                                    <button class="text-xs text-primary-600 hover:text-primary-800 font-medium">Ver detalhes <i class="fas fa-arrow-right ml-1 text-xs"></i></button>
                                </div>
                            `;
                            resultsEl.appendChild(card);
                        });
                    })
                    .catch(err => {
                        resultsEl.innerHTML = `<div class="p-4 bg-red-50 rounded-lg text-red-800"><i class="fas fa-exclamation-circle mr-2"></i>Erro: ${err.message}</div>`;
                    })
                    .finally(() => {
                        // Reset button state
                        button.disabled = false;
                        button.innerHTML = originalText;
                    });
            }, 1000); // Simulate network delay
        });
    </script>
</body>

</html>