package com.example;

public class Aplicacion {
    private static int CONTADOR=0;
    private int id;
    private String nombre;
    private String version;

    public Aplicacion(String nombre, String version) {
        this.nombre = nombre;
        this.version = version;
        this.id=++Aplicacion.CONTADOR;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public int getId() {
        return id;
    }

    @Override
    public String toString() {
        return "Aplicacion{" + "id=" + id + ", nombre=" + nombre + ", version=" + version + '}';
    }
}
