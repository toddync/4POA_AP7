<!DOCTYPE html>
<html lang="pt-br">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartCity AI - Sobre</title>
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
        
        .feature-icon {
            width: 64px;
            height: 64px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
            font-size: 1.5rem;
        }
        
        .team-member {
            text-align: center;
        }
        
        .team-avatar {
            width: 96px;
            height: 96px;
            border-radius: 50%;
            margin: 0 auto 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            font-weight: bold;
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
    <jsp:include  page="_menu.jsp?page=sobre" />

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <header class="header flex items-center justify-between">
            <div class="flex items-center">
                <button id="menu-toggle" class="mr-4 text-gray-600 focus:outline-none md:hidden">
                    <i class="fas fa-bars text-xl"></i>
                </button>
                <h1 class="text-xl font-semibold">Sobre o SmartCity AI</h1>
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
            <!-- Hero Section -->
            <div class="card p-8 mb-8 bg-gradient-to-r from-primary-600 to-primary-800 text-white">
                <h2 class="text-3xl font-bold mb-4">Transformando Cidades com Inteligência Artificial</h2>
                <p class="text-lg mb-6">O SmartCity AI é uma plataforma inovadora que utiliza análise de dados e inteligência artificial para melhorar a gestão urbana e a qualidade de vida nas cidades.</p>
                <div class="flex gap-4">
                    <button class="btn bg-white text-primary-700">
                        <i class="fas fa-play-circle mr-2"></i>
                        Ver Vídeo
                    </button>
                    <button class="btn bg-primary-900 text-white">
                        <i class="fas fa-download mr-2"></i>
                        Baixar Apresentação
                    </button>
                </div>
            </div>
            
            <!-- Mission Section -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-8">
                <div>
                    <h2 class="text-2xl font-bold text-gray-800 mb-4">Nossa Missão</h2>
                    <p class="text-gray-600 mb-4">Desenvolver soluções inteligentes que transformem dados urbanos em insights acionáveis, permitindo que gestores públicos tomem decisões mais informadas e eficientes.</p>
                    <p class="text-gray-600">Nossa plataforma integra dados de múltiplas fontes para fornecer uma visão holística do funcionamento da cidade, identificando padrões, prevendo tendências e sugerindo intervenções otimizadas.</p>
                </div>
                <div class="bg-gray-100 rounded-xl p-6 flex items-center justify-center">
                    <div class="text-center">
                        <div class="text-5xl font-bold text-primary-600 mb-2">2019</div>
                        <div class="text-gray-600">Ano de Fundação</div>
                    </div>
                </div>
            </div>
            
            <!-- Features Section -->
            <h2 class="text-2xl font-bold text-gray-800 mb-6">Principais Funcionalidades</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
                <div class="card p-6">
                    <div class="feature-icon bg-blue-100 text-blue-600">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <h3 class="text-xl font-semibold text-gray-800 mb-2">Análise Preditiva</h3>
                    <p class="text-gray-600">Utilizamos algoritmos de machine learning para prever tendências e comportamentos urbanos, permitindo ações preventivas.</p>
                </div>
                
                <div class="card p-6">
                    <div class="feature-icon bg-green-100 text-green-600">
                        <i class="fas fa-database"></i>
                    </div>
                    <h3 class="text-xl font-semibold text-gray-800 mb-2">Integração de Dados</h3>
                    <p class="text-gray-600">Conectamos múltiplas fontes de dados municipais para criar uma visão unificada da operação da cidade.</p>
                </div>
                
                <div class="card p-6">
                    <div class="feature-icon bg-purple-100 text-purple-600">
                        <i class="fas fa-map-marked-alt"></i>
                    </div>
                    <h3 class="text-xl font-semibold text-gray-800 mb-2">Visualização Geográfica</h3>
                    <p class="text-gray-600">Representamos dados urbanos complexos em mapas interativos para facilitar a compreensão espacial.</p>
                </div>
                
                <div class="card p-6">
                    <div class="feature-icon bg-orange-100 text-orange-600">
                        <i class="fas fa-bell"></i>
                    </div>
                    <h3 class="text-xl font-semibold text-gray-800 mb-2">Sistema de Alertas</h3>
                    <p class="text-gray-600">Notificações automáticas sobre eventos críticos e oportunidades de otimização em tempo real.</p>
                </div>
                
                <div class="card p-6">
                    <div class="feature-icon bg-teal-100 text-teal-600">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3 class="text-xl font-semibold text-gray-800 mb-2">Participação Cidadã</h3>
                    <p class="text-gray-600">Ferramentas para engajar os cidadãos no processo de melhoria contínua da cidade.</p>
                </div>
                
                <div class="card p-6">
                    <div class="feature-icon bg-red-100 text-red-600">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <h3 class="text-xl font-semibold text-gray-800 mb-2">Segurança de Dados</h3>
                    <p class="text-gray-600">Protegemos todas as informações com protocolos de segurança de última geração e conformidade com LGPD.</p>
                </div>
            </div>
            
            <!-- Team Section -->
            <h2 class="text-2xl font-bold text-gray-800 mb-6">Nossa Equipe</h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                <div class="card p-6 team-member">
                    <div class="team-avatar bg-blue-100 text-blue-800">
                        <span>MC</span>
                    </div>
                    <h3 class="text-lg font-semibold text-gray-800">Maria Costa</h3>
                    <p class="text-sm text-primary-600 mb-2">CEO & Fundadora</p>
                    <p class="text-sm text-gray-600">Especialista em gestão urbana com 15 anos de experiência.</p>
                </div>
                
                <div class="card p-6 team-member">
                    <div class="team-avatar bg-green-100 text-green-800">
                        <span>PS</span>
                    </div>
                    <h3 class="text-lg font-semibold text-gray-800">Pedro Silva</h3>
                    <p class="text-sm text-primary-600 mb-2">CTO</p>
                    <p class="text-sm text-gray-600">PhD em Ciência de Dados e IA aplicada a cidades inteligentes.</p>
                </div>
                
                <div class="card p-6 team-member">
                    <div class="team-avatar bg-purple-100 text-purple-800">
                        <span>AS</span>
                    </div>
                    <h3 class="text-lg font-semibold text-gray-800">Ana Santos</h3>
                    <p class="text-sm text-primary-600 mb-2">Líder de Desenvolvimento</p>
                    <p class="text-sm text-gray-600">Engenheira de software com expertise em sistemas complexos.</p>
                </div>
                
                <div class="card p-6 team-member">
                    <div class="team-avatar bg-orange-100 text-orange-800">
                        <span>RS</span>
                    </div>
                    <h3 class="text-lg font-semibold text-gray-800">Ricardo Souza</h3>
                    <p class="text-sm text-primary-600 mb-2">Especialista em Dados</p>
                    <p class="text-sm text-gray-600">Analista de dados urbanos com foco em sustentabilidade.</p>
                </div>
            </div>
            
            <!-- Partners Section -->
            <div class="card p-6 mb-8">
                <h2 class="text-2xl font-bold text-gray-800 mb-6">Parceiros e Colaboradores</h2>
                <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
                    <div class="bg-gray-100 rounded-lg h-24 flex items-center justify-center">
                        <span class="text-gray-500 font-semibold">Prefeitura Municipal</span>
                    </div>
                    <div class="bg-gray-100 rounded-lg h-24 flex items-center justify-center">
                        <span class="text-gray-500 font-semibold">Universidade Federal</span>
                    </div>
                    <div class="bg-gray-100 rounded-lg h-24 flex items-center justify-center">
                        <span class="text-gray-500 font-semibold">TechInnovate</span>
                    </div>
                    <div class="bg-gray-100 rounded-lg h-24 flex items-center justify-center">
                        <span class="text-gray-500 font-semibold">Instituto de Pesquisas</span>
                    </div>
                </div>
            </div>
            
            <!-- Contact CTA -->
            <div class="bg-gradient-to-r from-primary-50 to-primary-100 rounded-xl p-8 text-center">
                <h2 class="text-2xl font-bold text-gray-800 mb-4">Interessado em saber mais?</h2>
                <p class="text-gray-600 mb-6">Entre em contato conosco para agendar uma demonstração ou solicitar mais informações sobre nossa plataforma.</p>
                <button class="btn btn-primary">
                    <i class="fas fa-envelope mr-2"></i>
                    Entrar em Contato
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
    </script>
</body>
</html>