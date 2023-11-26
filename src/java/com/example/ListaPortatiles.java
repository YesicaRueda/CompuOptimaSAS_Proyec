package com.example;

import java.util.ArrayList;

public class ListaPortatiles {
    private ArrayList<Portatil> portatiles;

    public ListaPortatiles() {
        this.portatiles = new ArrayList();
    }
    
    public void addPortatil(Portatil portatil) {
        this.portatiles.add(portatil);
    }

    public ArrayList<Portatil> getPortatiles() {
        return portatiles;
    }
    
    public Portatil getPortatil(long serial) {
        Portatil p = null;
        for (int i=0; i<this.portatiles.size(); i++) {
            Portatil portatil = portatiles.get(i);
            if (portatil.getSerial()==serial) {
                p=portatil;
                break;
            }
        }
        return p;
    }
    
    public boolean deletePortatil(long serial) {
        boolean delete = false;
        for (int i=0; i<this.portatiles.size(); i++) {
            Portatil p = this.portatiles.get(i);
            if (p.getSerial()==serial) {
                this.portatiles.remove(p);
                delete=true;
                break;
            }
        }
        return delete;  
    }
    
    public void updatePortatil(long serial, Portatil portatil) {
        for (int i=0; i<this.portatiles.size(); i++) {
            Portatil p = this.portatiles.get(i);
            if (p.getSerial()==serial) {
                this.portatiles.set(i, portatil);
                break;
            }
        }
    }
}
