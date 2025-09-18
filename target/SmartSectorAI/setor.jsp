<!DOCTYPE html>
<html lang="pt-br">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartCity AI - Análise por Setor</title>
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
        
        .sector-card {
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        
        .sector-icon {
            width: 64px;
            height: 64px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
            font-size: 1.5rem;
        }
        
        .sector-stats {
            display: flex;
            justify-content: space-between;
            margin-top: auto;
            padding-top: 1rem;
            border-top: 1px solid #e2e8f0;
        }
        
        .stat {
            text-align: center;
        }
        
        .stat-value {
            font-size: 1.125rem;
            font-weight: 700;
        }
        
        .stat-label {
            font-size: 0.75rem;
            color: #64748b;
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
    <jsp:include  page="_menu.jsp?page=setor" />

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <header class="header flex items-center justify-between">
            <div class="flex items-center">
                <button id="menu-toggle" class="mr-4 text-gray-600 focus:outline-none md:hidden">
                    <i class="fas fa-bars text-xl"></i>
                </button>
                <h1 class="text-xl font-semibold">Análise por Setor</h1>
            </div>
            
            <div class="flex items-center space-x-4">
                <div class="relative hidden md:block">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-search text-gray-400"></i>
                    </div>
                    <input type="text" class="pl-10 pr-4 py-2 rounded-lg border border-gray-300 focus:ring-2 focus:ring-primary-200 focus:border-primary-500 outline-none" placeholder="Pesquisar setor...">
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
            <!-- Page Header -->
            <div class="mb-8">
                <h2 class="text-2xl font-bold text-gray-800 mb-2">Análise por Setor</h2>
                <p class="text-gray-600">Selecione um setor para visualizar as análises detalhadas e métricas de desempenho.</p>
            </div>
            
            <!-- Filter Section -->
            <div class="card p-4 mb-6 flex flex-wrap items-center gap-4">
                <span class="font-medium text-gray-700">Filtrar por:</span>
                <div class="flex flex-wrap gap-2">
                    <button class="px-3 py-1 bg-primary-100 text-primary-700 rounded-full text-sm font-medium">Todos</button>
                    <button class="px-3 py-1 bg-gray-100 text-gray-700 rounded-full text-sm font-medium">Prioritários</button>
                    <button class="px-3 py-1 bg-gray-100 text-gray-700 rounded-full text-sm font-medium">Com alertas</button>
                    <button class="px-3 py-1 bg-gray-100 text-gray-700 rounded-full text-sm font-medium">Estáveis</button>
                </div>
                
                <div class="ml-auto flex items-center">
                    <span class="text-sm text-gray-600 mr-2">Ordenar por:</span>
                    <select class="text-sm border border-gray-300 rounded-md px-3 py-1 focus:outline-none focus:ring-2 focus:ring-primary-200 focus:border-primary-500">
                        <option>Nome A-Z</option>
                        <option>Prioridade</option>
                        <option>Desempenho</option>
                        <option>Alertas Recentes</option>
                    </select>
                </div>
            </div>
            
            <!-- Sector Grid -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <!-- Health Sector -->
                <div class="card sector-card p-6">
                    <div class="sector-icon bg-blue-100 text-blue-600">
                        <i class="fas fa-heartbeat"></i>
                    </div>
                    <h3 class="text-xl font-semibold text-gray-800 mb-2">Saúde</h3>
                    <p class="text-gray-600 mb-4">Análises de dados de saúde pública, hospitais, clínicas e indicadores de bem-estar.</p>
                    
                    <div class="sector-stats">
                        <div class="stat">
                            <div class="stat-value text-blue-600">86%</div>
                            <div class="stat-label">Eficiência</div>
                        </div>
                        <div class="stat">
                            <div class="stat-value">12</div>
                            <div class="stat-label">Alertas</div>
                        </div>
                        <div class="stat">
                            <div class="stat-value">24</div>
                            <div class="stat-label">Unidades</div>
                        </div>
                    </div>
                    
                    <a href="#" class="btn btn-primary mt-4 justify-center">
                        <i class="fas fa-chart-bar mr-2"></i>
                        Ver Análises
                    </a>
                </div>
                
                <!-- Education Sector -->
                <div class="card sector-card p-6">
                    <div class="sector-icon bg-green-100 text-green-600">
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                    <h3 class="text-xl font-semibold text-gray-800 mb-2">Educação</h3>
                    <p class="text-gray-600 mb-4">Análises de desempenho escolar, infraestrutura, programas educacionais e indicadores de aprendizado.</p>
                    
                    <div class="sector-stats">
                        <div class="stat">
                            <div class="stat-value text-green-600">92%</div>
                            <div class="stat-label">Eficiência</div>
                        </div>
                        <div class="stat">
                            <div class="stat-value">5</div>
                            <div class="stat-label">Alertas</div>
                        </div>
                        <div class="stat">
                            <div class="stat-value">42</div>
                            <div class="stat-label">Escolas</div>
                        </div>
                    </div>
                    
                    <a href="#" class="btn btn-primary mt-4 justify-center">
                        <i class="fas fa-chart-bar mr-2"></i>
                        Ver Análises
                    </a>
                </div>
                
                <!-- Transport Sector -->
                <div class="card sector-card p-6">
                    <div class="sector-icon bg-purple-100 text-purple-600">
                        <i class="fas fa-bus"></i>
                    </div>
                    <h3 class="text-xl font-semibold text-gray-800 mb-2">Transporte</h3>
                    <p class="text-gray-600 mb-4">Análises de fluxo de tráfego, transporte público, infraestrutura viária e tempo de deslocamento.</p>
                    
                    <div class="sector-stats">
                        <div class="stat">
                            <div class="stat-value text-purple-600">78%</div>
                            <div class="stat-label">Eficiência</div>
                        </div>
                        <div class="stat">
                            <div class="stat-value">18</div>
                            <div class="stat-label">Alertas</div>
                        </div>
                        <div class="stat">
                            <div class="stat-value">156</div>
                            <div class="stat-label">Rotas</div>
                        </div>
                    </div>
                    
                    <a href="#" class="btn btn-primary mt-4 justify-center">
                        <i class="fas fa-chart-bar mr-2"></i>
                        Ver Análises
                    </a>
                </div>
                
                <!-- Security Sector -->
                <div class="card sector-card p-6">
                    <div class="sector-icon bg-red-100 text-red-600">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <h3 class="text-xl font-semibold text-gray-800 mb-2">Segurança</h3>
                    <p class="text-gray-600 mb-4">Análises de índices de criminalidade, policiamento, segurança urbana e resposta a incidentes.</p>
                    
                    <div class="sector-stats">
                        <div class="stat">
                            <div class="stat-value text-red-600">82%</div>
                            <div class="stat-label">Eficiência</div>
                        </div>
                        <div class="stat">
                            <div class="stat-value">8</div>
                            <div class="stat-label">Alertas</div>
                        </div>
                        <div class="stat">
                            <div class="stat-value">16</div>
                            <div class="stat-label">Delegacias</div>
                        </div>
                    </div>
                    
                    <a href="#" class="btn btn-primary mt-4 justify-center">
                        <i class="fas fa-chart-bar mr-2"></i>
                        Ver Análises
                    </a>
                </div>
                
                <!-- Environment Sector -->
                <div class="card sector-card p-6">
                    <div class="sector-icon bg-teal-100 text-teal-600">
                        <i class="fas fa-leaf"></i>
                    </div>
                    <h3 class="text-xl font-semibold text-gray-800 mb-2">Meio Ambiente</h3>
                    <p class="text-gray-600 mb-4">Análises de qualidade do ar, gestão de resíduos, áreas verdes e indicadores de sustentabilidade.</p>
                    
                    <div class="sector-stats">
                        <div class="stat">
                            <div class="stat-value text-teal-600">89%</div>
                            <div class="stat-label">Eficiência</div>
                        </div>
                        <div class="stat">
                            <div class="stat-value">3</div>
                            <div class="stat-label">Alertas</div>
                        </div>
                        <div class="stat">
                            <div class="stat-value">28</div>
                            <div class="stat-label">Parques</div>
                        </div>
                    </div>
                    
                    <a href="#" class="btn btn-primary mt-4 justify-center">
                        <i class="fas fa-chart-bar mr-2"></i>
                        Ver Análises
                    </a>
                </div>
                
                <!-- Urbanism Sector -->
                <div class="card sector-card p-6">
                    <div class="sector-icon bg-orange-100 text-orange-600">
                        <i class="fas fa-city"></i>
                    </div>
                    <h3 class="text-xl font-semibold text-gray-800 mb-2">Urbanismo</h3>
                    <p class="text-gray-600 mb-4">Análises de planejamento urbano, infraestrutura, obras públicas e desenvolvimento da cidade.</p>
                    
                    <div class="sector-stats">
                        <div class="stat">
                            <div class="stat-value text-orange-600">75%</div>
                            <div class="stat-label">Eficiência</div>
                        </div>
                        <div class="stat">
                            <div class="stat-value">15</div>
                            <div class="stat-label">Alertas</div>
                        </div>
                        <div class="stat">
                            <div class="stat-value">34</div>
                            <div class="stat-label">Projetos</div>
                        </div>
                    </div>
                    
                    <a href="#" class="btn btn-primary mt-4 justify-center">
                        <i class="fas fa-chart-bar mr-2"></i>
                        Ver Análises
                    </a>
                </div>
            </div>
            
            <!-- Call to Action -->
            <div class="mt-8 bg-gradient-to-r from-primary-600 to-primary-800 rounded-xl p-6 text-center text-white">
                <h3 class="text-xl font-semibold mb-2">Precisa de uma análise mais detalhada?</h3>
                <p class="mb-4">Nossa equipe de especialistas pode criar relatórios personalizados para suas necessidades específicas.</p>
                <button class="bg-white text-primary-700 px-6 py-2 rounded-lg font-medium hover:bg-gray-100 transition-colors">
                    Solicitar Relatório Personalizado
                </button>
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
        
        // Filter buttons functionality
        const filterButtons = document.querySelectorAll('.bg-gray-100');
        filterButtons.forEach(button => {
            button.addEventListener('click', function() {
                // Remove active state from all buttons
                filterButtons.forEach(btn => {
                    btn.classList.remove('bg-primary-100', 'text-primary-700');
                    btn.classList.add('bg-gray-100', 'text-gray-700');
                });
                
                // Add active state to clicked button
                this.classList.remove('bg-gray-100', 'text-gray-700');
                this.classList.add('bg-primary-100', 'text-primary-700');
                
                // Here you would normally filter the sectors
                // For this example, we'll just log the filter
                console.log('Filtering by: ' + this.textContent);
            });
        });
    </script>
</body>
</html>