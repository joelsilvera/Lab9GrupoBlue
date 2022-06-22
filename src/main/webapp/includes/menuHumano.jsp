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
        <jsp:param name="title" value="Menu Humanos"/>
    </jsp:include>
    <body>
        <div class='container'>
            <!--Colocar como value: artistas, canciones, bandas, tours o tpc  (dependiendo de la pagina a la que corresponda) -->
            <jsp:include page="/includes/navbar.jsp">
                <jsp:param name="page" value="Humanos"/>
            </jsp:include>
            <div class="pb-5 pt-4 px-3 titlecolor d-flex justify-content-between align-items-center">
                <div class="col-lg-6">
                    <h1 class='text-light'>Menu de Humanos</h1>
                </div>
            </div>
            <div class="tabla">
                <table class="table table-dark table-transparent table-hover">
                    <thead>
                        <tr>
                            <th># DE IDENTIFICACIÓN</th>
                            <th>NOMBRE</th>
                            <th>SEXO</th>
                            <th>ESTADO</th>
                        </tr>
                    </thead>
                    <tbody>

                    <%for (BeanHumano humano : listaHumano){ %>
                        <tr>
                            <td><%=humano.getIdHumano()%></td>
                            <td><%=humano.getNombreHumano()%> <%=humano.getApellidoHumano()%></td>
                            <td><%=humano.getSexoHumano()%></td>
                            <td><%=humano.getEstadoHumano()%></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>
        <jsp:include page="/static/scripts.jsp"/>
    </body>
</html>
