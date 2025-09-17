🛠️ INSTRUÇÕES PARA EXECUTAR O PROJETO
PRÉ-REQUISITOS:
Java 11+
Apache Tomcat 9+
MySQL 8+
IDE (Eclipse/IntelliJ) — opcional

PASSO 1: CONFIGURAR O BANCO DE DADOS
Abra o MySQL (Workbench, CLI, DBeaver…).
Execute o script DB.sql (localizado na raiz do projeto).
Certifique-se de que o banco industria_sentinel foi criado e populado.

PASSO 2: CONFIGURAR CONEXÃO (SE NECESSÁRIO)
Abra:
src/main/java/br/com/helixforge/industriasentinel/util/DatabaseConnection.java

Verifique as credenciais:

java
private static final String URL = "jdbc:mysql://localhost:3306/industria_sentinel?useSSL=false&serverTimezone=UTC";
private static final String USER = "root";
private static final String PASSWORD = "root"; // ou "" se sem senha

PASSO 3: BUILD E DEPLOY
Opção A (via Maven no terminal):
bash
cd C:\Users\felly\OneDrive\Desktop\Programas\4POA_AP7
mvn clean package
Copie o .war gerado em target/ para webapps/ do seu Tomcat.

Opção B (via Eclipse):
Importe o projeto como “Existing Maven Project”.
Adicione o projeto ao servidor Tomcat.
Inicie o servidor.

PASSO 4: ACESSAR A APLICAÇÃO
URL:
👉 http://localhost:8080/4POA_AP7/login.jsp

Credenciais de teste:

Operador: oper_ana / 123
Supervisor: sup_joao / 123
Engenheiro: eng_maria / 123

FUNCIONALIDADES PARA TESTAR:
Login → Dashboard → Equipamentos → Alertas → Admin
Confirmação (ack) de alertas
Visualização de histórico de telemetria

✅ PRONTO PARA RODAR!