<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 22/06/2022
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.BeanVariante" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% ArrayList<BeanVariante> listaVariante = (ArrayList<BeanVariante>) request.getAttribute("lista");%>

<html>
<!--Colocar como value: nombre de la presente página -->
<jsp:include page="/static/head.jsp">
    <jsp:param name="title" value="Menu Virus"/>
</jsp:include>
<body>
<div class='container'>
    <!--Colocar como value: artistas, canciones, bandas, tours o tpc  (dependiendo de la pagina a la que corresponda) -->
    <jsp:include page="/includes/navbar.jsp">
        <jsp:param name="page" value="Virus"/>
    </jsp:include>
    <div class="pb-5 pt-4 px-3 titlecolor d-flex justify-content-between align-items-center">
        <div class="col-lg-6">
            <h1 class='text-light'>Menu de Virus</h1>
        </div>

    </div>
    <div class="tabla">
        <a class="btn btn-warning ms-auto">Añadir variante</a>
        <p> </p>
        <table class="table table-dark table-transparent table-hover">
            <thead>
            <tr>
                <th>ID DEL VIRUS</th>
                <th>NOMBRE DEL VIRUS</th>
                <th>ID DE LA VARIANTE</th>
                <th></th>
                <th>NOMBRE DE LA VARIANTE</th>
                <th></th>
                <th>NÚMERO DE CASOS</th>

                <th> </th>
                <th>BORRAR VARIANTE</th>
                <th> </th>
            </tr>
            </thead>
            <tbody>
            <%for (BeanVariante variante : listaVariante){ %>
            <tr>
                <td><%=variante.getIdVirus()%></td>
                <td><%=variante.getNombreVirus()%> </td>
                <td><%=variante.getIdVirus()%></td>
                <td></td>
                <td><%=variante.getNombreVariante()%> Kg</td>
                <td></td>
                <td><%=variante.getCasos()%> N</td>
                <td></td>

                <td><a class="btn btn-danger ms-auto">Borrar</a></td>


            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="/static/scripts.jsp"/>
</body>
</html>


