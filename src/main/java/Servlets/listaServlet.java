package Servlets;

import Beans.BeanHumano;
import Beans.BeanSuperviviente;
import Beans.BeanVariante;
import Beans.BeanZombie;
import Daos.DaoPrincipal;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "listaServlet", value = "/listaServlet")
public class listaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "inicio" : request.getParameter("a");
        DaoPrincipal daoPrincipal = new DaoPrincipal();
        switch (action){
            case "inicio" -> {
                RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
                view.forward(request, response);
            }
            case "listarHumanos" -> {
                ArrayList<BeanHumano> listaHumanos = daoPrincipal.listarHumano();
                request.setAttribute("lista",listaHumanos);
                RequestDispatcher view = request.getRequestDispatcher("/includes/menuHumano.jsp");
                view.forward(request, response);
            }
            case "listarSupervivientes" -> {
                ArrayList<BeanSuperviviente> listaSupervivientes = daoPrincipal.listarSuperviviente();
                request.setAttribute("lista",listaSupervivientes);
                RequestDispatcher view = request.getRequestDispatcher("/includes/menuSuperviviente.jsp");
                view.forward(request, response);
            }
            case "agregarSuperviviente" -> {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/includes/agregarSuperviviente.jsp");
                requestDispatcher.forward(request, response);
            }
            case "borrarSup" -> {
                String id1 = request.getParameter("id1");
                String id2 = request.getParameter("id2");
                daoPrincipal.borrar(id1, Integer.parseInt(id2));

                response.sendRedirect(request.getContextPath() + "/listaServlet?a=listarSupervivientes");
            }
            case "listarVariante" -> {
                ArrayList<BeanVariante> listaVariante = daoPrincipal.listarVariante();
                request.setAttribute("lista",listaVariante);
                RequestDispatcher view = request.getRequestDispatcher("/includes/menuVariante.jsp");
                view.forward(request, response);
            }
            case "borrar" -> {
                String id = request.getParameter("id");
                daoPrincipal.borrarVariante(id);
                response.sendRedirect(request.getContextPath() + "/listaServlet?a=listarVariante");
            }
            case "listarZombie" -> {
                ArrayList<BeanZombie> listaZombie = daoPrincipal.listarZombie();
                request.setAttribute("lista",listaZombie);
                RequestDispatcher view = request.getRequestDispatcher("/includes/menuZombie.jsp");
                view.forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "inicio" : request.getParameter("a");
        DaoPrincipal daoPrincipal = new DaoPrincipal();
        switch (action) {

            case "buscar" -> {
                String textoBuscar = request.getParameter("textoBuscar");
                request.setAttribute("lista", daoPrincipal.buscarPorSexo(textoBuscar));

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("includes/menuSuperviviente.jsp");
                requestDispatcher.forward(request, response);
            }

            case "nuevavariante" -> {
                BeanVariante bPerfil = new BeanVariante();

            }

            case "ataque" -> {
                BeanSuperviviente superviviente = new BeanSuperviviente();
                superviviente.setIdSuperviviente(request.getParameter("Supervivientes"));
                BeanZombie zombie = new BeanZombie();
                zombie.setIdZombie(request.getParameter("Zombies"));

                //hallar vacunas del superviviente



            }
        }
    }

}
