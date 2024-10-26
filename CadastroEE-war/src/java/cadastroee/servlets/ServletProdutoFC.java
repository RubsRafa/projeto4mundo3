/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cadastroee.servlets;

import cadastroee.controller.FacadeLocal;
import cadastroee.model.Produto;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author rubia
 */
public class ServletProdutoFC extends HttpServlet {

    @jakarta.ejb.EJB
    private FacadeLocal facade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acao = request.getParameter("acao");
        String destino = "/WEB-INF/ProdutoLista.jsp";
        
        if (acao == null) {
            acao = "listar";
        }
            
            switch (acao) {
                case "listar":
                    List<Produto> produtos = facade.findAll();
                    request.setAttribute("produtos", produtos);
                    destino = "/WEB-INF/ProdutoLista.jsp";
                    break;

                case "formIncluir":
                    destino = "/WEB-INF/ProdutoDados.jsp";
                    request.setAttribute("acao", "incluir");
                    break;

                case "incluir":
                    Produto novoProduto = new Produto();
                    novoProduto.setNome(request.getParameter("nome"));
                    novoProduto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
                    novoProduto.setPrecoVenda(Float.valueOf(request.getParameter("precoVenda")));
                    facade.createProduto(novoProduto);
                    request.setAttribute("produtos", facade.findAll());
                    destino = "/WEB-INF/ProdutoLista.jsp";
                    break;

                case "formAlterar":
                    int idAlterar = Integer.parseInt(request.getParameter("idProduto"));
                    Produto produto = facade.findByIdProduto(idAlterar);
                    request.setAttribute("produto", produto);
                    request.setAttribute("acao", "alterar");
                    destino = "/WEB-INF/ProdutoDados.jsp";
                    break;

                case "alterar":
                    int idProdutoAlterar = Integer.parseInt(request.getParameter("idProduto"));
                    Produto produtoAlterar = facade.findByIdProduto(idProdutoAlterar);
                    produtoAlterar.setNome(request.getParameter("nome"));
                    produtoAlterar.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
                    produtoAlterar.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));
                    facade.editProduto(produtoAlterar);
                    request.setAttribute("produtos", facade.findAll());
                    destino = "/WEB-INF/ProdutoLista.jsp";
                    break;

                case "excluir":
                    int idExcluir = Integer.parseInt(request.getParameter("idProduto"));
                    facade.removeProduto(facade.findByIdProduto(idExcluir));
                    request.setAttribute("produtos", facade.findAll());
                    destino = "/WEB-INF/ProdutoLista.jsp";
                    break;

                default:
                    destino = "/WEB-INF/ProdutoLista.jsp";
                    break;
        }
        
        RequestDispatcher rd = request.getRequestDispatcher(destino);
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
