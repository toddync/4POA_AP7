<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="model.Student"%>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- Tailwind CSS via CDN -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Fontes e ícones -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- Script para alternância de tema claro/escuro -->
<script>
	// Verificar preferência de tema ao carregar
	document.addEventListener('DOMContentLoaded', function() {
		if (localStorage.theme === 'dark'
				|| (!('theme' in localStorage) && window
						.matchMedia('(prefers-color-scheme: dark)').matches)) {
			document.documentElement.classList.add('dark');
		} else {
			document.documentElement.classList.remove('dark');
		}
	});

	// Função para alternar tema
	function toggleTheme() {
		if (document.documentElement.classList.contains('dark')) {
			document.documentElement.classList.remove('dark');
			localStorage.theme = 'light';
		} else {
			document.documentElement.classList.add('dark');
			localStorage.theme = 'dark';
		}
	}
</script>

<style>
body {
	font-family: 'Inter', sans-serif;
}

/* Estilização customizada para inputs no modo escuro */
.dark input, .dark select, .dark textarea {
	background-color: #374151;
	color: #f3f4f6;
	border-color: #4b5563;
}

.dark input::placeholder, .dark select::placeholder, .dark textarea::placeholder
	{
	color: #9ca3af;
}

/* Transições suaves */
.transition-all {
	transition: all 0.3s ease;
}
</style>

<title>Student Management System</title>
</head>

