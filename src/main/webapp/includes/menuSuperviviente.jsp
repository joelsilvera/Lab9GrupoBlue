<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.BeanSuperviviente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="textoBuscar" scope="request" type="java.lang.String" class="java.lang.String" />

<% ArrayList<BeanSuperviviente> listaSuperviviente = (ArrayList<BeanSuperviviente>) request.getAttribute("lista");%>

<html>
<!--Colocar como value: nombre de la presente página -->
<jsp:include page="/static/head.jsp">
    <jsp:param name="title" value="Menu Supervivientes"/>
</jsp:include>
<body>
<div class='container'>
    <!--Colocar como value: artistas, canciones, bandas, tours o tpc  (dependiendo de la pagina a la que corresponda) -->
    <jsp:include page="/includes/navbar.jsp">
        <jsp:param name="page" value="Supervivientes"/>
    </jsp:include>
    <div class="pb-5 pt-4 px-3 titlecolor d-flex justify-content-between align-items-center">
        <div class="col-lg-6">
            <h1 class='text-light'>Menu de Supervivientes</h1>
        </div>

    </div>
    <div class="tabla">
        <form method="post" action="<%=request.getContextPath()%>/listaServlet?a=buscar">
            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Filtrar por sexo (Escriba M o F)"
                       aria-label="Filtrar por sexo" aria-describedby="button-addon2"
                       name="textoBuscar" value="<%=textoBuscar%>" />
                <button class="btn btn-warning" type="button" id="button-addon2">Filtrar</button>
            </div>
        </form>

        <a href="<%=request.getContextPath()%>/listaServlet?a=agregarSuperviviente" class="btn btn-warning ms-auto">Añadir superviviente</a>
        <p> </p>
        <table class="table table-dark table-transparent table-hover">
            <thead>
            <tr>
                <th># DE IDENTIF.</th>
                <th>NOMBRE</th>
                <th>SEXO</th>
                <th></th>
                <th>PESO</th>
                <th></th>
                <th>FUERZA</th>
                <th></th>
                <th>PAREJA</th>
                <th>PESO CARGADO</th>
                <th> </th>
                <th>OPCIONES</th>
                <th> </th>
            </tr>
            </thead>
            <tbody>
            <%for (BeanSuperviviente superviviente : listaSuperviviente){ %>
            <tr>
                <td><%=superviviente.getIdSuperviviente()%></td>
                <td><%=superviviente.getNombre()%> <%=superviviente.getApellido()%></td>
                <td><%=superviviente.getSexo()%></td>
                <td></td>
                <td><%=superviviente.getPeso()%> Kg</td>
                <td></td>
                <td><%=superviviente.getFuerza()%> N</td>
                <td></td>
                <%if(superviviente.getNombrePareja()==null){%>
                <td>-</td>
                <%}else{%>
                <td><%=superviviente.getNombrePareja()%> <%=superviviente.getApellidoPareja()%></td>
                <%}%>
                <td><%=superviviente.getPesoCargado()%> Kg</td>
                <td><a class="btn btn-warning ms-auto">Inventario</a></td>
                <td><a class="btn btn-warning ms-auto">Editar</a></td>
                <td><a href="<%=request.getContextPath()%>/listaServlet?a=borrarSup&id=<%=superviviente.getIdSuperviviente()%>
                                                                &id2=<%=superviviente.getIdInt()%>"
                       class="btn btn-danger ms-auto">Eliminar</a></td>


            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="/static/scripts.jsp"/>
</body>
</html>