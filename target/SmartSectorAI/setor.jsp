<!DOCTYPE html>
<html lang="pt-br">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartCity AI - Análise por Setor</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            display: flex;
            min-height: 100vh;
            flex-direction: column;
        }
        #wrapper {
            display: flex;
            width: 100%;
        }
        #sidebar-wrapper {
            min-width: 250px;
            max-width: 250px;
            background: #343a40;
            color: #fff;
            transition: all 0.3s;
        }
        #sidebar-wrapper .sidebar-heading {
            padding: 0.875rem 1.25rem;
            font-size: 1.2rem;
            background: #212529;
        }
        #sidebar-wrapper .list-group {
            width: 100%;
        }
        #page-content-wrapper {
            flex-grow: 1;
            padding: 20px;
        }
        .list-group-item {
            background-color: #343a40;
            color: #fff;
            border: none;
        }
        .list-group-item:hover {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="flex h-screen bg-gray-100">
        <!-- Sidebar -->
        <div class="w-64 bg-gray-800 text-white flex-shrink-0">
            <%@ include file="_menu.jsp" %>
        </div>

        <!-- Page Content -->
        <div class="flex-1 flex flex-col overflow-hidden">
            <header class="flex justify-between items-center bg-white p-4 shadow">
                <button id="menu-toggle" class="text-gray-600 focus:outline-none">
                    <i class="fas fa-bars"></i>
                </button>
                <h1 class="text-xl font-semibold">Análise por Setor</h1>
                <nav>
                    <a href="<%= request.getContextPath() %>/dashboard" class="text-gray-600 hover:text-gray-900 px-3 py-2 rounded-md">Home</a>
                    <a href="<%= request.getContextPath() %>/sobre" class="text-gray-600 hover:text-gray-900 px-3 py-2 rounded-md">Sobre</a>
                    <div class="relative inline-block text-left">
                        <button type="button" class="inline-flex justify-center w-full rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" id="options-menu" aria-haspopup="true" aria-expanded="true">
                            Dropdown
                            <svg class="-mr-1 ml-2 h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                            </svg>
                        </button>
                        <div class="origin-top-right absolute right-0 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 hidden" role="menu" aria-orientation="vertical" aria-labelledby="options-menu">
                            <div class="py-1" role="none">
                                <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-gray-900" role="menuitem">Action</a>
                                <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-gray-900" role="menuitem">Another action</a>
                                <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-gray-900" role="menuitem">Something else here</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </header>

            <main class="flex-1 overflow-x-hidden overflow-y-auto bg-gray-200 p-4">
                <div class="container mx-auto">
                    <h1 class="text-3xl font-bold mb-4">Análise por Setor</h1>
                    <p class="text-gray-700 mb-6">Selecione um setor para visualizar as análises detalhadas.</p>

                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <div class="bg-white p-6 rounded-lg shadow-md">
                            <h2 class="text-xl font-semibold mb-2">Saúde</h2>
                            <p class="text-gray-700">Análises de dados de saúde pública, hospitais e clínicas.</p>
                            <a href="#" class="mt-4 inline-block bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Ver Detalhes</a>
                        </div>
                        <div class="bg-white p-6 rounded-lg shadow-md">
                            <h2 class="text-xl font-semibold mb-2">Educação</h2>
                            <p class="text-gray-700">Análises de desempenho escolar, infraestrutura e programas educacionais.</p>
                            <a href="#" class="mt-4 inline-block bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Ver Detalhes</a>
                        </div>
                        <div class="bg-white p-6 rounded-lg shadow-md">
                            <h2 class="text-xl font-semibold mb-2">Transporte</h2>
                            <p class="text-gray-700">Análises de fluxo de tráfego, transporte público e infraestrutura viária.</p>
                            <a href="#" class="mt-4 inline-block bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Ver Detalhes</a>
                        </div>
                        <div class="bg-white p-6 rounded-lg shadow-md">
                            <h2 class="text-xl font-semibold mb-2">Segurança</h2>
                            <p class="text-gray-700">Análises de índices de criminalidade, policiamento e segurança urbana.</p>
                            <a href="#" class="mt-4 inline-block bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Ver Detalhes</a>
                        </div>
                        <div class="bg-white p-6 rounded-lg shadow-md">
                            <h2 class="text-xl font-semibold mb-2">Meio Ambiente</h2>
                            <p class="text-gray-700">Análises de qualidade do ar, gestão de resíduos e áreas verdes.</p>
                            <a href="#" class="mt-4 inline-block bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Ver Detalhes</a>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script>
        document.getElementById('menu-toggle').addEventListener('click', function() {
            document.querySelector('.w-64').classList.toggle('-translate-x-full');
        });

        document.getElementById('options-menu').addEventListener('click', function() {
            document.querySelector('[aria-labelledby="options-menu"]').classList.toggle('hidden');
        });
    </script>
</body>
</html>