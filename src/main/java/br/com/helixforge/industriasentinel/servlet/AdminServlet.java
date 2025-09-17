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
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    private UsuarioDAO usuarioDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        usuarioDAO = new UsuarioDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        if (usuarioLogado == null || (!"ENGENHEIRO".equals(usuarioLogado.getRole()) && !"SUPERVISOR".equals(usuarioLogado.getRole()))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            List<Usuario> usuarios = usuarioDAO.findAll();
            request.setAttribute("usuarios", usuarios);
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("mensagemErro", "Erro ao carregar lista de usuários.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        if (usuarioLogado == null || (!"ENGENHEIRO".equals(usuarioLogado.getRole()) && !"SUPERVISOR".equals(usuarioLogado.getRole()))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String acao = request.getParameter("acao");
        String idParam = request.getParameter("id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {
            if ("adicionar".equals(acao)) {
                Usuario novoUsuario = new Usuario(0, username, password, role);
                usuarioDAO.insert(novoUsuario);
                request.getSession().setAttribute("mensagemSucesso", "Usuário adicionado com sucesso!");
            } else if ("editar".equals(acao) && idParam != null && !idParam.isEmpty()) {
                Usuario usuarioExistente = usuarioDAO.findById(Integer.parseInt(idParam));
                if (usuarioExistente != null) {
                    usuarioExistente.setUsername(username);
                    usuarioExistente.setPassword(password); // Em um cenário real, a senha deveria ser hash
                    usuarioExistente.setRole(role);
                    usuarioDAO.update(usuarioExistente);
                    request.getSession().setAttribute("mensagemSucesso", "Usuário atualizado com sucesso!");
                } else {
                    request.getSession().setAttribute("mensagemErro", "Usuário não encontrado para edição.");
                }
            } else if ("excluir".equals(acao) && idParam != null && !idParam.isEmpty()) {
                usuarioDAO.delete(Integer.parseInt(idParam));
                request.getSession().setAttribute("mensagemSucesso", "Usuário excluído com sucesso!");
            } else {
                request.getSession().setAttribute("mensagemErro", "Ação inválida ou parâmetros ausentes.");
            }
            response.sendRedirect(request.getContextPath() + "/admin");
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            request.getSession().setAttribute("mensagemErro", "Erro ao processar operação de usuário: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/admin");
        }
    }
}