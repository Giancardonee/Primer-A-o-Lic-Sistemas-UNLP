package practica.repaso.Eje3;

/**
 *
 * @author Gianca
 */
public class Gira extends Recital {
    private String nombre;
    private Fecha fechas [];
    private int diaFechaProx,cantFechas, fechasCargadas;
    
    
    public Gira (String nombreBanda, int cantTemas,String nombreGira, int cantFechas){
       super(nombreBanda,cantTemas);
        this.cantFechas = cantFechas;
        this.setNombre(nombreGira);
        fechas = new Fecha [cantFechas];
        this.fechasCargadas=0;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public int getCantFechas (){
        return this.cantFechas;
    }
    
    private int getFechasCargadas (){
        return this.fechasCargadas;
    }
    
    public void agregarFecha (Fecha f){
        if (this.fechasCargadas < this.getCantFechas()){
            fechas[this.fechasCargadas] = f;
            fechasCargadas++;
        }
    }
    
    @Override
    public double calcularCosto (){
        return (this.getFechasCargadas()* 30000);
    }
    
   
    @Override
    public void actuar (){
        for (int i=0; i < this.getFechasCargadas(); i++){
            System.out.println("Buenas noches... "+this.fechas[i].getCiudad());
            super.actuar();
        }
    
    }
    
}
