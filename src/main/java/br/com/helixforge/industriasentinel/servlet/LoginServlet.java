package br.com.helixforge.industriasentinel.servlet;

import br.com.helixforge.industriasentinel.dao.UsuarioDAO;
import br.com.helixforge.industriasentinel.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UsuarioDAO usuarioDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        usuarioDAO = new UsuarioDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Usuario usuario = usuarioDAO.autenticar(email, senha);

        if (usuario != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogado", usuario);
            response.sendRedirect(request.getContextPath() + "/dashboard");
        } else {
            request.setAttribute("mensagemErro", "Credenciais inválidas. Tente novamente.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}