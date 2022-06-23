package Servlets;


import Daos.MainDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "ObjetosServlet", value = "/ObjetosServlet")
public class ObjetosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        MainDao mainDao = new MainDao();

        switch (action) {
            case "listar" -> {
                request.setAttribute("listaObjetos", mainDao.listarObjetos());

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("includes/MenuObjetos.jsp");
                requestDispatcher.forward(request, response);
            }
            case "verEfectividad" -> {
                String vacuna =request.getParameter("vacuna");

                request.setAttribute("listaEfectividades", mainDao.listarEfectividad(vacuna));
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("includes/verEfectividades.jsp");
                requestDispatcher.forward(request, response);
            }
            case "añadirObjeto" -> {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("includes/añadirObjeto.jsp");
                requestDispatcher.forward(request, response);
            }
            case "añadirVacuna" -> {

                request.setAttribute("message", "La masa de la vacuna debe ser menor a 0.5");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("includes/añadirVacuna.jsp");
                requestDispatcher.forward(request, response);
            }
            case "editarObjeto" -> {
                String idObjeto = request.getParameter("idObjeto");
                request.setAttribute("idObjeto", idObjeto);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("includes/editarObjeto.jsp");
                requestDispatcher.forward(request, response);
            }
            case "editarVacuna" -> {
                String idObjeto = request.getParameter("idObjeto");
                request.setAttribute("idObjeto", idObjeto);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("includes/editarVacuna.jsp");
                requestDispatcher.forward(request, response);
            }

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        MainDao mainDao = new MainDao();

        switch (action) {
            case "guardarObjeto" -> {
                String nombreObjeto = request.getParameter("nombreObjeto");
                String masaStr = request.getParameter("masa");
                String esVacuna = request.getParameter("esVacuna");
                try {
                    float masa = Float.parseFloat(masaStr);

                    //Es vacuna
                    if (esVacuna.equals("Si")) {

                        if (masa <= 0.5) {
                            mainDao.crearObjeto(nombreObjeto,masa, esVacuna);
                            int id = mainDao.obtenerIdobjeto(nombreObjeto);
                            request.setAttribute("listaTiposzombie", mainDao.listarTipozombie());
                            request.setAttribute("message", "Las efectividades deben estar entre 0 y 100");
                            request.setAttribute("idVacuna", id);
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("includes/añadirEfectividades.jsp");
                            requestDispatcher.forward(request, response);
                        }
                        else {
                            request.setAttribute("message", "Vacuna NO CREADA, la masa de la vacuna debe ser menor a 0.5");
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("includes/añadirVacuna.jsp");
                            requestDispatcher.forward(request, response);
                        }
                    }
                    else {
                        mainDao.crearObjeto(nombreObjeto,masa, esVacuna);
                        response.sendRedirect(request.getContextPath() + "/ObjetosServlet");
                    }

                } catch (NumberFormatException e) {
                    System.out.println("error al parsear");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("includes/añadirObjeto.jsp");
                    requestDispatcher.forward(request, response);
                }

            }
            case "setEfectividad" -> {
                String idVacuna = request.getParameter("idVacuna");
                String idZombie = request.getParameter("idZombie");
                String porcentaje =request.getParameter("porcentaje");
                mainDao.crearEfectividad(porcentaje,idZombie,idVacuna);

                response.sendRedirect(request.getContextPath() + "/ObjetosServlet?a=guardarObjeto&esVacuna=Si");
            }
            case "actualizarObjeto" -> {
                String idObjeto = request.getParameter("idObjeto");
                String nombreObjeto = request.getParameter("nombreObjeto");
                String masaStr = request.getParameter("masa");
                String esVacuna = request.getParameter("esVacuna");
                try {
                    float masa = Float.parseFloat(masaStr);

                    //Es vacuna
                    if (esVacuna.equals("Si")) {

                        if (masa <= 0.5) {
                            mainDao.actualizarObjeto(nombreObjeto,masa, esVacuna, idObjeto);
                            request.setAttribute("listaTiposzombie", mainDao.listarTipozombie());
                            request.setAttribute("message", "Las efectividades deben estar entre 0 y 100");
                            request.setAttribute("idVacuna", idObjeto);
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("includes/editarEfectividades.jsp");
                            requestDispatcher.forward(request, response);
                        }
                        else {
                            request.setAttribute("message", "Vacuna NO CREADA, la masa de la vacuna debe ser menor a 0.5");
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("includes/añadirVacuna.jsp");
                            requestDispatcher.forward(request, response);
                        }
                    }
                    else {
                        mainDao.actualizarObjeto(nombreObjeto,masa, esVacuna, idObjeto);
                        response.sendRedirect(request.getContextPath() + "/ObjetosServlet");
                    }

                } catch (NumberFormatException e) {
                    System.out.println("error al parsear");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("includes/añadirObjeto.jsp");
                    requestDispatcher.forward(request, response);
                }

            }
            case "editEfectividad" -> {
                String idVacuna = request.getParameter("idVacuna");
                String idZombie = request.getParameter("idZombie");
                String porcentaje =request.getParameter("porcentaje");
                mainDao.actualizarEfectividad(porcentaje,idZombie,idVacuna);

                response.sendRedirect(request.getContextPath() + "/ObjetosServlet?a=actualizarObjeto&esVacuna=Si");
            }


        }
    }
}