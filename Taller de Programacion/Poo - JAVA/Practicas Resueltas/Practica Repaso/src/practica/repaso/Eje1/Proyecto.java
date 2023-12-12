package practica.repaso.Eje1;

/**
 *
 * @author Gianca
 */
public class Proyecto {
    private String nombreProyecto; 
    private int codigo; 
    private String nombreDirector;
    private Investigador investigadores []; 
    private int cantInvestigadores = 50; // cambiar solo esta dimF en el caso de querer modificar la cantidad de elementos del vector
    private int dimL = 0; 
    
    
    public Proyecto (String unNombreProyecto, int unCodigo, String unNombreDirector){
        this.nombreProyecto= unNombreProyecto; 
        this.codigo= unCodigo; 
        this.nombreDirector = unNombreDirector; 
        investigadores = new Investigador [cantInvestigadores];
    }
    
    public void otorgarTodos (String nombre_Completo){
        boolean encontre = false;
        int i=0;
        while ( ( i < this.dimL) && (encontre == false )) {
            if (this.esNombreBuscado(nombre_Completo, investigadores[i].getNombreCompleto())) {
                encontre = true;
                this.investigadores[i].otorgar(); // otorgamos todos sus subsidios
            }
            else {
                i++;
            }
    }     
    }
    
    private boolean esNombreBuscado (String nombreCompleto, String investigadorAct){
        boolean encontre = false; 
        if (investigadorAct.equals(nombreCompleto)){
            encontre= true;
        }
        return encontre;
    } 
    
    public void agregarInvestigador (Investigador unInvestigador){
        int cant_investigadores = this.getDimL();
        if (cant_investigadores < cantInvestigadores){
            investigadores[cant_investigadores] = unInvestigador; 
            this.dimL++;
        }
        else{
            System.out.println("**Error en agregar investigador: "
                    + "Se agregaron todos los investigadores posibles.");
        }
    }
    
    public double dineroTotalOtorgado (){
        double suma = 0 ;
        for (int i=0; i < this.getDimL(); i++ ){
            suma += investigadores[i].devolverDineroPorInvestigador();
        }
        return suma;
    }
    
    public String getNombreProyecto (){
        return this.nombreProyecto;
    }
    
    public String getNombreDirector (){
        return this.nombreDirector;
    }
    
    public int getCodigo (){
        return this.codigo;
    }
    
    public int getDimL(){
        return this.dimL;
    }
    
    
    private String traerInfoInvestigadores (){
        String aux = "";
        for (int i=0; i< this.getDimL(); i++){
            aux += investigadores[i].toString();
            aux += "\n"; 
        }
        return aux;
    }
    
    @Override
    public String toString (){
        String aux; 
        aux = "Proyecto: "+this.getNombreProyecto()+ " codigo "+this.getCodigo()+ " nombre del director: "+this.getNombreDirector()+ " \n"+
                " el total de dinero otorgado para el proyecto es: "+this.dineroTotalOtorgado()+ "\n"+
                this.traerInfoInvestigadores(); 
                
        return aux;
    }
}
