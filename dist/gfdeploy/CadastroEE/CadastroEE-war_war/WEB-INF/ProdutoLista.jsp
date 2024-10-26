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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body class="container">
        <h2>Lista de Produtos</h2>
        <a href="ServletProdutoFC?acao=formIncluir" class="btn btn-primary m-2">
            <p>Novo Produto</p>
        </a>

        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                    <th>#</th>
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
                                <a href="ServletProdutoFC?acao=formAlterar&idProduto=${produto.idProduto}" class="btn btn-primary btn-sm">
                                    Alterar
                                </a>
                                <a href="ServletProdutoFC?acao=excluir&idProduto=${produto.idProduto}" class="btn btn-danger btn-sm">
                                    Excluir
                                </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
