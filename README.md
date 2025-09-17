A URL de entrada para a sua aplicação é:
[http://localhost:8080/4POA\_AP7/login.jsp](https://www.google.com/search?q=http://localhost:8080/4POA_AP7/login.jsp)

Aqui estão as instruções para fazer o projeto funcionar, com base no arquivo README fornecido:

### 🛠️ INSTRUÇÕES PARA EXECUTAR O PROJETO

**PRÉ-REQUISITOS:**

  * Java 11+
  * Apache Tomcat 9+
  * MySQL 8+
  * IDE (Eclipse/IntelliJ) — opcional

**PASSO 1: CONFIGURAR O BANCO DE DADOS**

1.  Abra o seu cliente MySQL (Workbench, CLI, DBeaver, etc.).
2.  Execute o script `DB.sql` que está na raiz do projeto.
3.  Certifique-se de que o banco de dados `industria_sentinel` foi criado e populado.

**PASSO 2: CONFIGURAR CONEXÃO (SE NECESSÁRIO)**

1.  Abra o arquivo: `src/main/java/br/com/helixforge/industriasentinel/util/DatabaseConnection.java`.
2.  Verifique as credenciais do banco de dados e ajuste se necessário:
    ```java
    private static final String URL = "jdbc:mysql://localhost:3306/industria_sentinel?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "root"; // ou "" se não houver senha
    ```

**PASSO 3: BUILD E DEPLOY**

  * **Opção A (via Maven no terminal):**

    1.  Navegue até a pasta do projeto: `cd C:\Users\felly\OneDrive\Desktop\Programas\4POA_AP7`
    2.  Execute o comando: `mvn clean package`
    3.  Copie o arquivo `.war` gerado na pasta `target/` para a pasta `webapps/` do seu Tomcat.

  * **Opção B (via Eclipse):**

    1.  Importe o projeto como “Existing Maven Project”.
    2.  Adicione o projeto ao seu servidor Tomcat configurado no Eclipse.
    3.  Inicie o servidor.

**PASSO 4: ACESSAR A APLICAÇÃO**

  * **URL:** [http://localhost:8080/4POA\_AP7/login.jsp](https://www.google.com/search?q=http://localhost:8080/4POA_AP7/login.jsp)
  * **Credenciais de teste:**
      * **Operador:** oper\_ana / 123
      * **Supervisor:** sup\_joao / 123
      * **Engenheiro:** eng\_maria / 123
