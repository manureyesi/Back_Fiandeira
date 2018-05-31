/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author 6001111
 */
public class productos {
    
    private String codigo;
    private String nombre;
    private String descripcion;
    private double precioSin;
    private double IVA;
    private double precioIVA;

    public productos(String codigo, String nombre, String descripcion, double precioSin) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precioSin = precioSin;
        
        cacularIVA();
        
    }
    
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecioSin() {
        return precioSin;
    }

    public void setPrecioSin(double precioSin) {
        this.precioSin = precioSin;
        
        cacularIVA();
        
    }

    public double getIVA() {
        return IVA;
    }

    public double getPrecioIVA() {
        return precioIVA;
    }

    private void cacularIVA(){
        
        this.IVA = this.precioSin * 0.21;
        this.precioIVA = this.IVA + this.precioSin;
    
    }
            
}