<body
	class="bg-gray-100 dark:bg-gray-900 text-gray-800 dark:text-gray-200 min-h-screen transition-all">
	<!-- Cabeçalho -->
	<header
		class="bg-white dark:bg-gray-800 shadow-md rounded-lg p-4 mb-6 flex justify-between items-center">
		<div>
			<h1 class="text-2xl font-bold text-indigo-600 dark:text-indigo-400">
				<i class="fas fa-graduation-cap mr-2"></i>Student Management System
			</h1>
			<p class="text-sm text-gray-500 dark:text-gray-400">Manage
				student records efficiently</p>
		</div>
		<button onclick="toggleTheme()"
			class="p-2 rounded-full bg-gray-200 dark:bg-gray-700 hover:bg-gray-300 dark:hover:bg-gray-600">
			<i class="fas fa-moon dark:hidden"></i> <i
				class="fas fa-sun hidden dark:block"></i>
		</button>
	</header>

	<div class="container mx-auto px-4">
		<!-- Lista de estudantes -->
		<div
			class="bg-white dark:bg-gray-800 shadow-md rounded-xl overflow-hidden">
			<!-- Cabeçalho da tabela -->
			<div
				class="bg-indigo-50 dark:bg-indigo-900/30 px-6 py-4 border-b border-indigo-100 dark:border-indigo-800/50 flex justify-between items-center">
				<div>
					<h2
						class="text-xl font-semibold text-indigo-700 dark:text-indigo-300 flex items-center">
						<i class="fas fa-users mr-2"></i> Student Records
					</h2>
					<p class="text-sm text-indigo-500 dark:text-indigo-400">List of
						all registered students</p>
				</div>
				<div class="relative">
					<a href="<%=request.getContextPath()%>/Register"
						class="text-red-600 hover:text-red-900 dark:text-red-400 dark:hover:text-lime-400 px-3 py-1 rounded-md bg-indigo-600 text-white hover:bg-indigo-700 transition-colors">
						
							
							<i class="fas fa-plus"></i>
						
					</a>

				</div>
			</div>

			<div class="overflow-x-auto">
				<table
					class="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
					<thead class="bg-gray-50 dark:bg-gray-700">
						<tr>
							<th scope="col"
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-300 uppercase tracking-wider">ID</th>
							<th scope="col"
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-300 uppercase tracking-wider">Name</th>
							<th scope="col"
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-300 uppercase tracking-wider">Email</th>
							<th scope="col"
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-300 uppercase tracking-wider">Program</th>
							<th scope="col"
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-300 uppercase tracking-wider">Status</th>
							<th scope="col"
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-300 uppercase tracking-wider">Actions</th>
						</tr>
					</thead>
					<tbody
						class="bg-white dark:bg-gray-800 divide-y divide-gray-200 dark:divide-gray-700">
						<%
						List<Student> students = (List<Student>) request.getAttribute("students");
						if (students != null && !students.isEmpty()) {
							for (Student s : students) {
								String statusColor = "";
								if ("Active".equals(s.getStatus()))
							statusColor = "bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300";
								else if ("Graduated".equals(s.getStatus()))
							statusColor = "bg-blue-100 text-blue-800 dark:bg-blue-900/30 dark:text-blue-300";
								else if ("Suspended".equals(s.getStatus()))
							statusColor = "bg-yellow-100 text-yellow-800 dark:bg-yellow-900/30 dark:text-yellow-300";
								else if ("Dropped".equals(s.getStatus()))
							statusColor = "bg-red-100 text-red-800 dark:bg-red-900/30 dark:text-red-300";
						%>
						<tr
							class="hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors">
							<td
								class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-white"><%=s.getStudentId()%></td>
							<td
								class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-white">
								<div class="flex items-center">
									<div class="h-10 w-10 flex-shrink-0">
										<img class="h-10 w-10 rounded-full object-cover"
											src="https://ui-avatars.com/api/?name=<%=s.getFirstName()%>+<%=s.getLastName()%>&background=6366f1&color=fff"
											alt="">
									</div>
									<div class="ml-4">
										<div class="font-medium text-gray-900 dark:text-white"><%=s.getFirstName() + " " + s.getLastName()%></div>
									</div>
								</div>
							</td>
							<td
								class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 dark:text-gray-400"><%=s.getEmail()%></td>
							<td
								class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 dark:text-gray-400"><%=s.getProgram()%></td>
							<td class="px-6 py-4 whitespace-nowrap"><span
								class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full <%=statusColor%>">
									<%=s.getStatus()%>
							</span></td>
							<td
								class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
								<div class="flex space-x-2">
									<a
										href="<%=request.getContextPath()%>/Update?id=<%=s.getStudentId()%>"
										class="text-indigo-600 hover:text-indigo-900 dark:text-indigo-400 dark:hover:text-indigo-300"><i
										class="fas fa-edit"></i></a> <a
										href="<%=request.getContextPath()%>/Delete?id=<%=s.getStudentId()%>"
										class="text-red-600 hover:text-red-900 dark:text-red-400 dark:hover:text-red-300"><i
										class="fas fa-trash"></i></a>
								</div>
							</td>
						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td colspan="6" class="px-6 py-8 text-center">
								<div
									class="flex flex-col items-center justify-center text-gray-400 dark:text-gray-500">
									<i class="fas fa-user-slash text-4xl mb-3"></i>
									<p class="text-lg font-medium">No students found</p>
									<p class="text-sm">Register a new student to get started</p>
								</div>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>

			<!-- Rodapé da tabela -->
			<div
				class="bg-gray-50 dark:bg-gray-700 px-6 py-4 border-t border-gray-200 dark:border-gray-600 flex items-center justify-between">
				<div class="text-sm text-gray-500 dark:text-gray-400">
					Showing <span class="font-medium">1</span> to <span
						class="font-medium">10</span> of <span class="font-medium"><%=students != null ? students.size() : 0%></span>
					results
				</div>
				<div class="flex space-x-2">
					<button
						class="px-3 py-1 rounded-md bg-gray-200 dark:bg-gray-600 text-gray-700 dark:text-gray-300 hover:bg-gray-300 dark:hover:bg-gray-500 transition-colors">
						Previous</button>
					<button
						class="px-3 py-1 rounded-md bg-indigo-600 text-white hover:bg-indigo-700 transition-colors">
						1</button>
					<button
						class="px-3 py-1 rounded-md bg-gray-200 dark:bg-gray-600 text-gray-700 dark:text-gray-300 hover:bg-gray-300 dark:hover:bg-gray-500 transition-colors">
						Next</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Rodapé da página -->
	<footer
		class="mt-8 text-center text-sm text-gray-500 dark:text-gray-400 py-4">
		<p>© 2023 Student Management System. All rights reserved.</p>
	</footer>
</body>
</html>