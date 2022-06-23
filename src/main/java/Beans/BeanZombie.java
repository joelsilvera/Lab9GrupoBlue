package Beans;

import java.sql.Timestamp;

public class BeanZombie {
    private String idZombie;
    private String nombre;
    private String apellido;
    private String sexo;
    private int tiempoInfectado;
    private String varianteVirus;
    private int victimas;
    private String tipo;


    public String getIdZombie() {
        return idZombie;
    }

    public void setIdZombie(String idZombie) {
        this.idZombie = idZombie;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public int getTiempoInfectado() {
        return tiempoInfectado;
    }

    public void setTiempoInfectado(int tiempoInfectado) {
        this.tiempoInfectado = tiempoInfectado;
    }

    public String getVarianteVirus() {
        return varianteVirus;
    }

    public void setVarianteVirus(String varianteVirus) {
        this.varianteVirus = varianteVirus;
    }

    public int getVictimas() {
        return victimas;
    }

    public void setVictimas(int victimas) {
        this.victimas = victimas;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}
