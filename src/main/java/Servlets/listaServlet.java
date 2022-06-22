package Servlets;

import Beans.BeanHumano;
import Beans.BeanSuperviviente;
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
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
