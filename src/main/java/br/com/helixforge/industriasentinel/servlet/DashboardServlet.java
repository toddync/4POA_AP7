package br.com.helixforge.industriasentinel.servlet;

import br.com.helixforge.industriasentinel.dao.AlertaDAO;
import br.com.helixforge.industriasentinel.dao.EquipamentoDAO;
import br.com.helixforge.industriasentinel.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private EquipamentoDAO equipamentoDAO;
    private AlertaDAO alertaDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        equipamentoDAO = new EquipamentoDAO();
        alertaDAO = new AlertaDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        if (usuarioLogado == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            int totalEquipamentos = equipamentoDAO.countAll();
            int alertasRecentes = alertaDAO.countRecentAlerts();

            request.setAttribute("totalEquipamentos", totalEquipamentos);
            request.setAttribute("alertasRecentes", alertasRecentes);

            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("mensagemErro", "Erro ao carregar dados do dashboard.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}