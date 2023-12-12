package practica.repaso.Eje3;

/**
 *
 * @author Gianca
 */
public abstract class Recital {
    private String nombreBanda; 
    private String listaTemas[];
    private int cantTemas,temasCargados;
    
    public Recital (String unNombreBanda, int cantidadTemas){
        this.nombreBanda= unNombreBanda; 
        this.cantTemas = cantidadTemas;
        this.temasCargados=0;
        listaTemas = new String [cantTemas]; 
    }
    
    private boolean hayEspacioEnLista (){
        return (this.temasCargados < cantTemas); 
    }
    
    public void agregarTema (String nombreTema){
        if (hayEspacioEnLista() == true){
            this.listaTemas[temasCargados] = nombreTema;
            temasCargados++;
        }
    }
    
    public void actuar (){
        for (int temasTocados=0; temasTocados< this.temasCargados; temasTocados++){
          System.out.println("y ahora tocaremos... "+this.listaTemas[temasTocados]);
        }
    }
    
    
    public abstract double calcularCosto();
    
}
