<%-- 
    Document   : ProdutoLista
    Created on : Oct 25, 2024, 6:08:17 AM
    Author     : rubia
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Produtos</title>
    </head>
    <body>
        <h2>Lista de Produtos</h2>
        <a href="ServletProdutoFC?acao=formIncluir">
            <p>Incluir novo produto</p>
        </a>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Quantidade</th>
                    <th>Preço de Venda</th>
                    <th>Ação</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="produto" items="${requestScope.produtos}">
                    <tr>
                        <td>${produto.idProduto}</td>
                        <td>${produto.nome}</td>
                        <td>${produto.quantidade}</td>
                        <td>${produto.precoVenda}</td>
                        <td>
                            <a href="ServletProdutoFC?acao=formAlterar&idProduto=${produto.idProduto}">Alterar</a>
                            <a href="ServletProdutoFC?acao=excluir&idProduto=${produto.idProduto}">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
