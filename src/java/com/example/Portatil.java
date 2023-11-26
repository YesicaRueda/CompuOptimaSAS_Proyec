package com.example;

import java.util.ArrayList;

public class Portatil {
    private long serial;
    private String marca;
    private int ram;
    private String tipoDD;
    private boolean esWindows;
    
    private ArrayList<Aplicacion> aplicaciones;

    public Portatil(long serial, String marca, int ram, String string1, boolean aBoolean) {
        this.serial = serial;
        this.marca = marca;
        this.ram = ram;
        this.aplicaciones=new ArrayList();
    }

    public long getSerial() {
        return serial;
    }

    public void setSerial(long serial) {
        this.serial = serial;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getRam() {
        return ram;
    }

    public void setRam(int ram) {
        this.ram = ram;
    }

    public String getTipoDD() {
        return tipoDD;
    }

    public void setTipoDD(String tipoDD) {
        this.tipoDD = tipoDD;
    }

    public boolean isEsWindows() {
        return esWindows;
    }

    public void setEsWindows(boolean esWindows) {
        this.esWindows = esWindows;
    }

    public ArrayList<Aplicacion> getAplicaciones() {
        return aplicaciones;
    }
    
    public void addAplicacion(Aplicacion app) {
        this.aplicaciones.add(app);
    }

    @Override
    public String toString() {
        return "Portatil{" + "serial=" + serial + ", marca=" + marca + ", ram=" + ram + ", tipoDD=" + tipoDD + ", esWindows=" + esWindows + '}';
    }
}
