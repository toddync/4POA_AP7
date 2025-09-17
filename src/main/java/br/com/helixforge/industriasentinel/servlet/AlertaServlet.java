package br.com.helixforge.industriasentinel.servlet;

import br.com.helixforge.industriasentinel.dao.AlertaDAO;
import br.com.helixforge.industriasentinel.model.Alerta;
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

@WebServlet("/alerta")
public class AlertaServlet extends HttpServlet {

    private AlertaDAO alertaDAO;

    @Override
    public void init() throws ServletException {
        super.init();
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
            List<Alerta> alertas = alertaDAO.findAll();
            request.setAttribute("alertas", alertas);
            request.getRequestDispatcher("alertas.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("mensagemErro", "Erro ao carregar lista de alertas.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        if (usuarioLogado == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String acao = request.getParameter("acao");
        String idAlertaParam = request.getParameter("idAlerta");

        if ("confirmar".equals(acao) && idAlertaParam != null && !idAlertaParam.isEmpty()) {
            try {
                int idAlerta = Integer.parseInt(idAlertaParam);
                Integer usuarioAckId = usuarioLogado.getId(); // O usuário logado confirma o alerta

                alertaDAO.updateStatusAndUserAck(idAlerta, "CONFIRMADO", usuarioAckId);
                request.getSession().setAttribute("mensagemSucesso", "Alerta confirmado com sucesso!");
            } catch (SQLException | NumberFormatException e) {
                e.printStackTrace();
                request.getSession().setAttribute("mensagemErro", "Erro ao confirmar alerta: " + e.getMessage());
            }
        } else {
            request.getSession().setAttribute("mensagemErro", "Ação inválida ou parâmetros ausentes para confirmar alerta.");
        }
        response.sendRedirect(request.getContextPath() + "/alerta");
    }
}