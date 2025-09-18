<!DOCTYPE html>
<html lang="pt-br">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartCity AI - Contato</title>
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
        
        .contact-icon {
            width: 56px;
            height: 56px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
            font-size: 1.25rem;
        }
        
        .form-input {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            transition: all 0.2s ease;
        }
        
        .form-input:focus {
            outline: none;
            border-color: #0ea5e9;
            box-shadow: 0 0 0 3px rgba(14, 165, 233, 0.2);
        }
        
        .form-label {
            display: block;
            font-weight: 500;
            margin-bottom: 0.5rem;
            color: #374151;
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
    <!-- Sidebar -->
    <jsp:include  page="_menu.jsp?page=contato" />

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <header class="header flex items-center justify-between">
            <div class="flex items-center">
                <button id="menu-toggle" class="mr-4 text-gray-600 focus:outline-none md:hidden">
                    <i class="fas fa-bars text-xl"></i>
                </button>
                <h1 class="text-xl font-semibold">Contato</h1>
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
            <!-- Page Header -->
            <div class="mb-8">
                <h2 class="text-2xl font-bold text-gray-800 mb-2">Entre em Contato</h2>
                <p class="text-gray-600">Tem dúvidas, sugestões ou precisa de suporte? Estamos aqui para ajudar.</p>
            </div>
            
            <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 mb-8">
                <!-- Contact Information -->
                <div class="lg:col-span-1">
                    <div class="card p-6">
                        <h3 class="text-xl font-semibold text-gray-800 mb-6">Informações de Contato</h3>
                        
                        <div class="mb-6">
                            <div class="contact-icon bg-blue-100 text-blue-600">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <h4 class="font-medium text-gray-800 mb-1">Endereço</h4>
                            <p class="text-gray-600">Av. Paulista, 1234, São Paulo - SP, 01310-100</p>
                        </div>
                        
                        <div class="mb-6">
                            <div class="contact-icon bg-green-100 text-green-600">
                                <i class="fas fa-phone-alt"></i>
                            </div>
                            <h4 class="font-medium text-gray-800 mb-1">Telefone</h4>
                            <p class="text-gray-600">+55 (11) 3456-7890</p>
                        </div>
                        
                        <div class="mb-6">
                            <div class="contact-icon bg-purple-100 text-purple-600">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <h4 class="font-medium text-gray-800 mb-1">Email</h4>
                            <p class="text-gray-600">contato@smartcityai.com.br</p>
                        </div>
                        
                        <div>
                            <div class="contact-icon bg-orange-100 text-orange-600">
                                <i class="fas fa-clock"></i>
                            </div>
                            <h4 class="font-medium text-gray-800 mb-1">Horário de Atendimento</h4>
                            <p class="text-gray-600">Segunda a Sexta, 9h às 18h</p>
                        </div>
                    </div>
                    
                    <div class="card p-6 mt-6">
                        <h3 class="text-xl font-semibold text-gray-800 mb-4">Siga-nos</h3>
                        <div class="flex space-x-4">
                            <a href="#" class="w-10 h-10 rounded-full bg-blue-100 text-blue-600 flex items-center justify-center hover:bg-blue-200 transition-colors">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="#" class="w-10 h-10 rounded-full bg-blue-200 text-blue-600 flex items-center justify-center hover:bg-blue-300 transition-colors">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="#" class="w-10 h-10 rounded-full bg-pink-100 text-pink-600 flex items-center justify-center hover:bg-pink-200 transition-colors">
                                <i class="fab fa-instagram"></i>
                            </a>
                            <a href="#" class="w-10 h-10 rounded-full bg-blue-700 text-white flex items-center justify-center hover:bg-blue-800 transition-colors">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                        </div>
                    </div>
                </div>
                
                <!-- Contact Form -->
                <div class="lg:col-span-2">
                    <div class="card p-6">
                        <h3 class="text-xl font-semibold text-gray-800 mb-6">Envie uma Mensagem</h3>
                        
                        <form action="ContatoServlet" method="post">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                                <div>
                                    <label for="nome" class="form-label">Nome Completo</label>
                                    <input type="text" id="nome" name="nome" class="form-input" placeholder="Seu nome completo" required>
                                </div>
                                
                                <div>
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" id="email" name="email" class="form-input" placeholder="seu.email@exemplo.com" required>
                                </div>
                            </div>
                            
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                                <div>
                                    <label for="telefone" class="form-label">Telefone</label>
                                    <input type="tel" id="telefone" name="telefone" class="form-input" placeholder="(11) 99999-9999">
                                </div>
                                
                                <div>
                                    <label for="assunto" class="form-label">Assunto</label>
                                    <select id="assunto" name="assunto" class="form-input" required>
                                        <option value="" disabled selected>Selecione um assunto</option>
                                        <option value="suporte">Suporte Técnico</option>
                                        <option value="vendas">Informações comerciais</option>
                                        <option value="parcerias">Propostas de parceria</option>
                                        <option value="sugestoes">Sugestões</option>
                                        <option value="outros">Outros</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="mb-6">
                                <label for="mensagem" class="form-label">Mensagem</label>
                                <textarea id="mensagem" name="mensagem" rows="5" class="form-input" placeholder="Digite sua mensagem aqui..." required></textarea>
                            </div>
                            
                            <div class="flex items-center">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-paper-plane mr-2"></i>
                                    Enviar Mensagem
                                </button>
                                
                                <div class="ml-4 text-sm text-gray-500">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="rounded border-gray-300 text-primary-600 focus:ring-primary-500 mr-2" required>
                                        <span>Concordo com os <a href="#" class="text-primary-600 hover:underline">termos de privacidade</a></span>
                                    </label>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <!-- FAQ Section -->
                    <div class="card p-6 mt-6">
                        <h3 class="text-xl font-semibold text-gray-800 mb-4">Perguntas Frequentes</h3>
                        
                        <div class="space-y-4">
                            <div>
                                <h4 class="font-medium text-gray-800 mb-1">Quanto tempo leva para receber uma resposta?</h4>
                                <p class="text-gray-600 text-sm">Normalmente respondemos todas as consultas dentro de 24 horas durante dias úteis.</p>
                            </div>
                            
                            <div>
                                <h4 class="font-medium text-gray-800 mb-1">Vocês oferecem suporte técnico 24/7?</h4>
                                <p class="text-gray-600 text-sm">Oferecemos suporte técnico durante o horário comercial. Para emergências fora desse horário, temos um plantão para casos críticos.</p>
                            </div>
                            
                            <div>
                                <h4 class="font-medium text-gray-800 mb-1">Como posso me tornar um parceiro?</h4>
                                <p class="text-gray-600 text-sm">Temos várias opções de parceria. Entre em contato através do formulário selecionando "Propostas de parceria" no assunto.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Map Section -->
            <div class="card overflow-hidden">
                <div class="h-64 bg-gray-200 flex items-center justify-center">
                    <div class="text-center">
                        <i class="fas fa-map-marked-alt text-4xl text-gray-400 mb-2"></i>
                        <p class="text-gray-500">Mapa de localização seria exibido aqui</p>
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
        
        // Phone number mask
        const phoneInput = document.getElementById('telefone');
        if (phoneInput) {
            phoneInput.addEventListener('input', function(e) {
                let value = e.target.value.replace(/\D/g, '');
                if (value.length > 11) value = value.slice(0, 11);
                
                if (value.length > 0) {
                    value = value.replace(/^(\d{2})(\d)/g, '($1) $2');
                    if (value.length > 10) {
                        value = value.replace(/(\d{5})(\d)/, '$1-$2');
                    } else {
                        value = value.replace(/(\d{4})(\d)/, '$1-$2');
                    }
                }
                
                e.target.value = value;
            });
        }
        
        // Form validation
        const contactForm = document.querySelector('form');
        if (contactForm) {
            contactForm.addEventListener('submit', function(e) {
                // Simple validation - you can expand this as needed
                const email = document.getElementById('email').value;
                if (email && !email.includes('@')) {
                    e.preventDefault();
                    alert('Por favor, insira um email válido.');
                    return false;
                }
                
                // Form would submit normally if validation passes
            });
        }
    </script>
</body>
</html>