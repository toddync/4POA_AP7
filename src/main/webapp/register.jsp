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
		<div
			class="bg-white dark:bg-gray-800 shadow-md rounded-xl overflow-hidden mb-8">
			<!-- Cabeçalho do formulário -->
			<div
				class="bg-indigo-50 dark:bg-indigo-900/30 px-6 py-4 border-b border-indigo-100 dark:border-indigo-800/50">
				<h2
					class="text-xl font-semibold text-indigo-700 dark:text-indigo-300 flex items-center">
					<i class="fas fa-user-plus mr-2"></i> Register New Student
				</h2>
				<p class="text-sm text-indigo-500 dark:text-indigo-400">Fill in
					the details to register a new student</p>
			</div>

			<!-- Formulário de registro -->
			<div class="p-6">
				<form action="Register" method="post"
					class="grid grid-cols-1 md:grid-cols-2 gap-4">
					<div class="space-y-2">
						<label
							class="block text-sm font-medium text-gray-700 dark:text-gray-300">First
							Name</label> <input name="firstName" placeholder="First name" required
							class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 dark:bg-gray-700 dark:text-white transition-colors" />
					</div>

					<div class="space-y-2">
						<label
							class="block text-sm font-medium text-gray-700 dark:text-gray-300">Last
							Name</label> <input name="lastName" placeholder="Last name" required
							class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 dark:bg-gray-700 dark:text-white transition-colors" />
					</div>

					<div class="space-y-2">
						<label
							class="block text-sm font-medium text-gray-700 dark:text-gray-300">Date
							of Birth</label> <input type="date" name="dateOfBirth"
							placeholder="Date of birth" required
							class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 dark:bg-gray-700 dark:text-white transition-colors" />
					</div>

					<div class="space-y-2">
						<label
							class="block text-sm font-medium text-gray-700 dark:text-gray-300">Gender</label>
						<select name="gender" required
							class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 dark:bg-gray-700 dark:text-white transition-colors">
							<option value="">Select gender</option>
							<option value="Male">Male</option>
							<option value="Female">Female</option>
							<option value="Other">Other</option>
						</select>
					</div>

					<div class="space-y-2">
						<label
							class="block text-sm font-medium text-gray-700 dark:text-gray-300">Email</label>
						<input type="email" name="email" placeholder="Email" required
							class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 dark:bg-gray-700 dark:text-white transition-colors" />
					</div>

					<div class="space-y-2">
						<label
							class="block text-sm font-medium text-gray-700 dark:text-gray-300">Phone</label>
						<input name="phone" placeholder="Phone"
							class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 dark:bg-gray-700 dark:text-white transition-colors" />
					</div>

					<div class="space-y-2 md:col-span-2">
						<label
							class="block text-sm font-medium text-gray-700 dark:text-gray-300">Address</label>
						<input name="address" placeholder="Address"
							class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 dark:bg-gray-700 dark:text-white transition-colors" />
					</div>

					<div class="space-y-2">
						<label
							class="block text-sm font-medium text-gray-700 dark:text-gray-300">Enrollment
							Date</label> <input type="date" name="enrollmentDate"
							placeholder="Enrollment date"
							class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 dark:bg-gray-700 dark:text-white transition-colors" />
					</div>

					<div class="space-y-2">
						<label
							class="block text-sm font-medium text-gray-700 dark:text-gray-300">Program</label>
						<input name="program" placeholder="Program" required
							class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 dark:bg-gray-700 dark:text-white transition-colors" />
					</div>

					<div class="space-y-2">
						<label
							class="block text-sm font-medium text-gray-700 dark:text-gray-300">Year
							of Study</label> <input type="number" name="yearOfStudy" min="1" max="10"
							placeholder="Year of study"
							class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 dark:bg-gray-700 dark:text-white transition-colors" />
					</div>

					<div class="space-y-2">
						<label
							class="block text-sm font-medium text-gray-700 dark:text-gray-300">Status</label>
						<select name="status"
							class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 dark:bg-gray-700 dark:text-white transition-colors">
							<option value="Active">Active</option>
							<option value="Graduated">Graduated</option>
							<option value="Suspended">Suspended</option>
							<option value="Dropped">Dropped</option>
						</select>
					</div>

					<div class="md:col-span-2 pt-4">
						<button type="submit"
							class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-medium py-3 px-4 rounded-lg flex items-center justify-center transition-colors">
							<i class="fas fa-user-plus mr-2"></i> Register Student
						</button>
					</div>
				</form>
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