/*
 */
package eje4;

/**
 *
 * @author Usuario
 */
public class Director extends Persona  {
    private int antiguedad;
    

    public Director(String unNombre,int unaAntiguedad , int edad, int dni) {
        super(unNombre, edad, dni);
        this.antiguedad = unaAntiguedad;
    }
    
   // chequear si va toString 
   public String toString (){
       String aux;
       aux = super.toString()+ " antiguedad:"+this.antiguedad;
       return aux;
   }
    
}
