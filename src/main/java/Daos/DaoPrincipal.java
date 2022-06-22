package Daos;

import Beans.BeanHumano;

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

}
