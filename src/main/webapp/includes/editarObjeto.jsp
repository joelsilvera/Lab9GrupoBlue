<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: joels
  Date: 21/06/2022
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% String idObjeto = (String) request.getAttribute("idObjeto");%>

<html>
<!--Colocar como value: nombre de la presente página -->
<jsp:include page="/static/head.jsp">
    <jsp:param name="title" value="Editar Objeto"/>
</jsp:include>
<body>
<div class='container'>
    <!--Colocar como value: artistas, canciones, bandas, tours o tpc  (dependiendo de la pagina a la que corresponda) -->
    <jsp:include page="/includes/navbar.jsp">
        <jsp:param name="page" value="Objetos"/>
    </jsp:include>
    <div class="pb-5 pt-4 px-3 titlecolor d-flex justify-content-between align-items-center">
        <div class="col-lg-6">
            <h1 class='text-light'>Editar Objeto</h1>
        </div>
    </div>
    <div class="tabla">
        <div class='container'>
            <div class="row mb-4">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <form method="POST" action="<%=request.getContextPath()%>/ObjetosServlet?a=actualizarObjeto&esVacuna=No&idObjeto=<%=idObjeto%>">
                        <div class="mb-3">
                            <label for="nombreObjeto" class="form-label text-light">Nombre</label>
                            <input type="text" class="form-control" name="nombreObjeto" id="nombreObjeto">
                        </div>
                        <div class="mb-3">
                            <label for="masa" class="form-label text-light">Masa [Kg]</label>
                            <input type="text" class="form-control" name="masa" id="masa">
                        </div>
                        <a href="<%=request.getContextPath()%>/ObjetosServlet" class="btn btn-secondary">Regresar</a>
                        <button type="submit" class="btn btn-success">Actualizar</button>
                    </form>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/static/scripts.jsp"/>
</body>
</html>