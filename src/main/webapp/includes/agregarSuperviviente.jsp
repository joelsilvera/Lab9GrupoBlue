<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 22/06/2022
  Time: 23:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.BeanHumano" %><%--
  Created by IntelliJ IDEA.
  User: joels
  Date: 21/06/2022
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% ArrayList<BeanHumano> listaHumano = (ArrayList<BeanHumano>) request.getAttribute("lista");%>

<html>
<!--Colocar como value: nombre de la presente página -->
<jsp:include page="/static/head.jsp">
    <jsp:param name="title" value="Nuevo"/>
</jsp:include>
<body>
<div class='container'>
    <!--Colocar como value: artistas, canciones, bandas, tours o tpc  (dependiendo de la pagina a la que corresponda) -->
    <jsp:include page="/includes/navbar.jsp">
        <jsp:param name="page" value="Nuevo"/>
    </jsp:include>
    <div class="pb-5 pt-4 px-3 titlecolor d-flex justify-content-between align-items-center">
        <div class="col-lg-6">
            <h1 class='text-light'>Añadir nuevo superviviente</h1>
        </div>
    </div>
    <div class="tabla">
        <form method="POST" action="<%=request.getContextPath()%>/listaServlet?a=guardar">
            <div class="mb-3">
                <label style="color:white;font-weight: 400;" for="numIndetif" class="form-label">Numer de Identificación</label>
                <input type="text" class="form-control" name="numIndetif" id="numIndetif">
            </div>
            <div class="mb-3">
                <label style="color:white;font-weight: 400;" for="nombreSup" class="form-label">Nombre</label>
                <input type="text" class="form-control" name="nombreSup" id="nombreSup">
            </div>
            <div class="mb-3">
                <label style="color:white;font-weight: 400;" for="apellidoSup" class="form-label">Apellido</label>
                <input type="text" class="form-control" name="apellidoSup" id="apellidoSup">
            </div>
            <div class="mb-3">
                <label style="color:white;font-weight: 400;" for="sexo" class="form-label">Sexo (M o F)</label>
                <input type="text" class="form-control" name="sexo" id="sexo">
            </div>
            <div class="mb-3">
                <label style="color:white;font-weight: 400;" for="peso" class="form-label">Peso (Kg)</label>
                <input type="text" class="form-control" name="peso" id="peso">
            </div>
            <div class="mb-3">
                <label style="color:white;font-weight: 400;" for="fuerza" class="form-label">Fuerza (N)</label>
                <input type="text" class="form-control" name="fuerza" id="fuerza">
            </div>
            <div class="mb-3">
                <label style="color:white;font-weight: 400;" for="nombrePareja" class="form-label">Nombre de pareja</label>
                <input type="text" class="form-control" name="nombrePareja" id="nombrePareja">
            </div>
            <div class="mb-3">
                <label style="color:white;font-weight: 400;" for="apellidoPareja" class="form-label">Apellido de pareja</label>
                <input type="text" class="form-control" name="apellidoPareja" id="apellidoPareja">
            </div>
            <div class="mb-3">
                <label style="color:white;font-weight: 400;" for="objetos" class="form-label">Inventario de objetos</label>
                <input type="text" class="form-control" name="objetos" id="objetos">
            </div>
            <a href="<%=request.getContextPath()%>/listaServlet?a=listarSupervivientes" class="btn btn-danger">Regresar</a>
            <button type="submit" class="btn btn-warning">Guardar</button>
        </form>
    </div>
</div>
<jsp:include page="/static/scripts.jsp"/>
</body>
</html>