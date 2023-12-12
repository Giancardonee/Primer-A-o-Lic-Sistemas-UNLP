/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Gianca
 */
public class Circulo extends Figura {
    private double radio; 

    public Circulo() {
    }

    public Circulo(String unCR, String unCL) {
        super(unCR, unCL);
    }
    
    public Circulo(String unCR, String unCL,double unRadio) {
        super(unCR, unCL);
        this.setRadio(unRadio);
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    @Override // preguntar si es necesario 
    // metodos abstractos
    public double calcularArea (){
        double area =  Math.PI * Math.pow(this.getRadio(), 2); 
        return area;
    }

    @Override
    public double calcularPerimetro (){
        double perimetro =  2 * Math.PI * (this.getRadio());
        return perimetro;
    }
    
    @Override
    public String toString (){
        String aux; 
        aux = super.toString() + ". Su radio es: "+this.getRadio(); 
        return aux;
    }
    
    
    
}
