/*
 */
package eje4;

/**
 *
 * @author Usuario
 */
public class Persona {
    private String nombre; 
    private int edad;
    private int dni;

    public Persona(String unNombre, int edad, int dni) {
        this.nombre = unNombre;
        this.edad = edad;
        this.dni = dni;
    }

    public String getString() {
        return nombre;
    }

    public int getEdad() {
        return edad;
    }

    public int getDni() {
        return dni;
    }
    
    public String toString (){
        String aux;
        aux = "nombre: "+this.getString()+ " edad: "+this.getEdad()+ " dni: "+this.getDni();
        return aux;
    }
    
    
    
}
