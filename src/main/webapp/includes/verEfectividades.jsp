<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.BeanObjeto" %>
<%@ page import="Beans.BeanVacunaxtipo" %>
<%@ page import="Beans.BeanSuperviviente" %><%--
  Created by IntelliJ IDEA.
  User: joels
  Date: 21/06/2022
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% ArrayList<BeanVacunaxtipo> listaEfectividades = (ArrayList<BeanVacunaxtipo>) request.getAttribute("listaEfectividades");%>

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
            <h1 class='text-light'><%=listaEfectividades.get(1).getNombre()%></h1>
        </div>
    </div>
    <div class="tabla">
        <table class="table table-dark table-transparent table-hover">
            <thead>
            <tr>
                <th>ZOMBIE</th>
                <th>EFECTIVIDAD</th>
            </tr>
            </thead>
            <tbody>

            <%for (BeanVacunaxtipo vacunaxtipo:listaEfectividades){ %>
            <tr>
                <td><%=vacunaxtipo.getTipozombie()%></td>
                <td><%=vacunaxtipo.getPorcentaje()%></td>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="/static/scripts.jsp"/>
</body>
</html>