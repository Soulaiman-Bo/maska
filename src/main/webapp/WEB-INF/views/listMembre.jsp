<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Membre List</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body>
<div class="container mt-5">
    <h2 class="mb-4">Membre List</h2>
    <table class="table table-bordered">
        <thead class="thead-light">
        <tr>
            <th>ID</th>
            <th>Numéro d'Adhésion</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Pièce d'Identification</th>
            <th>Nationalité</th>
            <th>Date d'Adhésion</th>
            <th>Date d'Expiration de Licence</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="membre" items="${list}">
            <tr>
                <td>${membre.id}</td>
                <td>${membre.numeroAdhesion}</td>
                <td>${membre.nom}</td>
                <td>${membre.prenom}</td>
                <td>${membre.pieceIdentification}</td>
                <td>${membre.nationalite}</td>
                <td>${membre.dateAdhesion}</td>
                <td>${membre.dateExpirationLicence}</td>
                <td class="d-flex justify-content-center align-items-center w-100">
                    <a href="${pageContext.request.contextPath}/membres/edit/${membre.id}" class="btn btn-warning btn-sm me-5">Edit</a>
                    <form action="${pageContext.request.contextPath}/delete" method="post">
                        <input type="hidden" name="id" value="${membre.id}" />
                        <input type="submit" value="Delete" class="btn btn-danger btn-sm" />
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/save" class="btn btn-primary">Add Membre</a>
</div>

<!-- Include Bootstrap JS (Optional) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>