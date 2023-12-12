package eje4;

/**
 *
 * @author Usuario
 */
public abstract class SerieDeCoristas {
    private int dimF;
    
    public SerieDeCoristas (int unaDimF){
        this.dimF= unaDimF;
    }
   
    public int getDimF (){
        return dimF;
    }
    
    public abstract void agregarCorista (Corista unCorista);
    public abstract boolean estaLleno ();
    public abstract boolean estaOrdenado ();
    
   

    
}
