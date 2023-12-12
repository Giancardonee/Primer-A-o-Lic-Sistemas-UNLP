/*
Implemente la clase Autor, sabiendo que se caracterizan por nombre, biografía y origen 
y que deben permitir devolver/modificar el valor de sus atributos y devolver una 
representación String formada por nombre, biografía y origen.
 */
package tema3;

/**
 *
 * @author Gianca
 */
public class Autor {
    private String nombre; 
    private String biografia; 
    private String origen; 
    
    // Constructor vacio
    public Autor (){
        
    }
    
    // Constructor con todos sus datos
    public Autor(String nombre, String biografia, String origen) {
        this.nombre = nombre;
        this.biografia = biografia;
        this.origen = origen;
    }
    
    
    // Getters & Setters

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }
    
    public String toString (){
        String aux = "Nombre: "+nombre+ ". Biofrafia: "+biografia+ ". Origen: "+origen ; 
        return aux; 
    }
}
