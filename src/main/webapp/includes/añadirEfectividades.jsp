<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.BeanVacunaxtipo" %><%--
  Created by IntelliJ IDEA.
  User: joels
  Date: 21/06/2022
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% ArrayList<BeanVacunaxtipo> listaTiposzombie = (ArrayList<BeanVacunaxtipo>) request.getAttribute("listaTiposzombie");%>
<% String message = (String) request.getAttribute("message");%>
<% int idVacuna = (int) request.getAttribute("idVacuna");%>

<html>
<!--Colocar como value: nombre de la presente página -->
<jsp:include page="/static/head.jsp">
    <jsp:param name="title" value="Add Efectividades"/>
</jsp:include>
<body>
<div class='container'>
    <!--Colocar como value: artistas, canciones, bandas, tours o tpc  (dependiendo de la pagina a la que corresponda) -->
    <jsp:include page="/includes/navbar.jsp">
        <jsp:param name="page" value="Vacunas"/>
    </jsp:include>
    <div class="pb-5 pt-4 px-3 titlecolor d-flex justify-content-between align-items-center">
        <div class="col-lg-6">
            <h1 class='text-light'>Añadir un Efectividades</h1>
        </div>
    </div>
    <div class="tabla">
        <div class='container'>
            <div class="row mb-4">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <table class="table table-dark table-transparent table-hover">
                        <thead>
                        <tr>
                            <th>NOMBRE</th>
                            <th>PESO KG</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%  int i = 1;
                            for (BeanVacunaxtipo vacunaxtipo:listaTiposzombie){ %>
                        <tr>
                            <td><%=vacunaxtipo.getTipozombie()%></td>
                            <form method="POST" action="<%=request.getContextPath()%>/ObjetosServlet?a=setEfectividad&idVacuna=<%=idVacuna%>&idZombie=<%=i%>">
                            <td><label for="porcentaje" class="form-label text-light">Porcentaje</label>
                                <input type="text" class="form-control" name="porcentaje" id="porcentaje"></td>
                            <td><button type="submit" class="btn btn-success">Añadir Efectividad</button>
                            </td>
                            <td></td>
                            <%i++;
                            }%>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/static/scripts.jsp"/>
</body>
</html>