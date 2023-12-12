package eje4;
/**
 *
 * @author Usuario
 */
public class Coro {
    private String nombre; 
    private Director unDirector; 
    private SerieDeCoristas tipoCoro; 

    public Coro(String unNombre, Director unDire, SerieDeCoristas unTipoCoro) {
        this.nombre = unNombre;
        this.unDirector = unDire;
        this.tipoCoro = unTipoCoro;
    }  
    
    public String toString (){
        String aux;
        aux = "Nombre del coro: "+this.nombre+ "\nDatos del director: "+this.unDirector.toString()+"\n "
                + "Datos de los coritas:\n"+ tipoCoro.toString()+"\n" ; 
        return aux;
    }
    
}
