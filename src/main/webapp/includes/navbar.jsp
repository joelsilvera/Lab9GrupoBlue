<%--

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar sticky-top navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="<%=request.getContextPath()%>/listaServlet">Apocalipsis Zombie</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a style="font-weight: 1000;" class="nav-link <%=request.getParameter("page").equals("Humanos")? "active": "" %>" href="<%=request.getContextPath()%>/listaServlet?a=listarHumanos">Humanos</a>
            </li>
            <li class="nav-item">
                <a style="font-weight: 1000;" class="nav-link <%=request.getParameter("page").equals("Supervivientes")? "active": "" %>" href="<%=request.getContextPath()%>/listaServlet?a=listarSupervivientes">Supervivientes</a>
            </li>
            <li class="nav-item">
                <a style="font-weight: 1000;" class="nav-link <%=request.getParameter("page").equals("Zombies")? "active": "" %>" href="<%=request.getContextPath()%>/listaServlet?a=listarZombie">Zombies</a>
            </li>
            <li class="nav-item">
                <a style="font-weight: 1000;" class="nav-link <%=request.getParameter("page").equals("Virus")? "active": "" %>" href="<%=request.getContextPath()%>/listaServlet?a=listarVariante">Virus</a>
            </li>
            <li class="nav-item">
                <a style="font-weight: 1000;" class="nav-link <%=request.getParameter("page").equals("Objetos")? "active": "" %>" href="<%=request.getContextPath()%>/ObjetosServlet">Objetos</a>
            </li>
            <li class="nav-item">
                <a style="font-weight: 1000;" class="nav-link <%=request.getParameter("page").equals("Caceria")? "active": "" %>" href="<%=request.getContextPath()%>/listaServlet?a=caceria">Caceria</a>
            </li>

        </ul>
    </div>
</nav>