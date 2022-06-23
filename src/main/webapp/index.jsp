<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!--Colocar como value: nombre de la presente página -->
<jsp:include page="/static/head.jsp">
    <jsp:param name="title" value="Apocalipsis Zombie"/>
</jsp:include>

<head>
    <STYLE TYPE="text/css">
        .apocalipsis{
            position: absolute;
            top: 69%;
            left: 50%;
            transform: translate(-10%, -94%);

            font-family: fantasy;
            font-size: 650%;
            font-weight: 900;
        }
        .videojueg{
            position: absolute;
            top: 20%;
            left: 70%;
            transform: translate(-40%,-10%);
            color: #FF3333;
            font-family: fantasy;
            font-size: 300%;
            font-weight: 900;
        }
    </STYLE>
</head>

<body>
<div class='container'>
    <!--Colocar como value: artistas, canciones, bandas, tours o tpc  (dependiendo de la pagina a la que corresponda) -->
    <jsp:include page="/includes/navbar.jsp">
        <jsp:param name="page" value=""/>
    </jsp:include>

    <div class="tabla">
        <video width="1080" height="685"
               src="Zombie_Y.mp4" muted autoplay loop></video>
        <div class="apocalipsis">APOCALIPSIS<br>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp ZOMBIE</div>
        <div class="videojueg">EL VIDEOJUEGO</div>

    </div>
</div>
<jsp:include page="/static/scripts.jsp"/>
</body>
</html>