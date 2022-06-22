<%--

  NO TOCAR!


--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar sticky-top navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">Apocalipsis Zombie</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link <%=request.getParameter("page").equals("Humanos")? "active": "" %>" href="<%=request.getContextPath()%>/listaHumanos">Humanos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%=request.getParameter("page").equals("Supervivientes")? "active": "" %>" href="<%=request.getContextPath()%>/listaSupervivientes">Supervivientes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%=request.getParameter("page").equals("Zombies")? "active": "" %>" href="<%=request.getContextPath()%>/listaZombies">Zombies</a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%=request.getParameter("page").equals("Virus")? "active": "" %>" href="<%=request.getContextPath()%>/listaVirus">Virus</a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%=request.getParameter("page").equals("artistas")? "active": "" %>" href="<%=request.getContextPath()%>/listaArtistas">Artistas</a>
            </li>

        </ul>
    </div>
</nav>

