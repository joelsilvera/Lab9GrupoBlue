package Daos;

import Beans.BeanHumano;
import Beans.BeanSuperviviente;
import Beans.BeanVariante;
import Beans.BeanZombie;

import java.sql.*;
import java.util.ArrayList;

public class DaoPrincipal {

    public ArrayList<BeanHumano> listarHumano(){
        ArrayList<BeanHumano> listaHumano = new ArrayList<>();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/blue1?serverTimezone=America/Lima";

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        String sql = "select * from humanos";
        try(Connection connection = DriverManager.getConnection(url,user,pass);
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);){

            while (rs.next()){
                BeanHumano humano = new BeanHumano();
                humano.setIdHumano(rs.getString(1));
                humano.setNombreHumano(rs.getString(2));
                humano.setApellidoHumano(rs.getString(3));
                humano.setSexoHumano(rs.getString(4));
                humano.setEstadoHumano(rs.getString(5));
                listaHumano.add(humano);
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return listaHumano;
    }


    public ArrayList<BeanSuperviviente> listarSuperviviente() {
        ArrayList<BeanSuperviviente> listaSuperviviente = new ArrayList<>();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/blue1?serverTimezone=America/Lima";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "SELECT s.idsupervivientes, idhumanos , nombre , apellido, sexo, peso, fuerza, tabla1.nombrePareja, tabla1.apellidoPareja, tabla2.MasaCargada\n" +
                "\t\tFROM humanos h \n" +
                "        inner join supervivientes s on (h.idHumanos = s.Humanos_idHumanos)\n" +
                "        left join (SELECT idsupervivientes, nombre as nombrePareja, apellido as apellidoPareja\n" +
                "\t\t\t\t\tFROM humanos h inner join supervivientes s on (h.idhumanos = s.humanos_idhumanos))\n" +
                "                    tabla1 on (tabla1.idsupervivientes = s.idPareja)\n" +
                "        inner join (SELECT subquery.idSuperviviente as 'IdSuperviviente',\n" +
                "\t\t\t\t\t\tsum(subquery.masaTotal) as 'MasaCargada'\n" +
                "\t\t\t\t\tFROM (SELECT supervivientes_idsupervivientes as idSuperviviente, \n" +
                "\t\t\t\t\tcantidad*masa as masaTotal\n" +
                "\t\t\t\t\tFROM superviviente_has_objetos so \t\n" +
                "\t\t\t\t\tinner join objetos o on (o.idobjetos = so.objetos_idobjetos)\n" +
                "\t\t\t\t\torder by supervivientes_idsupervivientes) as subquery\n" +
                "\t\t\t\t\tGROUP BY subquery.idSuperviviente\n" +
                "\t\t\t\t\tORDER BY subquery.idSuperviviente) tabla2 on (tabla2.IdSuperviviente = s.idsupervivientes);";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            while (rs.next()) {
                BeanSuperviviente superviviente = new BeanSuperviviente();
                superviviente.setIdSuperviviente(rs.getString(2));
                superviviente.setNombre(rs.getString(3));
                superviviente.setApellido(rs.getString(4));
                superviviente.setSexo(rs.getString(5));
                superviviente.setPeso(rs.getDouble(6));
                superviviente.setFuerza(rs.getDouble(7));
                superviviente.setNombrePareja(rs.getString(8));
                superviviente.setApellidoPareja(rs.getString(9));
                superviviente.setPesoCargado(rs.getDouble(10));
                listaSuperviviente.add(superviviente);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaSuperviviente;
    }



    public ArrayList<BeanVariante> listarVariante() {
        ArrayList<BeanVariante> listaVariante = new ArrayList<>();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/blue1?serverTimezone=America/Lima";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "SELECT h.idvirus, h.nombre, s.idvariantes, s.nombre, tabla1.Casos  FROM virus h \n" +
                "                inner join variantesvirus s on (h.idvirus = s.virus_idvirus)\n" +
                "                left join zombies z on (z.variantes_idvariantes = s.idvariantes)\n" +
                "                left join (SELECT variantes_idvariantes, COUNT(variantes_idvariantes) as 'Casos' from zombies\n" +
                "\t\t\t\t\t\t\tgroup by variantes_idvariantes)\n" +
                "                tabla1 on (tabla1.variantes_idvariantes = s.idvariantes) group by s.nombre;";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            while (rs.next()) {
                BeanVariante variante = new BeanVariante();
                variante.setIdVirus(Integer.parseInt(rs.getString(1)));
                variante.setNombreVirus(rs.getString(2));
                variante.setIdVariante(Integer.parseInt(rs.getString(3)));
                variante.setNombreVariante(rs.getString(4));
                variante.setCasos(Integer.parseInt(rs.getString(5)));
                listaVariante.add(variante);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaVariante;
    }

    public void borrarVariante(String codigo) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/blue1?serverTimezone=America/Lima";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "DELETE zombies , variantesvirus  FROM zombies  INNER JOIN variantesvirus\n" +
                "WHERE variantesvirus.idvariantes= zombies.variantes_idvariantes and variantesvirus.idvariantes = ?;";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, Integer.parseInt(codigo));
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


    public ArrayList<BeanZombie> listarZombie() {
        ArrayList<BeanZombie> listaZombie = new ArrayList<>();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/blue1?serverTimezone=America/Lima";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "SELECT idhumanos , h.nombre , apellido, sexo, tabla1.DiferenciaHoras, v.nombre, s.numeroDeVictimas, t.nombre\n" +
                "                FROM humanos h \n" +
                "                inner join zombies s on (h.idHumanos = s.Humanos_idHumanos)\n" +
                "                left join (SELECT idzombies, (DATEDIFF(CURRENT_DATE(),fechaInfeccion))*24 AS 'DiferenciaHoras' FROM zombies)\n" +
                "                tabla1 on (tabla1.idzombies = s.idzombies)\n" +
                "                inner join variantesvirus v on (s.variantes_idvariantes = v.idvariantes)\n" +
                "                inner join tiposzombie t on (t.idtipo = s.tipo_idtipo);";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            while (rs.next()) {
                BeanZombie zombie = new BeanZombie();
                zombie.setIdZombie(rs.getString(1));
                zombie.setNombre(rs.getString(2));
                zombie.setApellido(rs.getString(3));
                zombie.setSexo(rs.getString(4));
                zombie.setTiempoInfectado(rs.getInt(5));
                zombie.setVarianteVirus(rs.getString(6));
                zombie.setVictimas(rs.getInt(7));
                zombie.setTipo(rs.getString(8));
                listaZombie.add(zombie);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaZombie;
    }
}
