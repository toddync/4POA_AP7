package br.com.helixforge.industriasentinel.servlet;

import br.com.helixforge.industriasentinel.dao.EquipamentoDAO;
import br.com.helixforge.industriasentinel.model.Equipamento;
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

@WebServlet("/equipamento")
public class EquipamentoServlet extends HttpServlet {

    private EquipamentoDAO equipamentoDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        equipamentoDAO = new EquipamentoDAO();
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
            List<Equipamento> equipamentos = equipamentoDAO.findAll();
            request.setAttribute("equipamentos", equipamentos);
            request.getRequestDispatcher("equipamentos.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("mensagemErro", "Erro ao carregar lista de equipamentos.");
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
        String idParam = request.getParameter("id");
        String nome = request.getParameter("nome");
        String tipo = request.getParameter("tipo");
        String status = request.getParameter("status");
        String localizacao = request.getParameter("localizacao");

        Equipamento equipamento = new Equipamento();
        equipamento.setNome(nome);
        equipamento.setTipo(tipo);
        equipamento.setStatus(status);
        equipamento.setLocalizacao(localizacao);

        try {
            if ("adicionar".equals(acao)) {
                equipamentoDAO.insert(equipamento);
                request.getSession().setAttribute("mensagemSucesso", "Equipamento adicionado com sucesso!");
            } else if ("editar".equals(acao) && idParam != null && !idParam.isEmpty()) {
                equipamento.setId(Integer.parseInt(idParam));
                equipamentoDAO.update(equipamento);
                request.getSession().setAttribute("mensagemSucesso", "Equipamento atualizado com sucesso!");
            } else if ("excluir".equals(acao) && idParam != null && !idParam.isEmpty()) {
                equipamentoDAO.delete(Integer.parseInt(idParam));
                request.getSession().setAttribute("mensagemSucesso", "Equipamento excluído com sucesso!");
            } else {
                request.getSession().setAttribute("mensagemErro", "Ação inválida ou parâmetros ausentes.");
            }
            response.sendRedirect(request.getContextPath() + "/equipamento");
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            request.getSession().setAttribute("mensagemErro", "Erro ao processar operação de equipamento: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/equipamento");
        }
    }
}