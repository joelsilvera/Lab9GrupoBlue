<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 22/06/2022
  Time: 23:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="Beans.BeanSuperviviente" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.BeanZombie" %><%--
  Created by IntelliJ IDEA.
  User: victor
  Date: 22/06/2022
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% ArrayList<BeanSuperviviente> listaSuperviviente = (ArrayList<BeanSuperviviente>) request.getAttribute("listaSupervivientes");%>
<% ArrayList<BeanZombie> listaZombies = (ArrayList<BeanZombie>) request.getAttribute("listaZombies");%>

<html>
<!--Colocar como value: nombre de la presente página -->
<jsp:include page="/static/head.jsp">
    <jsp:param name="title" value="CACERIA"/>
</jsp:include>
<body>
<div class='container'>
    <!--Colocar como value: artistas, canciones, bandas, tours o tpc  (dependiendo de la pagina a la que corresponda) -->
    <jsp:include page="/includes/navbar.jsp">
        <jsp:param name="page" value="CACERIA"/>
    </jsp:include>
    <div class="pb-5 pt-4 px-3 titlecolor d-flex justify-content-between align-items-center">
        <div class="col-lg-6">
            <h1 class='text-light'>CACERIA</h1>
        </div>
    </div>
    <div class="tabla">
        <div class='container'>
            <div class="row mb-4">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <form method="POST" action="listaServlet?action=ataque">
                        <div class="form-group">
                            <label for="Superviviente" class="form-label text-light">Superviviente</label>
                            <select name="Superviviente" id="Superviviente" class="form-control">
                                <% for(BeanSuperviviente superviviente: listaSuperviviente) { %>
                                <option value="<%=superviviente.getIdSuperviviente()%>"><%=superviviente.getNombre() + " " + superviviente.getApellido()%></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="Zombies" class="form-label text-light">Zombies</label>
                            <select name="Zombies" id="Zombies" class="form-control">
                                <% for(BeanZombie zombie: listaZombies) { %>
                                <option value="<%=zombie.getIdZombie()%>"><%=zombie.getNombre() + " " + zombie.getApellido()%></option>
                                <% } %>
                            </select>
                        </div>
                        <a href="<%= request.getContextPath()%>/listaServlet" class="btn btn-warning">Cancelar</a>
                        <input type="submit" value="ATACAR" class="btn btn-danger"/>
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