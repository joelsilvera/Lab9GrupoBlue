<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 22/06/2022
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.BeanZombie" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% ArrayList<BeanZombie> listaZombie = (ArrayList<BeanZombie>) request.getAttribute("lista");%>

<html>

<jsp:include page="/static/head.jsp">
    <jsp:param name="title" value="Menu Zombie"/>
</jsp:include>
<body>
<div class='container'>

    <jsp:include page="/includes/navbar.jsp">
        <jsp:param name="page" value="Zombie"/>
    </jsp:include>
    <div class="pb-5 pt-4 px-3 titlecolor d-flex justify-content-between align-items-center">
        <div class="col-lg-6">
            <h1 class='text-light'>Menu de Zombies</h1>
        </div>

    </div>
    <div class="tabla">
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
            Añadir Zombie
        </button>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Añadir Zombie</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary">Añadir</button>
                    </div>
                </div>
            </div>
        </div>
        <p> </p>
        <table class="table table-dark table-transparent table-hover">
            <thead>
            <tr>
                <th># DE IDENTIF.</th>
                <th>NOMBRE</th>
                <th>SEXO</th>
                <th></th>
                <th>TIEMPO INFECTADO</th>
                <th></th>
                <th>VARIANTE DE VIRUS</th>
                <th></th>
                <th>N° DE VICTIMAS</th>
                <th>TIPO</th>
                <th> </th>

                <th> </th>
            </tr>
            </thead>
            <tbody>
            <%for (BeanZombie zombie : listaZombie){ %>
            <tr>
                <td><%=zombie.getIdZombie()%></td>
                <td><%=zombie.getNombre()%> <%=zombie.getApellido()%></td>
                <td><%=zombie.getSexo()%></td>
                <td></td>
                <td><%=zombie.getTiempoInfectado()%></td>
                <td></td>
                <td><%=zombie.getVarianteVirus()%> </td>
                <td></td>
                <td><%=zombie.getVictimas()%> </td>

                <td><%=zombie.getTipo()%> </td>
                <td></td>


            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="/static/scripts.jsp"/>
</body>
</html>

