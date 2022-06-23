<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.BeanObjeto" %><%--
  Created by IntelliJ IDEA.
  User: joels
  Date: 21/06/2022
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% ArrayList<BeanObjeto> listaObjetos = (ArrayList<BeanObjeto>) request.getAttribute("listaObjetos");%>

<html>
<!--Colocar como value: nombre de la presente página -->
<jsp:include page="/static/head.jsp">
    <jsp:param name="title" value="Menu Objetos"/>
</jsp:include>
<body>
<div class='container'>
    <!--Colocar como value: artistas, canciones, bandas, tours o tpc  (dependiendo de la pagina a la que corresponda) -->
    <jsp:include page="/includes/navbar.jsp">
        <jsp:param name="page" value="Objetos"/>
    </jsp:include>
    <div class="pb-5 pt-4 px-3 titlecolor d-flex justify-content-between align-items-center">
        <div class="col-lg-6">
            <h1 class='text-light'>Menu de Objetos</h1>
        </div>
    </div>
    <div class="tabla">
        <table class="table table-dark table-transparent table-hover">
            <thead>
            <tr>
                <th>NOMBRE</th>
                <th>PESO KG</th>
                <th>¿ES VACUNA?</th>
                <th></th>
                <th>OPCION</th>
            </tr>
            </thead>
            <tbody>

            <%for (BeanObjeto objeto:listaObjetos){ %>
            <tr>
                <td><%=objeto.getNombre()%></td>
                <td><%=objeto.getPeso()%></td>
                <td><%=objeto.getTipo()%></td>
                <% if (objeto.getTipo().equals("Si")) {%>
                    <td><a href="<%=request.getContextPath()%>/ObjetosServlet?a=verEfectividad&vacuna=<%=objeto.getNombre()%>"
                           class="btn btn-success">Efectividad</a>
                    </td>

                <%} else {%>
                    <td></td>
                <%}%>
                //EDICION
                <% if (objeto.getTipo().equals("Si")) {%>
                <td><a href="<%=request.getContextPath()%>/ObjetosServlet?a=editarVacuna&idObjeto=<%=objeto.getIdobjeto()%>"
                       class="btn btn-primary">Editar </a>
                </td>

                <%} else {%>
                <td><a href="<%=request.getContextPath()%>/ObjetosServlet?a=editarObjeto&idObjeto=<%=objeto.getIdobjeto()%>"
                       class="btn btn-primary">Editar </a>
                </td>
                <%}%>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        Añadir Objeto
    </button>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">
        Editar Objeto
    </button>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">¿Qué desea añadir?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <a href="<%=request.getContextPath()%>/ObjetosServlet?a=añadirObjeto" class="btn btn-success btn-lg">Objeto Normal</a>
                <a href="<%=request.getContextPath()%>/ObjetosServlet?a=añadirVacuna" class="btn btn-success btn-lg">Vacuna</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/static/scripts.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>