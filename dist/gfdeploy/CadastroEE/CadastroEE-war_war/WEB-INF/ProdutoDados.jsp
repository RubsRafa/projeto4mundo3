<%-- 
    Document   : ProdutoDados
    Created on : Oct 25, 2024, 6:22:43 AM
    Author     : rubia
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dados do Produto</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body class="container">
        <h1>
            Dados do produto
        </h1>

        <form action="ServletProdutoFC" method="POST" class="form">
            <input type="hidden" name="acao" value="<c:choose><c:when test="${produto != null}">alterar</c:when><c:otherwise>incluir</c:otherwise></c:choose>">
            <c:if test="${produto != null}">
                <input type="hidden" name="idProduto" value="${produto.idProduto}">
            </c:if>
            <div class="mb-3">
                    <h7 class="form-label">Nome:</h7> <input class="form-control" type="text" name="nome" value="${produto.nome != null ? produto.nome : ''}" required><br>
            </div>
            <div class="mb-3">
                <h7 class="form-label">Quantidade:</h7> <input class="form-control" type="number" name="quantidade" value="${produto.quantidade != null ? produto.quantidade : ''}" required><br>
            </div>
            <div class="mb-3">
                <h7 class="form-label">Preço de Venda:</h7> <input class="form-control" type="number" step="0.01" name="precoVenda" value="${produto.precoVenda != null ? produto.precoVenda : ''}" required><br>
            </div>

            <input class="btn btn-primary" type="submit" value="<c:choose><c:when test="${produto != null}">Alterar produto</c:when><c:otherwise>Incluir produto</c:otherwise></c:choose>">
        </form>

        <br>
        <a href="ServletProdutoFC?acao=listar" class="btn btn-primary m-2">Voltar para a lista de produtos</a>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
