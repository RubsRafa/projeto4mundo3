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
    </head>
    <body>
        <h1>
            <c:choose>
                <c:when test="${produto != null}">Alterar produto</c:when>
                <c:otherwise>Incluir novo produto</c:otherwise>
            </c:choose>
        </h1>

        <form action="ServletProdutoFC" method="POST">
            <input type="hidden" name="acao" value="<c:choose><c:when test="${produto != null}">alterar</c:when><c:otherwise>incluir</c:otherwise></c:choose>">
            <c:if test="${produto != null}">
                <input type="hidden" name="idProduto" value="${produto.idProduto}">
            </c:if>

            Nome: <input type="text" name="nome" value="${produto.nome != null ? produto.nome : ''}" required><br>
            Quantidade: <input type="number" name="quantidade" value="${produto.quantidade != null ? produto.quantidade : ''}" required><br>
            Preço de Venda: <input type="number" step="0.01" name="precoVenda" value="${produto.precoVenda != null ? produto.precoVenda : ''}" required><br>
            
            <input type="submit" value="<c:choose><c:when test="${produto != null}">Alterar</c:when><c:otherwise>Incluir</c:otherwise></c:choose>">
        </form>
        
        <br>
        <a href="ServletProdutoFC?acao=listar">Voltar para a lista de produtos</a>
    </body>
</html>
