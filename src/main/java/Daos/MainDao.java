package Daos;

import Beans.BeanObjeto;
import Beans.BeanVacunaxtipo;
import Beans.BeanZombie;

import java.sql.*;
import java.util.ArrayList;

//DAO PARA SECCION 5

public class MainDao {

    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/blue1?serverTimezone=America/Lima";

    public ArrayList<BeanObjeto> listarObjetos() {
        ArrayList<BeanObjeto> listaObjetos = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("select * from objetos");) {

            while (rs.next()) {
                BeanObjeto objeto = new BeanObjeto();
                objeto.setIdobjeto(rs.getInt(1));
                objeto.setNombre(rs.getString(2));
                objeto.setPeso(rs.getFloat(3));
                objeto.setTipo(rs.getString(4));
                listaObjetos.add(objeto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaObjetos;
    }

    public ArrayList<BeanVacunaxtipo> listarEfectividad(String vacuna) {
        ArrayList<BeanVacunaxtipo> listaEfectividades = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "select t.nombre, i.porcentaje, o.nombre from objetos o\n" +
                "inner join indiceefectividad i on o.idobjetos = i.idobjetos\n" +
                "inner join tiposzombie t on i.tiposZombie_idtipo = t.idtipo\n" +
                "where o.nombre = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, vacuna);

            try (ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    BeanVacunaxtipo vacunaxtipo = new BeanVacunaxtipo();
                    vacunaxtipo.setTipozombie(rs.getString(1));
                    vacunaxtipo.setPorcentaje(rs.getFloat(2));
                    vacunaxtipo.setNombre(rs.getString(3));
                    listaEfectividades.add(vacunaxtipo);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaEfectividades;
    }

    public void crearObjeto(String nombreObjeto, float masa, String esVacuna) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "INSERT INTO objetos (nombre, masa, esVacuna) VALUES (?, ?, ?);";


        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, nombreObjeto);
            pstmt.setFloat(2, masa);
            pstmt.setString(3, esVacuna);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<BeanVacunaxtipo> listarTipozombie() {
        ArrayList<BeanVacunaxtipo> listaTiposzombie = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("select nombre from tiposzombie");) {

            while (rs.next()) {
                BeanVacunaxtipo vacunaxtipo = new BeanVacunaxtipo();
                vacunaxtipo.setTipozombie(rs.getString(1));
                listaTiposzombie.add(vacunaxtipo);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaTiposzombie;
    }
    public int obtenerIdobjeto(String nombre) {
        int id = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String sql = "select idobjetos from objetos where nombre = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, nombre);

            try (ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    id = id + rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return id;
    }

    public void crearEfectividad(String porcentaje, String idZombie, String idVacuna) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "INSERT INTO indiceefectividad (tiposZombie_idtipo, porcentaje, idobjetos) values (?,?,?)";


        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, Integer.parseInt(idZombie));
            pstmt.setFloat(2, Float.parseFloat(porcentaje));
            pstmt.setInt(3, Integer.parseInt(idVacuna));
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void actualizarObjeto(String nombreObjeto, float masa, String esVacuna, String idobjeto) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE objetos SET nombre = ?, masa = ?, esVacuna = ? where idobjetos = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, nombreObjeto);
            pstmt.setFloat(2, masa);
            pstmt.setString(3, esVacuna);
            pstmt.setInt(4, Integer.parseInt(idobjeto));
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void actualizarEfectividad(String porcentaje, String idZombie, String idVacuna) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE indiceefectividad SET porcentaje = ? where idobjetos = ? and tiposZombie_idtipo = ? ";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setFloat(1, Float.parseFloat(porcentaje));
            pstmt.setInt(3, Integer.parseInt(idZombie));
            pstmt.setInt(2, Integer.parseInt(idVacuna));
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


}