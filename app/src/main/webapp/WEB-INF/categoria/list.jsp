<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Categorias</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">CRUD</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="/">Menu Principal</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/categoria/list">Categoria</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/plataforma/list">Plataforma</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/jogo/list">Jogo</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container">
            <h1>Categorias</h1>
            
            <a href="/categoria/insert" class="btn btn-primary">Nova Categoria</a>

            <table class="table">
                <tr>
                    <th>ID</th>
                    <th>NOME</th>
                    <th>&nbsp;</th>
                </tr>
                <c:forEach var="item" items="${categorias}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.nome}</td>
                        <td>
                            <a href="/categoria/update?id=${item.id}" class="btn btn-warning">Editar</a>
                            <a href="/categoria/delete?id=${item.id}" class="btn btn-danger">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>