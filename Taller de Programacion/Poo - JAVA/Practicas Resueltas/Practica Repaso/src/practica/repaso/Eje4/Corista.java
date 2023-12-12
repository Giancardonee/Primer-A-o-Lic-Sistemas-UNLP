package eje4;
/**
 *
 * @author Usuario
 */
public class Corista extends Persona {
    private int tono; 

    public Corista(int tono, String unNombre, int edad, int dni) {
        super(unNombre, edad, dni);
        this.tono = tono;
    }
    
    public int getTono (){
        return this.tono;
    }
    
    public String toString (){
        String aux;
        aux = super.toString() +" tono fundamental: "+this.tono;
        return aux;
    }
    
    
}
